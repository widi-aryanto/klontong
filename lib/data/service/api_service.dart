import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:http/io_client.dart';
import 'package:klontong/data/model/detail_model.dart';
import 'package:klontong/data/model/list_model.dart';

class ApiService {
  final http.Client httpClient;
  final IOClient? ioClient;
  late final http.Client client;

  ApiService({
    required this.httpClient,
    this.ioClient,
  }) : client = ioClient ?? httpClient;

  Future<ListModel> listData() async {
    final response = await client.get(
      Uri.parse("https://my-json-server.typicode.com/widi-aryanto/klontong/list"),
    );
    return ListModel.fromJson(json.decode(response.body));
  }

  Future<DetailModel> data(int id) async {
    final response = await client.get(
      Uri.parse("https://my-json-server.typicode.com/widi-aryanto/klontong/detail"),
    );
    return DetailModel.fromJson(json.decode(response.body));
  }

  Future<ListModel> searchData(String param) async {
    final response = await client.get(
      Uri.parse("https://my-json-server.typicode.com/widi-aryanto/klontong/search"),
    );
    return ListModel.fromJson(json.decode(response.body));
  }
}