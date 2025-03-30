import 'package:flutter/material.dart';
import 'package:news_app/core/widgets/news_cards/hottest_card.dart';
import 'package:news_app/features/news/domain/entities/news_entity.dart';
import 'package:news_app/features/news/screens/details/views/details_screen.dart';

class HottestCardListView extends StatelessWidget {
  const HottestCardListView({super.key, required this.news});

  final List<NewsEntity> news;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: news.length,
        itemBuilder: (context, index) {
          final newsItem = news[index];

          return Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: HottestCard(
              news: newsItem,
              imageUrl: newsItem.urlToImage?.isNotEmpty == true ? newsItem.urlToImage! : 'assets/images/placeholder.png',
              time: newsItem.publishedAt ?? 'Unknown',
              title: newsItem.title,
              author: newsItem.author?.isNotEmpty == true ? newsItem.author! : 'Unknown',
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context )=> DetailsScreen(news: newsItem,))),

            ),
          );
        },
      ),
    );
  }
}
