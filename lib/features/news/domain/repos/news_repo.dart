import 'package:dartz/dartz.dart';
import 'package:news_app/core/errors/failure.dart';
import 'package:news_app/features/news/domain/entities/news_entity.dart';

abstract class NewsRepo {
  Future<Either<Failure, List<NewsEntity>>> fetchAllNews({int pageNumber = 0});

  Future<Either<Failure, List<NewsEntity>>> fetchNewsWithCategory(
      {required String category, int pageNumber = 0});

  Future<Either<Failure, List<NewsEntity>>> searchNews(
      {required String query});

  Future<Either<Failure, void>> speak(String text);
  Future<Either<Failure, void>> stop();
}
