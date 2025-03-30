import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app/features/news/domain/entities/news_entity.dart';
import 'package:news_app/features/news/domain/repos/news_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:news_app/core/errors/failure.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.newsRepository) : super(SearchInitial());

  final NewsRepo newsRepository;
  final TextEditingController searchController = TextEditingController();

  Future<void> searchNews(String query) async {
    if (query.isEmpty) {
      emit(SearchInitial());
      return;
    }

    print('Cubit: Searching for $query');
    emit(SearchLoading());

    final Either<Failure, List<NewsEntity>> result =
    await newsRepository.searchNews(query: query);

    result.fold(
          (failure) {
        print('Cubit: Search failed - ${failure.message}');
        emit(SearchFailure(failure.message));
      },
          (newsList) {
        print('Cubit: Search successful - Found ${newsList.length} articles');
        emit(SearchSuccess(newsList));
      },
    );
  }
}

