import 'package:flutter/material.dart';
import 'package:news_app/core/utils/constants/app_colors.dart';
import 'package:news_app/core/utils/constants/image_strings.dart';
import 'package:news_app/core/utils/constants/sizes.dart';
import 'package:news_app/core/utils/constants/text_strings.dart';
import 'package:news_app/features/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:news_app/features/onboarding/widgets/onboarding_next_button.dart';
import 'package:news_app/features/onboarding/widgets/onboarding_page.dart';
import 'package:news_app/features/onboarding/widgets/onboarding_skip_button.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      color: dark ? AppColors.dark : AppColors.light,
      child: Column(
        children: [
          // Dot navigation indicator
          const OnBoardingDotNavigation(),

          // Horizontal scrollable pages
          Expanded(
            child: PageView(
              controller: PageController(),
              children: const [
                OnBoardingPage(
                  image: AppImages.onBoardingImage1,
                  title: AppTexts.onBoardingTitle1,
                  subTitle: AppTexts.onBoardingSubTitle1,
                ),
                OnBoardingPage(
                  image: AppImages.onBoardingImage2,
                  title: AppTexts.onBoardingTitle2,
                  subTitle: AppTexts.onBoardingSubTitle2,
                ),
                OnBoardingPage(
                  image: AppImages.onBoardingImage3,
                  title: AppTexts.onBoardingTitle3,
                  subTitle: AppTexts.onBoardingSubTitle3,
                ),
              ],
            ),
          ),

          // Next button
          const OnBoardingNextButton(),
          // Skip button
          const OnBoardingSkip(),
          const SizedBox(height: AppSizes.spaceBtwSections),
        ],
      ),
    );
  }
}
