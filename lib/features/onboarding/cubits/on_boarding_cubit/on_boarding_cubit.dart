import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/services/shared_preferences_singleton.dart';
import 'package:news_app/navigation_menu.dart';

part 'on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit() : super(OnboardingInitial());

  final PageController pageController = PageController();
  int currentPageIndex = 0;
  static const int lastPageIndex = 2;


  void updatePageIndicator(int index) {
    if (index >= 0 && index <= lastPageIndex) {
      currentPageIndex = index;
      emit(OnboardingPageChanged(index));
    }
  }

  void dotNavigationClick(int index) {
    if (index >= 0 && index <= lastPageIndex) {
      currentPageIndex = index;
      pageController.jumpToPage(index);
      emit(OnboardingPageChanged(index));
    }
  }

  void nextPage(BuildContext context) async {
    if (currentPageIndex >= lastPageIndex) {
      await Pref.completeOnboarding();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const NavigationMenu()),
      );
      emit(OnBoardingCompleted());
    } else {
      currentPageIndex++;
      pageController.jumpToPage(currentPageIndex);
      emit(OnboardingPageChanged(currentPageIndex));
    }
  }


  Future<void> skipPage(BuildContext context) async {
    currentPageIndex = lastPageIndex;
    pageController.jumpToPage(lastPageIndex);
    //await _completeOnBoarding(context);
  }

}
