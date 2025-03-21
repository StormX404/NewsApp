import 'package:flutter/material.dart';


class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  TextButton(
        onPressed: () {
          //=> OnBoardingController.instance.skipPage()
          },
        child: Text(
          'skip',
          style: Theme.of(context).textTheme.labelLarge,
        ),
    );
  }
}