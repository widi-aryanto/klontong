import 'package:dartz/dartz.dart';
import 'package:klontong/data/helper/failure_exception.dart';
import 'package:klontong/domain/repository/repository.dart';

class AddUsecase {
  final Repository repository;

  AddUsecase(this.repository);

  Future<Either<FailureException, String>> addData(String data) {
    return repository.addData(data);
  }
}