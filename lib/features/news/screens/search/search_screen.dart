import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:news_app/core/utils/constants/app_colors.dart';
import 'package:news_app/core/utils/device/device_utility.dart';
import 'package:news_app/core/widgets/appbar/appbar.dart';
import 'package:news_app/core/widgets/custom_shapes/containers/custom_search_container.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          'Search',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        showBackArrow: false,
      ),
      body: Column(
        children: [
          const SizedBox(height: 10), // Space from top
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              width: AppDeviceUtils.getScreenWidth(context) * 0.9,
              child: const CustomSearchContainer(),
            ),
          ),
        ],
      ),
    );
  }
}


