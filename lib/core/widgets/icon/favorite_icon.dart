import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:news_app/core/utils/constants/app_colors.dart';
import 'package:news_app/core/widgets/icon/circular_icon.dart';

class FavoriteIcon extends StatelessWidget {
  const FavoriteIcon({super.key});


  @override
  Widget build(BuildContext context) {
    return CircularIcon(
      icon: Iconsax.heart5,
      color:  AppColors.white,
      onPressed: () {},
    );
  }
}