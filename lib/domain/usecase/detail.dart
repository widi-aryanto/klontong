import 'package:dartz/dartz.dart';
import 'package:klontong/data/helper/failure_exception.dart';
import 'package:klontong/domain/entity/data_detail.dart';
import 'package:klontong/domain/repository/repository.dart';

class DetailUsecase {
  final Repository repository;

  DetailUsecase(this.repository);

  Future<Either<FailureException, DataDetail>> getData(int id) {
    return repository.getData(id);
  }
}