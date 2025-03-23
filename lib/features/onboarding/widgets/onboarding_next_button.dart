import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/utils/constants/app_colors.dart';
import 'package:news_app/features/onboarding/cubits/on_boarding_cubit/on_boarding_cubit.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<OnBoardingCubit>();
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: ElevatedButton(
        onPressed: () => cubit.nextPage(context),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
            side: const BorderSide(color: AppColors.primary),
          ),
          backgroundColor: AppColors.primary,
          padding: const EdgeInsets.symmetric(vertical: 15),
        ),
        child: Text(
          'Continue',
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.apply(color: AppColors.lightTextPrimary),
        ),
      ),
    );
  }
}
