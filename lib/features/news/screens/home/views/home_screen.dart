import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/background/blurred_background.dart';
import 'package:news_app/core/functions/setup_service_locator.dart';
import 'package:news_app/features/news/domain/use_cases/fetch_all_news_use_case.dart';
import 'package:news_app/features/news/domain/use_cases/fetch_news_with_category_use_case.dart';
import 'package:news_app/features/news/screens/home/cubits/all_news_cubit/all_news_cubit.dart';
import 'package:news_app/features/news/screens/home/cubits/category_news_cubit/category_news_cubit.dart';

import 'dart:ui';

import 'package:news_app/features/news/screens/home/views/widgets/home_appbar.dart';
import 'package:news_app/features/news/screens/home/views/widgets/home_view_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final fetchAllNewsUseCase = getIt<FetchAllNewsUseCase>();
    final fetchNewsWithCategoryUseCase = getIt<FetchNewsWithCategoryUseCase>();
    final dark = Theme
        .of(context)
        .brightness == Brightness.dark;

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AllNewsCubit(fetchAllNewsUseCase)..fetchAllNews(),
        ),
        BlocProvider(
          create: (_) => CategoryNewsCubit(fetchNewsWithCategoryUseCase),
        ),
      ],
      child: Stack(
          children: [
            const BlurredBackground(),
            Scaffold(
              backgroundColor: Colors.transparent,
              appBar: const HomeAppBar(),
              body: HomeViewBody(dark: dark),
            ),
          ]
      ),
    );
  }
}

