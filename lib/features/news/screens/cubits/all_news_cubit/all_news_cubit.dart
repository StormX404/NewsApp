import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app/features/news/domain/entities/news_entity.dart';
import 'package:news_app/features/news/domain/use_cases/fetch_all_news_use_case.dart';
import 'package:news_app/features/news/domain/use_cases/speak_use_case.dart';
import 'package:news_app/features/news/domain/use_cases/stop_use_case.dart';

part 'all_news_state.dart';

class AllNewsCubit extends Cubit<AllNewsState> {
  AllNewsCubit(this.fetchAllNewsUseCase, this.speakUseCase, this.stopUseCase) : super(AllNewsInitial());

  final FetchAllNewsUseCase fetchAllNewsUseCase;
  final SpeakUseCase speakUseCase;
  final StopUseCase stopUseCase;
  
  Future<void> fetchAllNews({int pageNumber = 0}) async {
    emit(AllNewsLoading());
    var result = await fetchAllNewsUseCase.call(pageNumber);
    result.fold((failure) {
      emit(AllNewsFailure(failure.message));
    }, (news) {
      emit(AllNewsSuccess(news));
    });
  }

  Future<void> speak(String text) async {
    var result = await speakUseCase.call(text);
    result.fold((failure) {
      emit(AllNewsFailure(failure.message));
    }, (_) {
      emit(AllNewsSpeaking());
    });
  }

  Future<void> stop() async {
    var result = await stopUseCase.call();
    result.fold((failure) {
      emit(AllNewsFailure(failure.message));
    }, (_) {
      emit(AllNewsStopped());
    });
  }

}
