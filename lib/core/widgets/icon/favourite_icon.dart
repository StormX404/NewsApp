import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:news_app/core/utils/constants/app_colors.dart';
import 'package:news_app/core/widgets/icon/circular_icon.dart';

class FavouriteIcon extends StatelessWidget {
  const FavouriteIcon({super.key});


  @override
  Widget build(BuildContext context) {
    return CircularIcon(
      width: 40,
      height: 40,
      icon: Iconsax.heart5,
      color:  AppColors.error,
      onPressed: () {},
    );
  }
}