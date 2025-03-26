import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/core/utils/constants/image_strings.dart';
import 'package:news_app/core/widgets/appbar/appbar.dart';

class FavoritesScreens extends StatelessWidget {
  const FavoritesScreens({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          'Favorites',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        showBackArrow: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Lottie.asset(
                dark ? AppImages.favoriteAnimationDark : AppImages.favoriteAnimation,
                height: 300,
                width: 300,
              ),
            ),
            Text(
              'No favorites yet',
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20), // عشان النص ميخرجش عن الشاشة
              child: Text(
                'Start exploring and add your favorite news!',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );

  }
}
