import 'package:hive/hive.dart';
import 'package:news_app/features/news/domain/entities/news_entity.dart';


void saveNewsData(List<NewsEntity> news, String boxName) {
  var box = Hive.box<NewsEntity>(boxName);
  box.addAll(news);
}