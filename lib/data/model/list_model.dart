import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:klontong/data/model/data_model.dart';
import 'package:klontong/domain/entity/data_list.dart';

class ListModel extends Equatable {
  const ListModel({
    required this.status,
    required this.message,
    required this.data,
  });

  final String status;
  final String message;
  final List<DataModel> data;

  factory ListModel.fromRawJson(String str) =>
      ListModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ListModel.fromJson(Map<String, dynamic> json) => ListModel(
    status: json["status"],
    message: json["message"],
    data: List<DataModel>.from(json["data"].map((data) => DataModel.fromJson(data)).toList()),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data
  };

  DataList toEntity() => DataList(
    status: status,
    message: message,
    data: data
  );

  factory ListModel.fromEntity(DataList data) => ListModel(
    status: data.status,
    message: data.message,
    data: data.data
  );

  @override
  List<Object?> get props => [status, message, data];
}