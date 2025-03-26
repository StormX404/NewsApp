import 'package:flutter/material.dart';
import 'package:news_app/core/utils/constants/app_colors.dart';

class Category extends StatelessWidget {
  const Category({
    super.key,
    required this.title,
    this.onTap,
    required this.isSelected,
  });

  final String title;
  final void Function()? onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: onTap,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            curve: Curves.easeInOut,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: isSelected
                  ? AppColors.primary
                  : (dark ? AppColors.grey.withOpacity(.2) : AppColors.dark),
            ),
            child: AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 150),
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: isSelected ? Colors.white : AppColors.light,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
              child: Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
