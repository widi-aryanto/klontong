import 'package:dartz/dartz.dart';
import 'package:klontong/data/helper/failure_exception.dart';
import 'package:klontong/domain/entity/data_list.dart';
import 'package:klontong/domain/repository/repository.dart';

class HomeUsecase {
  final Repository repository;

  HomeUsecase(this.repository);

  Future<Either<FailureException, DataList>> getListData() {
    return repository.getList();
  }

  Future<Either<FailureException, DataList>> getSearch(String data) {
    return repository.getSearch(data);
  }
}