import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:klontong/domain/entity/data.dart';

class DataModel extends Equatable {
  const DataModel({
    required this.id,
    required this.categoryId,
    required this.categoryName,
    required this.sku,
    required this.name,
    required this.description,
    required this.weight,
    required this.width,
    required this.length,
    required this.height,
    required this.image,
    required this.price,
  });

  final int id;
  final int categoryId;
  final String categoryName;
  final String sku;
  final String name;
  final String description;
  final int weight;
  final int width;
  final int length;
  final int height;
  final String image;
  final int price;

  factory DataModel.fromRawJson(String str) =>
      DataModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DataModel.fromJson(Map<String, dynamic> json) =>
      DataModel(
        id: json["id"],
        categoryId: json["CategoryId"],
        categoryName: json["categoryName"],
        sku: json["sku"],
        name: json["name"],
        description: json["description"],
        weight: json["weight"],
        width: json["width"],
        length: json["length"],
        height: json["height"],
        image: json["image"],
        price: json["harga"]
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "CategoryId": categoryId,
    "categoryName": categoryName,
    "sku": sku,
    "name": name,
    "description": description,
    "weight": weight,
    "width": width,
    "length": length,
    "height": height,
    "image": image,
    "harga": price,
  };

  Data toEntity() => Data(
    id: id,
    categoryId: categoryId,
    categoryName: categoryName,
    sku: sku,
    name: name,
    description: description,
    weight: weight,
    width: width,
    length: length,
    height: height,
    image: image,
    price: price,
  );

  factory DataModel.fromEntity(Data data) =>
      DataModel(
        id: data.id,
        categoryId: data.categoryId,
        categoryName: data.categoryName,
        sku: data.sku,
        name: data.name,
        description: data.description,
        weight: data.weight,
        width: data.width,
        length: data.length,
        height: data.height,
        image: data.image,
        price: data.price,
      );

  @override
  List<Object?> get props => [
    id,
    categoryId,
    categoryName,
    sku,
    name,
    description,
    weight,
    width,
    length,
    height,
    image,
    price,
  ];
}