import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/onboarding/cubits/on_boarding_cubit/on_boarding_cubit.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<OnBoardingCubit>();

    return TextButton(
      onPressed: () {
        cubit.skipPage(context);
      },
      child: Text(
        'skip',
        style: Theme.of(context).textTheme.labelLarge,
      ),
    );
  }
}
