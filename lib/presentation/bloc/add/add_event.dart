part of 'add_bloc.dart';

abstract class AddEvent extends Equatable {
  const AddEvent();

  @override
  List<Object> get props => [];
}

class CategoryChanged extends AddEvent {
  const CategoryChanged({required this.category});

  final String category;

  @override
  List<Object> get props => [category];
}

class SKUChanged extends AddEvent {
  const SKUChanged({required this.sku});

  final String sku;

  @override
  List<Object> get props => [sku];
}

class NameChanged extends AddEvent {
  const NameChanged({required this.name});

  final String name;

  @override
  List<Object> get props => [name];
}

class DescriptionChanged extends AddEvent {
  const DescriptionChanged({required this.description});

  final String description;

  @override
  List<Object> get props => [description];
}

class WeightChanged extends AddEvent {
  const WeightChanged({required this.weight});

  final String weight;

  @override
  List<Object> get props => [weight];
}

class WidthChanged extends AddEvent {
  const WidthChanged({required this.width});

  final String width;

  @override
  List<Object> get props => [width];
}

class LengthChanged extends AddEvent {
  const LengthChanged({required this.length});

  final String length;

  @override
  List<Object> get props => [length];
}

class HeightChanged extends AddEvent {
  const HeightChanged({required this.height});

  final String height;

  @override
  List<Object> get props => [height];
}

class ImageChanged extends AddEvent {
  const ImageChanged({required this.image});

  final String image;

  @override
  List<Object> get props => [image];
}

class PriceChanged extends AddEvent {
  const PriceChanged({required this.price});

  final String price;

  @override
  List<Object> get props => [price];
}

class FormSubmitted extends AddEvent {}