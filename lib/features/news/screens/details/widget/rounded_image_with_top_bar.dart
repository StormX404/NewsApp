import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:news_app/core/utils/constants/app_colors.dart';
import 'package:news_app/core/widgets/icon/circular_icon.dart';
import 'package:news_app/core/widgets/icon/favorite_icon.dart';

class RoundedImageWithTopBar extends StatelessWidget {
  const RoundedImageWithTopBar({
    super.key,
    required this.borderRadius,
    required this.screenHeight,
  });

  final BorderRadius borderRadius;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: borderRadius,
          child: Image.asset(
            'assets/images/test_photo.jpg',
            height: screenHeight * 0.5,
            width: double.infinity,
            fit: BoxFit.cover,
            alignment: Alignment.center,
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            height: screenHeight * 0.12,
            decoration: BoxDecoration(
              borderRadius: borderRadius,
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.black87, Colors.transparent],
              ),
            ),
          ),
        ),
        Positioned(
          top: screenHeight * 0.04,
          left: 10,
          right: 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircularIcon(
                width: 40,
                height: 40,
                icon: Iconsax.arrow_left_2,
                color: AppColors.white,
                onPressed: () => Navigator.pop(context),
              ),
              const FavoriteIcon(),
            ],
          ),
        ),
      ],
    );
  }
}
