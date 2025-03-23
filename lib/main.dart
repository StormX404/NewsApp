import 'package:flutter/material.dart';
import 'package:news_app/core/services/shared_preferences_singleton.dart';
import 'package:news_app/core/utils/constants/theme.dart';
import 'package:news_app/features/onboarding/onboarding_screen.dart';
import 'package:news_app/navigation_menu.dart';

void main() async {

  // ensure widgets are initialized
  WidgetsFlutterBinding.ensureInitialized();

  // initialise shared preferences
  await Pref.init(); 

  // run app
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: FutureBuilder<bool>(
        future: Pref.shouldShowOnboarding(),
        builder: (context, snapshot) {
            final bool shouldShowOnboarding = snapshot.data ?? true;
            return shouldShowOnboarding ? const OnBoardingScreen() : const NavigationMenu();
        },
      ),
    );
  }
}
