part of 'detail_bloc.dart';

abstract class DetailEvent extends Equatable {
  const DetailEvent();

  @override
  List<Object> get props => [];
}

class DetailData extends DetailEvent {
  final int id;

  const DetailData(this.id);

  @override
  List<Object> get props => [id];
}