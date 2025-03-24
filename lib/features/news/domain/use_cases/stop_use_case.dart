import 'package:dartz/dartz.dart';
import 'package:news_app/core/errors/failure.dart';
import 'package:news_app/features/news/domain/repos/news_repo.dart';

class StopUseCase {
  StopUseCase(this.newsRepo);

  final NewsRepo newsRepo;
  Future<Either<Failure, void>> call() {
    return newsRepo.stop();
  }
}