import 'package:dartz/dartz.dart';
import 'package:news_app/features/news/domain/entities/news_entity.dart';
import 'package:news_app/features/news/domain/repos/news_repo.dart';
import 'package:news_app/core/errors/failure.dart';
import 'package:news_app/core/use_cases/use_case.dart';

class FetchNewsWithCategoryUseCase extends UseCase<List<NewsEntity>, NoParam> {

  FetchNewsWithCategoryUseCase(this.newsRepo);
  final NewsRepo newsRepo;

  @override
  Future<Either<Failure, List<NewsEntity>>> call([NoParam? param]) async {
    return await newsRepo.fetchNewsWithCategory(
      category: 'general',
      pageNumber: 0,
    );
  }
}