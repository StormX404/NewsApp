part of 'all_news_cubit.dart';

@immutable
sealed class AllNewsState {}

final class AllNewsInitial extends AllNewsState {}

final class AllNewsLoading extends AllNewsState {}

final class AllNewsFailure extends AllNewsState {
  AllNewsFailure(this.errMessage);
  final String errMessage;
}
final class AllNewsSuccess extends AllNewsState {
  AllNewsSuccess(this.news);
  final List<NewsEntity> news;
}


