import 'package:flutter/material.dart';
import 'package:news_app/core/widgets/news_cards/news_tile.dart';

class NewsTileListView extends StatelessWidget {
  const NewsTileListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
            (context, index) {
          return NewsTile(
            imageUrl: 'assets/images/test_photo.jpg',
            time: '2025-02-27T19:05:24Z',
            title: 'Musk and Trump’s Fort Knox Trip Is About Bitcoin',
            author: 'Matthew Gault',
            ontap: () {},
          );
        },
        childCount: 4,
      ),
    );
  }
}
