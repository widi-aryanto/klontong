import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:klontong/data/model/data_model.dart';
import 'package:klontong/domain/usecase/home.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeUsecase usecase;
  final List<DataModel> _data = [];

  HomeBloc({required this.usecase}) : super(HomeInitial()) {
    on<LoadData>((event, emit) async {
      final result = await usecase.getListData();
      result.fold((failure) => emit(HomeError(failure.message)), (success) {
        if (success.status == "success") {
          _data.addAll(success.data);
          emit(HomeLoaded(_data, success.status));
        } else {
          emit(HomeNoData(success.status));
        }
      });
    });
    on<HomeSearch>((event, emit) async {
      var data = event.data;
      final result = await usecase.getSearch(data);
      result.fold((failure) => emit(HomeError(failure.message)), (success) {
        if (success.status == "success") {
          emit(HomeLoaded(success.data, success.status));
        } else {
          emit(HomeNoData(success.status));
        }
      });
    });
  }
}