part of 'search_cubit.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchSuccess extends SearchState {
  SearchSuccess(this.newsList);
  final List<NewsEntity> newsList;
}

class SearchFailure extends SearchState {
  SearchFailure(this.message);
  final String message;
}
