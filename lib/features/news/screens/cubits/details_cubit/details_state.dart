part of 'details_cubit.dart';

@immutable
sealed class DetailsState {}

final class DetailsInitial extends DetailsState {}
final class DetailsFailure extends DetailsState {
  DetailsFailure(this.errMessage);
  final String errMessage;
}

final class DetailsSpeaking extends DetailsState {}

final class DetailsStopped extends DetailsState {}
