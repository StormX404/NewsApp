import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:news_app/core/utils/constants/app_colors.dart';

class BlurredBackground extends StatelessWidget {
  const BlurredBackground({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Stack(
      children: [
        // Gradient Background
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: isDark
                  ? [
                      AppColors.dark, // Dark Base
                      const Color(0xFF4A148C).withOpacity(0.1), // Purple
                      const Color(0xFF00ACC1), // Cyan
                      const Color(0xFF8E24AA), // Light Purple
                    ]
                  : [
                      AppColors.light, // Light Base
                      const Color(0xFFBBDEFB), // Soft Blue
                      const Color(0xFFE1BEE7), // Light Purple
                      const Color(0xFFB3E5FC), // Sky Blue
                    ],
              stops: [0.0, 0.2, 0.4, 1.0], // Smooth transition
            ),
          ),
        ),
        // Blur Effect
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 60, sigmaY: 60),
            // Adjust blur intensity
            child: Container(
              color: isDark
                  ? AppColors.dark.withOpacity(0.6) // Dark overlay
                  : AppColors.light.withOpacity(0.3), // Light overlay
            ),
          ),
        ),
      ],
    );
  }
}
