import 'package:flutter/material.dart';
import 'package:news_app/core/widgets/news_cards/Hottest_card.dart';

class HottestCardListView extends StatelessWidget {
  const HottestCardListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: HottestCard(
              imageUrl: 'assets/images/test_photo.jpg',
              time: '2025-02-27T19:05:24Z',
              title: 'Musk and Trump’s Fort Knox Trip Is About Bitcoin',
              author: 'Matthew Gault',
              onTap: () {},
            ),
          );
        },
      ),
    );
  }
}
