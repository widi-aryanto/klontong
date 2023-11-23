import 'package:dartz/dartz.dart';
import 'package:klontong/data/helper/failure_exception.dart';
import 'package:klontong/domain/entity/data_detail.dart';
import 'package:klontong/domain/entity/data_list.dart';

abstract class Repository{
  Future<Either<FailureException, DataList>> getList();
  Future<Either<FailureException, DataDetail>> getData(int id);
  Future<Either<FailureException, DataList>> getSearch(String param);
  Future<Either<FailureException, String>> addData(String data);
}