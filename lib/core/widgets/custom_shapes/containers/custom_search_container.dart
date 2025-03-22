import 'package:flutter/material.dart';
import 'package:news_app/core/utils/constants/app_colors.dart';


class CustomSearchContainer extends StatelessWidget {
  const CustomSearchContainer({
    super.key,  this.hintText = 'Search...',  this.outlineInputBorder = AppColors.primary,
  });

  final String hintText;
  final Color outlineInputBorder;

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: AppColors.primary,
      decoration: InputDecoration(
        hintText: 'Search...',
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: BorderSide(color: outlineInputBorder),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: BorderSide(color: outlineInputBorder),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: BorderSide(color: outlineInputBorder),
        ),
      ),
    );
  }
}