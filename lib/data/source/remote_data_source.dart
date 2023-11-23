import 'package:klontong/data/model/detail_model.dart';
import 'package:klontong/data/model/list_model.dart';
import 'package:klontong/data/service/api_service.dart';

abstract class RemoteDataSource {
  Future<ListModel> getListData();
  Future<DetailModel> getData(int id);
  Future<ListModel> getSearchData(String data);
  Future<String> addData(String data);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final ApiService apiService;

  RemoteDataSourceImpl(
    this.apiService,
  );

  @override
  Future<ListModel> getListData() async {
    final response = await apiService.listData();
    return response;
  }

  @override
  Future<DetailModel> getData(int id) async {
    final response = await apiService.data(id);
    return response;
  }

  @override
  Future<ListModel> getSearchData(String data) async {
    final response = await apiService.searchData(data);
    return response;
  }

  @override
  Future<String> addData(String data) async {
    print(data);
    return "success";
  }
}