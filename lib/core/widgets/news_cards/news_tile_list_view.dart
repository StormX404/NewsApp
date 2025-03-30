import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/widgets/news_cards/news_tile.dart';
import 'package:news_app/features/news/domain/entities/news_entity.dart';
import 'package:news_app/features/news/screens/details/views/details_screen.dart';
import 'package:news_app/features/news/screens/favorites/cubits/favorites_cubit/favorites_cubit.dart';

class NewsTileListView extends StatefulWidget {
  const NewsTileListView({
    super.key,
    required this.news,
    this.limit,
    this.enableDismiss = false,
  });

  final List<NewsEntity> news;
  final int? limit;
  final bool enableDismiss;

  @override
  State<NewsTileListView> createState() => _NewsTileListViewState();
}

class _NewsTileListViewState extends State<NewsTileListView> {
  late List<NewsEntity> newsList;

  @override
  void initState() {
    super.initState();
    newsList = List.from(widget.news);
  }

  @override
  Widget build(BuildContext context) {
    final int newsLimit = widget.limit ?? newsList.length;

    return SliverList(
      delegate: SliverChildBuilderDelegate(
            (context, index) {
          if (index >= newsList.length) return null;
          final newsItem = newsList[index];

          return widget.enableDismiss
              ? Dismissible(
            key: Key(newsItem.title),
            direction: DismissDirection.endToStart,
            background: Container(
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(12),
              ),
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Icon(Icons.delete, color: Colors.white),
            ),
            onDismissed: (direction) {
              setState(() {
                context.read<FavoritesCubit>().toggleFavorite(newsItem);
                newsList.removeAt(index);
              });
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: NewsTile(
                imageUrl: newsItem.urlToImage ?? '',
                time: newsItem.publishedAt ?? 'Unknown Time',
                title: newsItem.title,
                author: newsItem.author ?? 'Unknown Author',
                ontap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => DetailsScreen(news: newsItem),
                  ),
                ),
              ),
            ),
          )

              : NewsTile(
            imageUrl: newsItem.urlToImage ?? '',
            time: newsItem.publishedAt ?? 'Unknown Time',
            title: newsItem.title,
            author: newsItem.author ?? 'Unknown Author',
            ontap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DetailsScreen(news: newsItem),
              ),
            ),
          );
        },
        childCount: newsList.length > newsLimit ? newsLimit : newsList.length,
      ),
    );
  }
}
