import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/core/utils/constants/app_colors.dart';

class PlaySoundContainer extends StatelessWidget {
  const PlaySoundContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      height: 55,
      decoration: BoxDecoration(
        color: dark ? AppColors.darkCardColor : AppColors.grey.withOpacity(.6),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Iconsax.play, size: 30),
          ),
          Expanded(
            child: Lottie.asset(
              fit: BoxFit.fill,
              'assets/images/animations/voice.json',
              width: double.infinity,
              animate: false,
            ),
          ),
        ],
      ),
    );
  }
}
