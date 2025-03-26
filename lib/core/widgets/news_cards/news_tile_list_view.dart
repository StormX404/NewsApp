import 'package:flutter/material.dart';
import 'package:news_app/core/widgets/news_cards/news_tile.dart';
import 'package:news_app/features/news/domain/entities/news_entity.dart';
import 'package:news_app/features/news/screens/details/views/details_screen.dart';

class NewsTileListView extends StatelessWidget {

  const NewsTileListView({
    super.key,
    required this.news,
    this.limit,
  });
  final List<NewsEntity> news;
  final int? limit;

  @override
  Widget build(BuildContext context) {
    final int newsLimit = limit ?? news.length;

    return SliverList(
      delegate: SliverChildBuilderDelegate(
            (context, index) {
          final newsItem = news[index];
          return NewsTile(
            imageUrl: newsItem.urlToImage!,
            time: newsItem.publishedAt!,
            title: newsItem.title,
            author: newsItem.author ?? 'Unknown Author',
            ontap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailsScreen(news: newsItem),
              ),
            ),
          );
        },
        childCount: news.length > newsLimit ? newsLimit : news.length,
      ),
    );
  }
}
