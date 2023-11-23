part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<DataModel> listData;
  final String message;

  const HomeLoaded(this.listData, this.message);

  @override
  List<Object> get props => [listData, message];
}

class HomeNoData extends HomeState {
  final String message;

  const HomeNoData(this.message);

  @override
  List<Object> get props => [message];
}

class HomeError extends HomeState {
  final String message;

  const HomeError(this.message);

  @override
  List<Object> get props => [message];
}