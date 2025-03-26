import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:news_app/core/services/api_service.dart';
import 'package:news_app/features/news/data/data_sources/home_local_data_source.dart';
import 'package:news_app/features/news/data/data_sources/home_remote_data_source.dart';
import 'package:news_app/features/news/data/repos/news_repo_impl.dart';
import 'package:news_app/features/news/domain/repos/news_repo.dart';
import 'package:news_app/features/news/domain/use_cases/fetch_all_news_use_case.dart';
import 'package:news_app/features/news/domain/use_cases/fetch_news_with_category_use_case.dart';
import 'package:news_app/features/news/domain/use_cases/speak_use_case.dart';
import 'package:news_app/features/news/domain/use_cases/stop_use_case.dart';

/// Global service locator instance using GetIt
final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerLazySingleton<ApiService>(() => ApiService(Dio()));

  getIt.registerLazySingleton<HomeLocalDataSourceImpl>(
        () => HomeLocalDataSourceImpl(),
  );

  getIt.registerLazySingleton<HomeRemoteDataSourceImpl>(
        () => HomeRemoteDataSourceImpl(getIt<ApiService>()),
  );

  getIt.registerLazySingleton<NewsRepo>(
        () => NewsRepoImpl(
      homeRemoteDataSource: getIt<HomeRemoteDataSourceImpl>(),
      homeLocalDataSource: getIt<HomeLocalDataSourceImpl>(),
    ),
  );

  getIt.registerLazySingleton<FetchAllNewsUseCase>(
        () => FetchAllNewsUseCase(getIt<NewsRepo>()),
  );

  getIt.registerLazySingleton<FetchNewsWithCategoryUseCase>(
        () => FetchNewsWithCategoryUseCase(getIt<NewsRepo>()),
  );

  getIt.registerLazySingleton<SpeakUseCase>(
        () => SpeakUseCase(getIt<NewsRepo>()),
  );

  getIt.registerLazySingleton<StopUseCase>(
        () => StopUseCase(getIt<NewsRepo>()),
  );
}
