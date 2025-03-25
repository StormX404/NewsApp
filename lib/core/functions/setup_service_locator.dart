import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:news_app/core/services/api_service.dart';
import 'package:news_app/features/news/data/data_sources/home_local_data_source.dart';
import 'package:news_app/features/news/data/data_sources/home_remote_data_source.dart';
import 'package:news_app/features/news/data/repos/news_repo_impl.dart';
import 'package:news_app/features/news/domain/use_cases/fetch_all_news_use_case.dart';
import 'package:news_app/features/news/domain/use_cases/speak_use_case.dart';
import 'package:news_app/features/news/domain/use_cases/stop_use_case.dart';

/// Global service locator instance using GetIt
final getIt = GetIt.instance;

void setupServiceLocator() {


  getIt.registerLazySingleton<ApiService>(() => ApiService(Dio()));

  getIt.registerLazySingleton<HomeLocalDataSourceImpl>(
      () => HomeLocalDataSourceImpl());
  getIt.registerLazySingleton<HomeRemoteDataSourceImpl>(
    () => HomeRemoteDataSourceImpl(getIt<ApiService>()),
  );

  getIt.registerLazySingleton<NewsRepoImpl>(
    () => NewsRepoImpl(
      homeLocalDataSource: getIt<HomeLocalDataSourceImpl>(),
      homeRemoteDataSource: getIt<HomeRemoteDataSourceImpl>(),
    ),
  );

  getIt.registerLazySingleton<FetchAllNewsUseCase>(
      () => FetchAllNewsUseCase(getIt<NewsRepoImpl>()));
  getIt.registerLazySingleton<SpeakUseCase>(
      () => SpeakUseCase(getIt<NewsRepoImpl>()));
  getIt.registerLazySingleton<StopUseCase>(
      () => StopUseCase(getIt<NewsRepoImpl>()));
}
