import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:news_app/core/utils/constants/app_colors.dart';
import 'package:news_app/core/utils/constants/image_strings.dart';
import 'package:news_app/core/utils/device/device_utility.dart';
import 'package:news_app/navigation_menu.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.withOpacity(0.3)),
        ),
      ),
      child: AppBar(
        flexibleSpace: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
            child: Container(color: Colors.transparent),
          ),
        ),
        backgroundColor: dark ? AppColors.dark : AppColors.light,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Row(
          children: [
            Image(image: AssetImage(AppImages.iconAppLogo), height: 30),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const NavigationMenu(index: 1)),
              );
            },
            icon: Icon(Iconsax.search_normal_1,
                color: dark ? AppColors.light.withOpacity(.6) : AppColors.dark),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Iconsax.moon,
                color: dark ? AppColors.light.withOpacity(.6) : AppColors.dark),
          ),
        ],
        toolbarHeight: preferredSize.height,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppDeviceUtils.getAppBarHeight());
}
