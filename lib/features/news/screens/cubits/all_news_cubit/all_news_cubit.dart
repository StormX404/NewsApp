import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app/features/news/domain/entities/news_entity.dart';
import 'package:news_app/features/news/domain/use_cases/fetch_all_news_use_case.dart';

part 'all_news_state.dart';

class AllNewsCubit extends Cubit<AllNewsState> {
  AllNewsCubit(this.fetchAllNewsUseCase)
      : super(AllNewsInitial());

  final FetchAllNewsUseCase fetchAllNewsUseCase;


  Future<void> fetchAllNews({int pageNumber = 0}) async {
    emit(AllNewsLoading());
    var result = await fetchAllNewsUseCase.call(pageNumber);
    result.fold((failure) {
      emit(AllNewsFailure(failure.message));
    }, (news) {
      emit(AllNewsSuccess(news));
    });
  }
}
