import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:news_app/core/utils/constants/app_colors.dart';
import 'package:news_app/core/utils/constants/image_strings.dart';
import 'package:news_app/core/utils/constants/sizes.dart';
import 'package:news_app/core/utils/device/device_utility.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.xs),
      child: AppBar(
        backgroundColor: dark
            ? AppColors.dark.withAlpha(200)
            : AppColors.light.withAlpha(200),
        flexibleSpace: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: Container(color: Colors.transparent),
          ),
        ),
        automaticallyImplyLeading: false,
        title: const Row(
          children: [
            Image(image: AssetImage(AppImages.iconAppLogo), height: 30),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Iconsax.search_normal_1),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Iconsax.moon),
          ),
        ],
      
        toolbarHeight: preferredSize.height,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppDeviceUtils.getAppBarHeight());
}
