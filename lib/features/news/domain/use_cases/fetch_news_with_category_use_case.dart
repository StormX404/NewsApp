import 'package:dartz/dartz.dart';
import 'package:news_app/features/news/domain/entities/news_entity.dart';
import 'package:news_app/features/news/domain/repos/news_repo.dart';
import 'package:news_app/core/errors/failure.dart';

class FetchNewsWithCategoryUseCase {
  FetchNewsWithCategoryUseCase(this.newsRepo);
  final NewsRepo newsRepo;

  Future<Either<Failure, List<NewsEntity>>> call({required String category, int pageNumber = 0}) async {
    return await newsRepo.fetchNewsWithCategory(
      category: category,
      pageNumber: pageNumber,
    );
  }
}