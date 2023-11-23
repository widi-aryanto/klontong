import 'package:get_it/get_it.dart';
import 'package:http/io_client.dart';
import 'package:http/http.dart' as http;
import 'package:klontong/data/repository/repository_impl.dart';
import 'package:klontong/data/service/api_service.dart';
import 'package:klontong/data/source/remote_data_source.dart';
import 'package:klontong/domain/repository/repository.dart';
import 'package:klontong/domain/usecase/add.dart';
import 'package:klontong/domain/usecase/detail.dart';
import 'package:klontong/domain/usecase/home.dart';
import 'package:klontong/presentation/bloc/add/add_bloc.dart';
import 'package:klontong/presentation/bloc/detail/detail_bloc.dart';
import 'package:klontong/presentation/bloc/home/home_bloc.dart';
import 'package:klontong/presentation/bloc/language/language_bloc.dart';

final getIt = GetIt.instance;

Future<void> setup() async {

  /// bloc
  getIt.registerFactory<HomeBloc>(() => HomeBloc(
    usecase: getIt(),
  ));
  getIt.registerFactory<DetailBloc>(() => DetailBloc(
    usecase: getIt(),
  ));
  getIt.registerFactory<AddBloc>(() => AddBloc(
    usecase: getIt(),
  ));
  getIt.registerFactory<LanguageBloc>(() => LanguageBloc());

  /// usecase
  getIt.registerLazySingleton<HomeUsecase>(() => HomeUsecase(
    getIt(),
  ));
  getIt.registerLazySingleton<DetailUsecase>(() => DetailUsecase(
    getIt(),
  ));
  getIt.registerLazySingleton<AddUsecase>(() => AddUsecase(
    getIt(),
  ));

  /// repository (abstract class)
  getIt.registerLazySingleton<Repository>(() => RepositoryImpl(
    remote: getIt(),
  ));

  /// source (abstract class)
  getIt.registerLazySingleton<RemoteDataSource>(
          () => RemoteDataSourceImpl(
        getIt(),
      ));

  /// service
  getIt.registerLazySingleton<ApiService>(() => ApiService(
    httpClient: getIt(),
    ioClient: getIt(),
  ));

  /// external
  getIt.registerFactory<IOClient>(() => IOClient());
  getIt.registerFactory<http.Client>(() => http.Client());
}