import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:news_app/core/errors/failure.dart';
import 'package:news_app/features/news/data/data_sources/home_local_data_source.dart';
import 'package:news_app/features/news/data/data_sources/home_remote_data_source.dart';
import 'package:news_app/features/news/domain/entities/news_entity.dart';
import 'package:news_app/features/news/domain/repos/news_repo.dart';

class NewsRepoImpl extends NewsRepo {
  NewsRepoImpl(
      {required this.homeRemoteDataSource, required this.homeLocalDataSource});

  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;

  @override
  Future<Either<Failure, List<NewsEntity>>> fetchAllNews(
      {int pageNumber = 0}) async {
    List<NewsEntity> newsList;
    try {
      newsList = homeLocalDataSource.fetchAllNews(
        pageNumber: pageNumber,
      );
      if (newsList.isNotEmpty) {
        return right(newsList);
      }
      newsList =
          await homeRemoteDataSource.fetchAllNews(pageNumber: pageNumber);
      return right(newsList);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<NewsEntity>>> fetchNewsWithCategory(
      {String category = 'general' , int pageNumber = 0}) async {
    try {
      List<NewsEntity> news;
      news = homeLocalDataSource.fetchNewsWithCategory(
        category: category,
      );
      if (news.isNotEmpty) {
        return right(news);
      }
      news = await homeRemoteDataSource.fetchNewsWithCategory();
      return right(news);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
