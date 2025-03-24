import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart'; // ✅ استيراد Hive
import 'package:news_app/core/functions/setup_service_locator.dart';
import 'package:news_app/core/services/shared_preferences_singleton.dart';
import 'package:news_app/core/utils/constants/box_names.dart';
import 'package:news_app/core/utils/constants/theme.dart';
import 'package:news_app/core/app_manager/theme_cubit/theme_cubit.dart';
import 'package:news_app/features/news/data/data_sources/home_local_data_source.dart';
import 'package:news_app/features/news/data/data_sources/home_remote_data_source.dart';
import 'package:news_app/features/news/data/repos/news_repo_impl.dart';
import 'package:news_app/features/news/domain/entities/news_entity.dart';
import 'package:news_app/features/news/domain/use_cases/fetch_all_news_use_case.dart';
import 'package:news_app/features/news/domain/use_cases/speak_use_case.dart';
import 'package:news_app/features/news/domain/use_cases/stop_use_case.dart';
import 'package:news_app/features/news/screens/cubits/all_news_cubit/all_news_cubit.dart';
import 'package:news_app/features/onboarding/onboarding_screen.dart';
import 'package:news_app/navigation_menu.dart';
import 'package:news_app/core/services/api_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Pref.init();

  await Hive.initFlutter();

  Hive.registerAdapter(NewsEntityAdapter());

  await Hive.openBox<NewsEntity>(kAllNewsBox);

  setupServiceLocator();

  final apiService = ApiService(Dio());

  final homeRemoteDataSource = HomeRemoteDataSourceImpl(apiService);

  final newsRepo = NewsRepoImpl(
    homeRemoteDataSource: homeRemoteDataSource,
    homeLocalDataSource: HomeLocalDataSourceImpl(),
  );

  final fetchAllNewsUseCase = FetchAllNewsUseCase(newsRepo);
  final speakUseCase = SpeakUseCase(newsRepo);
  final stopUseCase = StopUseCase(newsRepo);

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeCubit()),
        BlocProvider(create: (_) => AllNewsCubit(fetchAllNewsUseCase , speakUseCase , stopUseCase)..fetchAllNews()),
      ],
      child: const NewsApp(),
    ),
  );
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, themeMode) {
        return AnimatedTheme(
          duration: const Duration(milliseconds: 500),
          data: themeMode == ThemeMode.dark ? AppTheme.darkTheme : AppTheme.lightTheme,
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeMode,
            home: FutureBuilder<bool>(
              future: Pref.shouldShowOnboarding(),
              builder: (context, snapshot) {
                final bool shouldShowOnboarding = snapshot.data ?? true;
                return shouldShowOnboarding ? const OnBoardingScreen() : const NavigationMenu();
              },
            ),
          ),
        );
      },
    );
  }
}
