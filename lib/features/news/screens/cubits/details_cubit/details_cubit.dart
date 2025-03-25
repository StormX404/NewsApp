import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app/features/news/domain/use_cases/speak_use_case.dart';
import 'package:news_app/features/news/domain/use_cases/stop_use_case.dart';

part 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  DetailsCubit(this.speakUseCase, this.stopUseCase) : super(DetailsInitial());

  final SpeakUseCase speakUseCase;
  final StopUseCase stopUseCase;

  Future<void> speak(String text) async {
    var result = await speakUseCase.call(text);
    result.fold((failure) {
      emit(DetailsFailure(failure.message));
    }, (_) {
      emit(DetailsSpeaking());
    });
  }

  Future<void> stop() async {
    var result = await stopUseCase.call();
    result.fold((failure) {
      emit(DetailsFailure(failure.message));
    }, (_) {
      emit(DetailsStopped());
    });
  }
}
