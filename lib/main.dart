import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:news_app/core/functions/setup_service_locator.dart';
import 'package:news_app/core/services/shared_preferences_singleton.dart';
import 'package:news_app/core/utils/constants/box_names.dart';
import 'package:news_app/core/app_manager/theme_cubit/theme_cubit.dart';
import 'package:news_app/features/news/domain/entities/news_entity.dart';
import 'package:news_app/features/news/domain/repos/news_repo.dart';
import 'package:news_app/features/news/domain/use_cases/fetch_all_news_use_case.dart';
import 'package:news_app/features/news/domain/use_cases/fetch_news_with_category_use_case.dart';
import 'package:news_app/features/news/domain/use_cases/speak_use_case.dart';
import 'package:news_app/features/news/domain/use_cases/stop_use_case.dart';
import 'package:news_app/features/news/screens/details/cubits/details_cubit/details_cubit.dart';
import 'package:news_app/features/news/screens/favorites/cubits/favorites_cubit/favorites_cubit.dart';
import 'package:news_app/features/news/screens/home/cubits/all_news_cubit/all_news_cubit.dart';
import 'package:news_app/features/news/screens/home/cubits/category_news_cubit/category_news_cubit.dart';
import 'package:news_app/features/news/screens/search/cubits/search_cubit/search_cubit.dart';
import 'package:news_app/news_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Pref.init();

  await Hive.initFlutter();

  Hive.registerAdapter(NewsEntityAdapter());

  await Hive.openBox<NewsEntity>(kAllNewsBox);

  await Hive.openBox<NewsEntity>(kCategoryNewsBox);

  await Hive.openBox<NewsEntity>(kFavoritesBox);

  setupServiceLocator();
  final fetchAllNewsUseCase = getIt<FetchAllNewsUseCase>();

  final fetchNewsWithCategoryUseCase = getIt<FetchNewsWithCategoryUseCase>();

  final speakUseCase = getIt<SpeakUseCase>();
  final stopUseCase = getIt<StopUseCase>();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeCubit()),
        BlocProvider(create: (_) => AllNewsCubit(fetchAllNewsUseCase)..fetchAllNews(),
        ),
        BlocProvider(
            create: (_) => CategoryNewsCubit(fetchNewsWithCategoryUseCase)),
        BlocProvider(
          create: (context) => SearchCubit(getIt<NewsRepo>()),
        ),
        BlocProvider(create: (_) => FavoritesCubit()..loadFavorites()),
        BlocProvider(create: (context) => DetailsCubit(speakUseCase, stopUseCase),),
      ],
      child: const NewsApp(),
    ),
  );
}
