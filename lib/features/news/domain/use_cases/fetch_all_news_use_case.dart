import 'package:dartz/dartz.dart';
import 'package:news_app/features/news/domain/entities/news_entity.dart';
import 'package:news_app/features/news/domain/repos/news_repo.dart';

import 'package:news_app/core/errors/failure.dart';

class FetchAllNewsUseCase  {
  FetchAllNewsUseCase(this.newsRepo);

  final NewsRepo newsRepo;

  Future<Either<Failure, List<NewsEntity>>> call([int pageNumber = 0]) async {
    return await newsRepo.fetchAllNews(
      pageNumber: pageNumber,
    );
  }
}