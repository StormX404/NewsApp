import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app/features/news/domain/entities/news_entity.dart';
import 'package:news_app/features/news/domain/use_cases/fetch_news_with_category_use_case.dart';

part 'category_news_state.dart';

class CategoryNewsCubit extends Cubit<CategoryNewsState> {
  CategoryNewsCubit(this.fetchNewsWithCategoryUseCase) : super(CategoryNewsInitial()) {
    fetchCategoryNews(category: 'business');
  }

  final FetchNewsWithCategoryUseCase fetchNewsWithCategoryUseCase;
  int selectedCategoryIndex = 0;
  final List<String> categories = [
    'business',
    'entertainment',
    'health',
    'science',
    'sports',
    'technology',
  ];

  void selectCategory(int index) {
    if (selectedCategoryIndex == index) return;

    selectedCategoryIndex = index;
    emit(CategoryNewsInitial());
    fetchCategoryNews(category: categories[index]);
  }

  void fetchCategoryNews({required String category}) async {
    emit(CategoryNewsLoading());

    final result = await fetchNewsWithCategoryUseCase(category: category);
    result.fold(
          (failure) => emit(CategoryNewsFailure(failure.message)),
          (news) => emit(CategoryNewsSuccess(List.from(news))),
    );
  }
}
