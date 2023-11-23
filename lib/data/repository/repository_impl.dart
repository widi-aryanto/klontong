import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:klontong/data/helper/failure_exception.dart';
import 'package:klontong/data/source/remote_data_source.dart';
import 'package:klontong/domain/entity/data_detail.dart';
import 'package:klontong/domain/entity/data_list.dart';
import 'package:klontong/domain/repository/repository.dart';

class RepositoryImpl extends Repository {
  final RemoteDataSource remote;

  RepositoryImpl({
    required this.remote,
  });

  @override
  Future<Either<FailureException, DataList>> getList() async {
    try {
      final result = await remote.getListData();
      return Right(result.toEntity());
    } on SocketException {
      return const Left(FailureException('No Internet Connection'));
    } catch (e) {
      return const Left(FailureException('Failed to load list'));
    }
  }

  @override
  Future<Either<FailureException, DataDetail>> getData(int id) async {
    try {
      final result = await remote.getData(id);
      return Right(result.toEntity());
    } on SocketException {
      return const Left(FailureException('No Internet Connection'));
    } catch (e) {
      return const Left(FailureException('Failed to load data'));
    }
  }

  @override
  Future<Either<FailureException, DataList>> getSearch(String param) async {
    try {
      final result = await remote.getSearchData(param);
      return Right(result.toEntity());
    } on SocketException {
      return const Left(FailureException('No Internet Connection'));
    } catch (e) {
      return const Left(FailureException('Failed to load list'));
    }
  }

  @override
  Future<Either<FailureException, String>> addData(String data) async {
    try {
      final result = await remote.addData(data);
      return Right(result);
    } on SocketException {
      return const Left(FailureException('No Internet Connection'));
    } catch (e) {
      return const Left(FailureException('Failed to load list'));
    }
  }
}