import 'package:hive/hive.dart';
import 'package:news_app/core/utils/constants/box_names.dart';
import 'package:news_app/features/news/domain/entities/news_entity.dart';

abstract class HomeLocalDataSource {
  List<NewsEntity> fetchAllNews({int pageNumber = 0});
  List<NewsEntity> fetchNewsWithCategory({required String category , int pageNumber = 0});
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<NewsEntity> fetchAllNews({int pageNumber = 0}) {
    int startIndex = pageNumber * 10;
    int endIndex = (pageNumber + 1) * 10;

    var box = Hive.box<NewsEntity>(kAllNewsBox);
    int length = box.values.length;
    if (startIndex >= length || endIndex > length) {
      return [];
    }
    return box.values.toList().sublist(startIndex, endIndex);
  }

  @override
  List<NewsEntity> fetchNewsWithCategory({required String category , int pageNumber = 0}) {
    var box = Hive.box<NewsEntity>(kCategoryNewsBox);
    return box.values.toList();
  }
}