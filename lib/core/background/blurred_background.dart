import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:news_app/core/utils/constants/app_colors.dart';

class BlurredBackground extends StatelessWidget {
  const BlurredBackground({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final dark = Theme
        .of(context)
        .brightness == Brightness.dark;
    return Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/background.jpg',
              fit: BoxFit.cover,
            ),
          ),
          // Blur Effect
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              // Adjust blur intensity
              child: Container(
                color: dark ? AppColors.dark.withOpacity(0.85) : AppColors
                    .light.withOpacity(
                    0.8), // Optional: Dark overlay for better readability
              ),
            ),
          ),
        ]
    );
  }
}


