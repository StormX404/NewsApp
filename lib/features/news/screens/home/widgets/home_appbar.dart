import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:news_app/core/utils/constants/image_strings.dart';
import 'package:news_app/core/utils/device/device_utility.dart';
import 'package:news_app/core/app_manager/theme_cubit/theme_cubit.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = Theme
        .of(context)
        .brightness == Brightness.dark;
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
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Row(
          children: [
            Image(image: AssetImage(AppImages.iconAppLogo), height: 30),
          ],
        ),
        actions: [
          /*IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const NavigationMenu(index: 1)),
              );
            },
            icon: Icon(Iconsax.search_normal_1,
                color: dark ? AppColors.light.withOpacity(.6) : AppColors.dark),
          ),*/
          IconButton(
            onPressed: () {context.read<ThemeCubit>().toggleTheme();},
            icon: AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              transitionBuilder: (child, animation) => RotationTransition(
                turns: Tween<double>(begin: 0.5, end: 1).animate(animation),
                child: child,
              ),
              child: Icon(context.watch<ThemeCubit>().state == ThemeMode.dark ? Iconsax.moon4 : Iconsax.sun_1,
                key: ValueKey(context.watch<ThemeCubit>().state),
              ),
            ),
          ),
        ],
        toolbarHeight: preferredSize.height,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppDeviceUtils.getAppBarHeight());
}
