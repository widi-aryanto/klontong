import 'package:equatable/equatable.dart';
import 'package:klontong/data/model/data_model.dart';

class DataList extends Equatable {
  const DataList({
    required this.status,
    required this.message,
    required this.data,
  });

  final String status;
  final String message;
  final List<DataModel> data;

  @override
  List<Object?> get props => [status, message, data];
}