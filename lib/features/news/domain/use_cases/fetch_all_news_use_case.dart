import 'package:dartz/dartz.dart';
import 'package:news_app/features/news/domain/entities/news_entity.dart';
import 'package:news_app/features/news/domain/repos/news_repo.dart';

import 'package:news_app/core/errors/failure.dart';
import 'package:news_app/core/use_cases/use_case.dart';

class FetchAllNewsUseCase extends UseCase<List<NewsEntity>, int> {

  FetchAllNewsUseCase(this.newsRepo);
  final NewsRepo newsRepo;

  @override
  Future<Either<Failure, List<NewsEntity>>> call([int param = 0]) async {
    return await newsRepo.fetchAllNews(
      pageNumber: param,
    );
  }
}