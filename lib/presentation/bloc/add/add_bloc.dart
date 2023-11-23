import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart' as m;
import 'package:formz/formz.dart';
import 'package:klontong/data/model/add/category.dart';
import 'package:klontong/data/model/add/description.dart';
import 'package:klontong/data/model/add/height.dart';
import 'package:klontong/data/model/add/image.dart';
import 'package:klontong/data/model/add/length.dart';
import 'package:klontong/data/model/add/name.dart';
import 'package:klontong/data/model/add/price.dart';
import 'package:klontong/data/model/add/sku.dart';
import 'package:klontong/data/model/add/weight.dart';
import 'package:klontong/data/model/add/width.dart';
import 'package:klontong/data/model/data_model.dart';
import 'package:klontong/domain/usecase/add.dart';
import 'package:klontong/utils/navigation/navigation_helper.dart';
import 'package:klontong/utils/routes/route_helper.dart';

part 'add_event.dart';
part 'add_state.dart';


class AddBloc extends Bloc<AddEvent, AddState> {
  final AddUsecase usecase;

  AddBloc({required this.usecase}) : super(const AddState()) {
    on<CategoryChanged>(_onCategoryChanged);
    on<SKUChanged>(_onSKUChanged);
    on<NameChanged>(_onNameChanged);
    on<DescriptionChanged>(_onDescriptionChanged);
    on<WeightChanged>(_onWeightChanged);
    on<WidthChanged>(_onWidthChanged);
    on<LengthChanged>(_onLengthChanged);
    on<HeightChanged>(_onHeightChanged);
    on<ImageChanged>(_onImageChanged);
    on<PriceChanged>(_onPriceChanged);
    on<FormSubmitted>(_onFormSubmitted);
  }

  void _onCategoryChanged(CategoryChanged event, Emitter<AddState> emit) {
    final category = Category.dirty(event.category);
    emit(
      state.copyWith(
        category: category.isValid ? category : const Category.pure(),
        isValid: Formz.validate([category, state.category]),
      ),
    );
  }

  void _onSKUChanged(SKUChanged event, Emitter<AddState> emit) {
    final sku = SKU.dirty(event.sku);
    emit(
      state.copyWith(
        sku: sku.isValid ? sku : const SKU.pure(),
        isValid: Formz.validate([sku, state.sku]),
      ),
    );
  }

  void _onNameChanged(NameChanged event, Emitter<AddState> emit) {
    final name = Name.dirty(event.name);
    emit(
      state.copyWith(
        name: name.isValid ? name : const Name.pure(),
        isValid: Formz.validate([name, state.name]),
      ),
    );
  }

  void _onDescriptionChanged(DescriptionChanged event, Emitter<AddState> emit) {
    final description = Description.dirty(event.description);
    emit(
      state.copyWith(
        description: description.isValid ? description : const Description.pure(),
        isValid: Formz.validate([description, state.description]),
      ),
    );
  }

  void _onWeightChanged(WeightChanged event, Emitter<AddState> emit) {
    final weight = Weight.dirty(int.parse(event.weight));
    emit(
      state.copyWith(
        weight: weight.isValid ? weight : const Weight.pure(),
        isValid: Formz.validate([weight, state.weight]),
      ),
    );
  }

  void _onWidthChanged(WidthChanged event, Emitter<AddState> emit) {
    final width = Width.dirty(int.parse(event.width));
    emit(
      state.copyWith(
        width: width.isValid ? width : const Width.pure(),
        isValid: Formz.validate([width, state.width]),
      ),
    );
  }

  void _onLengthChanged(LengthChanged event, Emitter<AddState> emit) {
    final length = Length.dirty(int.parse(event.length));
    emit(
      state.copyWith(
        length: length.isValid ? length : const Length.pure(),
        isValid: Formz.validate([length, state.length]),
      ),
    );
  }

  void _onHeightChanged(HeightChanged event, Emitter<AddState> emit) {
    final height = Height.dirty(int.parse(event.height));
    emit(
      state.copyWith(
        height: height.isValid ? height : const Height.pure(),
        isValid: Formz.validate([height, state.height]),
      ),
    );
  }

  void _onImageChanged(ImageChanged event, Emitter<AddState> emit) {
    final image = Image.dirty(event.image);
    emit(
      state.copyWith(
        image: image.isValid ? image : const Image.pure(),
        isValid: Formz.validate([image, state.image]),
      ),
    );
  }

  void _onPriceChanged(PriceChanged event, Emitter<AddState> emit) {
    final price = Price.dirty(int.parse(event.price));
    emit(
      state.copyWith(
        price: price.isValid ? price : const Price.pure(),
        isValid: Formz.validate([price, state.price]),
      ),
    );
  }

  Future<void> _onFormSubmitted(FormSubmitted event, Emitter<AddState> emit) async {
    final category = Category.dirty(state.category.value);
    final sku = SKU.dirty(state.sku.value);
    final name = Name.dirty(state.name.value);
    final description = Description.dirty(state.description.value);
    final weight = Weight.dirty(state.weight.value);
    final width = Width.dirty(state.width.value);
    final length = Length.dirty(state.length.value);
    final height = Height.dirty(state.height.value);
    final image = Image.dirty(state.image.value);
    final price = Price.dirty(state.price.value);
    emit(
      state.copyWith(
        category: category,
        sku: sku,
        name: name,
        description: description,
        weight: weight,
        width: width,
        length: length,
        height: height,
        image: image,
        price: price,
        isValid: Formz.validate([category, sku, name, description, weight,
          width, length, height, image, price]),
      ),
    );
    if (state.isValid) {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      final result = await usecase.addData(
          jsonEncode(DataModel(
            id: 0,
            categoryId: 14,
            categoryName: category.value,
            sku: sku.value,
            name: name.value,
            description: description.value,
            weight: weight.value ?? 0,
            width: width.value ?? 0,
            length: length.value ?? 0,
            height: height.value ?? 0,
            image: image.value,
            price: price.value ?? 0,
          ).toJson())
      );
      result.fold((failure) => emit(state.copyWith(status: FormzSubmissionStatus.failure)), (success) {
        if (success == "success") {
          emit(state.copyWith(
            category: const Category.dirty(''),
            sku: const SKU.dirty(''),
            name: const Name.dirty(''),
            description: const Description.dirty(''),
            weight: const Weight.dirty(null),
            width: const Width.dirty(null),
            length: const Length.dirty(null),
            height: const Height.dirty(null),
            image: const Image.dirty(''),
            price: const Price.dirty(null),
            status: FormzSubmissionStatus.success,
          ));
          NavigationHelper.navigateAndRemoveUntil(
              homeRoute, (m.Route<dynamic> route) => false
          );
        } else {
          emit(state.copyWith(status: FormzSubmissionStatus.failure));
        }
      });
    }
  }
}