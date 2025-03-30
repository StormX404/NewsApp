import 'package:flutter/material.dart';
import 'package:news_app/core/background/blurred_background.dart';

import 'dart:ui';

import 'package:news_app/features/news/screens/home/views/widgets/home_appbar.dart';
import 'package:news_app/features/news/screens/home/views/widgets/home_view_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = Theme
        .of(context)
        .brightness == Brightness.dark;

    return Stack(
        children: [
          const BlurredBackground(),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: const HomeAppBar(),
            body: HomeViewBody(dark: dark),
          ),
        ]
    );
  }
}

