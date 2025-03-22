import 'package:flutter/material.dart';
import 'package:news_app/core/widgets/category/category.dart';
import 'package:news_app/core/widgets/news_cards/news_tile.dart';
import 'package:news_app/core/widgets/texts/section_heading.dart';
import 'package:news_app/features/news/screens/home/widgets/home_appbar.dart';
import 'package:news_app/core/widgets/news_cards/Hottest_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      body: Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            const SliverToBoxAdapter(child: SizedBox(height: 20)),
            const SliverToBoxAdapter(child: SectionHeading(title: 'Hottest News')),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 250,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
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
              ),
            ),
            const SliverToBoxAdapter(child: SectionHeading(title: 'Latest News')),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 30,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Category(
                        title: 'Sports',
                        onTap: () {},
                      ),
                    );
                  },
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 20)),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  return NewsTile(
                    imageUrl: 'assets/images/test_photo.jpg',
                    time: '2025-02-27T19:05:24Z',
                    title: 'Musk and Trump’s Fort Knox Trip Is About Bitcoin',
                    author: 'Matthew Gault',
                     ontap: () {  },
                  );
                },
                childCount: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


