part of 'category_news_cubit.dart';

@immutable
sealed class CategoryNewsState {}

final class CategoryNewsInitial extends CategoryNewsState {}

final class CategoryNewsLoading extends CategoryNewsState {}

final class CategoryNewsFailure extends CategoryNewsState {
  CategoryNewsFailure(this.errMessage);
  final String errMessage;
}
final class CategoryNewsSuccess extends CategoryNewsState {
  CategoryNewsSuccess(this.news);
  final List<NewsEntity> news;
}

