import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/utils/constants/app_colors.dart';
import 'package:news_app/navigation_menu.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BlocProvider(
                create: (context) => NavigationCubit(),
                child: const NavigationMenu(),
              ),
            ),
          );
          //=> OnBoardingController.instance.nextPage()
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
            side: const BorderSide(color: AppColors.primary),
          ),
          backgroundColor: AppColors.primary,
          padding: const EdgeInsets.symmetric(
              vertical: 15), // Horizontal padding removed as width is fixed
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
