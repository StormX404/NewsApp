import 'package:news_app/core/functions/save_news.dart';
import 'package:news_app/core/services/api_service.dart';
import 'package:news_app/core/utils/constants/box_names.dart';
import 'package:news_app/features/news/data/models/news_model.dart';
import 'package:news_app/features/news/domain/entities/news_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<NewsEntity>> fetchAllNews({int pageNumber = 0});
  Future<List<NewsEntity>> fetchNewsWithCategory({ required String category, int pageNumber = 0});
  Future<List<NewsEntity>> searchNews({required String query});

}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  HomeRemoteDataSourceImpl(this.apiService);

  final ApiService apiService;
  final String abiKey ='da0c11b6534a426ba87a1aeb2e170ee3';

  @override
  Future<List<NewsEntity>> fetchAllNews({int pageNumber = 0}) async {
    var data = await apiService.get(
        endPoint: 'top-headlines?country=us&apiKey=$abiKey&page=${pageNumber + 1}');
    List<NewsEntity> news = getNewsList(data);
    saveNewsData(news, kAllNewsBox);
    return news;
  }

  @override
  Future<List<NewsEntity>> fetchNewsWithCategory({ required String category, int pageNumber = 0}) async {
    var data = await apiService.get(
        endPoint: 'top-headlines?country=us&apiKey=$abiKey&page=${pageNumber + 1}&category=$category');
    List<NewsEntity> news = getNewsList(data);
    saveNewsData(news, kCategoryNewsBox);
    return news;
  }

  @override
  Future<List<NewsEntity>> searchNews({required String query}) async {
    var data = await apiService.get(
        endPoint: 'everything?q=$query&apiKey=$abiKey');
    return getNewsList(data);
  }

  List<NewsEntity> getNewsList(Map<String, dynamic> data) {
    List<NewsEntity> news = [];
    for (var newsMap in data['articles']) {
      news.add(NewsModel.fromJson(newsMap));
    }
    return news;
  }

}