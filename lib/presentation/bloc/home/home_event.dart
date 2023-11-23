part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class LoadData extends HomeEvent {
  const LoadData();
}

class HomeSearch extends HomeEvent {
  final String data;

  const HomeSearch({required this.data});

  @override
  List<Object> get props => [data];
}