import 'package:news_app/core/functions/save_news.dart';
import 'package:news_app/core/services/api_service.dart';
import 'package:news_app/core/utils/constants/box_names.dart';
import 'package:news_app/features/news/data/models/news_model.dart';
import 'package:news_app/features/news/domain/entities/news_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<NewsEntity>> fetchAllNews({int pageNumber = 0});
  Future<List<NewsEntity>> fetchNewsWithCategory({String category, int pageNumber = 0});
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  HomeRemoteDataSourceImpl(this.apiService);

  final ApiService apiService;
  @override
  Future<List<NewsEntity>> fetchAllNews({int pageNumber = 0}) async {
    var data = await apiService.get(
        endPoint:
        'top-headlines?country=us&apiKey=727175b0856a4de283f83a7ab17d8715&page=${pageNumber + 1}');
    List<NewsEntity> news = getNewsList(data);
    saveNewsData(news, kAllNewsBox);
    return news;
  }

  @override
  Future<List<NewsEntity>> fetchNewsWithCategory({String category = 'general', int pageNumber = 0}) async {
    var data = await apiService.get(
        endPoint: 'top-headlines?country=us&apiKey=727175b0856a4de283f83a7ab17d8715&page=${pageNumber + 1}&category=$category');
    List<NewsEntity> news = getNewsList(data);
    saveNewsData(news, kCategoryNewsBox);
    return news;
  }

  List<NewsEntity> getNewsList(Map<String, dynamic> data) {
    List<NewsEntity> news = [];
    for (var newsMap in data['articles']) {
      news.add(NewsModel.fromJson(newsMap));
    }
    return news;
  }
}