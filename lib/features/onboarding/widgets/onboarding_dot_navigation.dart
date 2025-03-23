import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/utils/constants/app_colors.dart';
import 'package:news_app/core/utils/constants/sizes.dart';
import 'package:news_app/features/onboarding/cubits/on_boarding_cubit/on_boarding_cubit.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<OnBoardingCubit>();
    return Padding(
      padding: const EdgeInsets.only(top: AppSizes.appBarHeight + 25),
      child: Align(
        alignment: Alignment.topCenter,
        child: SmoothPageIndicator(
          effect: ExpandingDotsEffect(
            activeDotColor: AppColors.primary,
            dotColor: AppColors.grey.withOpacity(0.8),
            dotHeight: 4,
          ),
          controller: cubit.pageController,
          onDotClicked: cubit.dotNavigationClick,
          count: 3,
        ),
      ),
    );
  }
}
