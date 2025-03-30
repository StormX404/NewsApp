import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';


part 'news_entity.g.dart';

@HiveType(typeId: 0)
class NewsEntity {
  NewsEntity(
      {String? id,
        required this.title,
      required this.urlToImage,
      required this.content,
      required this.author,
      required this.url,
      required this.publishedAt}) : id = id ?? const Uuid().v4();

  @HiveField(0)
  final String title;
  @HiveField(1)
  final String? urlToImage;
  @HiveField(2)
  final String content;
  @HiveField(3)
  final String? author;
  @HiveField(4)
  final String? url;
  @HiveField(5)
  final String? publishedAt;
  @HiveField(6)
  final String id;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is NewsEntity && other.id == id);

  @override
  int get hashCode => id.hashCode;
}
