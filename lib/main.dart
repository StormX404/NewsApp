import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:news_app/core/functions/setup_service_locator.dart';
import 'package:news_app/core/services/shared_preferences_singleton.dart';
import 'package:news_app/core/utils/constants/box_names.dart';
import 'package:news_app/core/app_manager/theme_cubit/theme_cubit.dart';
import 'package:news_app/features/news/domain/entities/news_entity.dart';
import 'package:news_app/news_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Pref.init();

  await Hive.initFlutter();

  Hive.registerAdapter(NewsEntityAdapter());

  await Hive.openBox<NewsEntity>(kAllNewsBox);

  await Hive.openBox<NewsEntity>(kCategoryNewsBox);

  setupServiceLocator();

  runApp(
    BlocProvider(
      create: (_) => ThemeCubit(),
      child:  const NewsApp(),
    ),
  );
}
