part of 'on_boarding_cubit.dart';

@immutable
sealed class OnBoardingState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class OnboardingInitial extends OnBoardingState {}

final class OnboardingPageChanged extends OnBoardingState {

  OnboardingPageChanged(this.index);

  final int index;

  @override
  List<Object?> get props => [index];
}

final class OnBoardingCompleted extends OnBoardingState {}
