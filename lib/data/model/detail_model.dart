import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:klontong/data/model/data_model.dart';
import 'package:klontong/domain/entity/data_detail.dart';

class DetailModel extends Equatable {
  const DetailModel({
    required this.status,
    required this.message,
    required this.data,
  });

  final String status;
  final String message;
  final DataModel data;

  factory DetailModel.fromRawJson(String str) =>
      DetailModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DetailModel.fromJson(Map<String, dynamic> json) =>
      DetailModel(
        status: json["status"],
        message: json["message"],
        data: DataModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data,
  };

  DataDetail toEntity() => DataDetail(
    status: status,
    message: message,
    data: data,
  );

  factory DetailModel.fromEntity(DataDetail detail) =>
      DetailModel(
        status: detail.status,
        message: detail.message,
        data: detail.data,
      );

  @override
  List<Object?> get props => [status, message, data];
}