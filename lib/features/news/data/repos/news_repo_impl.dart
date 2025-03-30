import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:news_app/core/errors/failure.dart';
import 'package:news_app/core/utils/constants/box_names.dart';
import 'package:news_app/features/news/data/data_sources/home_local_data_source.dart';
import 'package:news_app/features/news/data/data_sources/home_remote_data_source.dart';
import 'package:news_app/features/news/domain/entities/news_entity.dart';
import 'package:news_app/features/news/domain/repos/news_repo.dart';

class NewsRepoImpl extends NewsRepo {
  NewsRepoImpl({required this.homeRemoteDataSource, required this.homeLocalDataSource});

  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;

  final flutterTts = FlutterTts();
  final Box<NewsEntity> newsBox = Hive.box<NewsEntity>(kAllNewsBox);

  @override
  Future<Either<Failure, List<NewsEntity>>> fetchAllNews({int pageNumber = 0}) async {
    try {
      // Attempt to fetch data from the API first
      final remoteNews = await homeRemoteDataSource.fetchAllNews(pageNumber: pageNumber);

      // Save the fetched data to local storage (Hive)
      var box = Hive.box<NewsEntity>(kAllNewsBox);
      await box.clear();
      await box.addAll(remoteNews);

      return right(remoteNews);
    } catch (e) {
      if (e is DioException) {
        // If there's no internet connection, return cached data
        var cachedNews = homeLocalDataSource.fetchAllNews(pageNumber: pageNumber);
        if (cachedNews.isNotEmpty) {
          return right(cachedNews);
        }
        return left(ServerFailure('No internet connection, and no cached data available.'));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<NewsEntity>>> fetchNewsWithCategory({required String category, int pageNumber = 0}) async {
    try {
      // Attempt to fetch data from the API first
      final remoteNews = await homeRemoteDataSource.fetchNewsWithCategory(category: category, pageNumber: pageNumber);

      // Save the fetched data to local storage (Hive)
      var box = Hive.box<NewsEntity>(kCategoryNewsBox);
      await box.clear();
      await box.addAll(remoteNews);

      return right(remoteNews);
    } catch (e) {
      if (e is DioException) {
        // If there's no internet connection, return cached data
        var cachedNews = homeLocalDataSource.fetchNewsWithCategory(category: category, pageNumber: pageNumber);
        if (cachedNews.isNotEmpty) {
          return right(cachedNews);
        }
        return left(ServerFailure('No internet connection, and no cached data available.'));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<NewsEntity>>> searchNews({required String query}) async {
    try {
      final remoteNews = await homeRemoteDataSource.searchNews(query: query);
      return right(remoteNews);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }


  @override
  Future<Either<Failure, void>> speak(String text) async {
    try {
      await flutterTts.setLanguage('en-US');
      await flutterTts.setPitch(1);
      await flutterTts.setSpeechRate(0.5);
      await flutterTts.speak(text);
      return right(null);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> stop() async {
    try {
      await flutterTts.stop();
      return right(null);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
