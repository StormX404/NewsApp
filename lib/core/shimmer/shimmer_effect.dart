import 'package:flutter/material.dart';
import 'package:news_app/core/utils/constants/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerEffect extends StatelessWidget {
  const ShimmerEffect({
    super.key,
    required this.width,
    required this.height,
    this.radius = 15, this.color,
  });

  final double width, height, radius;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    return Shimmer.fromColors(
      baseColor:
          dark ? AppColors.dark.withOpacity(.5) : Colors.grey.withOpacity(.3),
      highlightColor: dark ? AppColors.darkCardColor.withOpacity(.7) : Colors.grey[50]!,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color ?? (dark ? AppColors.dark : AppColors.white),
          borderRadius: BorderRadius.circular(radius),
        ), // BoxDecoration
      ), // Container
    );
  }
} // Shimmer. fromColors
