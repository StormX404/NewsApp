import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/background/blurred_background.dart';
import 'package:news_app/core/functions/setup_service_locator.dart';
import 'package:news_app/features/news/domain/use_cases/fetch_all_news_use_case.dart';
import 'package:news_app/features/news/screens/cubits/all_news_cubit/all_news_cubit.dart';
import 'package:news_app/features/news/screens/home/widgets/home_appbar.dart';
import 'package:news_app/features/news/screens/home/widgets/home_view_body.dart';

import 'dart:ui';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final fetchAllNewsUseCase = getIt<FetchAllNewsUseCase>();
    final dark = Theme
        .of(context)
        .brightness == Brightness.dark;

    return BlocProvider(
      create: (_) =>
      AllNewsCubit(fetchAllNewsUseCase)
        ..fetchAllNews(),
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

