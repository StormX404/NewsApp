import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/services/shared_preferences_singleton.dart';
import 'package:news_app/core/utils/constants/theme.dart';
import 'package:news_app/features/news/cubits/theme_cubit/theme_cubit.dart';
import 'package:news_app/features/onboarding/onboarding_screen.dart';
import 'package:news_app/navigation_menu.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Pref.init();

  runApp(
    BlocProvider(
      create: (_) => ThemeCubit(),
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

