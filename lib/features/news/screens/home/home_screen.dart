import 'package:flutter/material.dart';
import 'package:news_app/core/utils/constants/sizes.dart';
import 'package:news_app/core/widgets/category/category.dart';
import 'package:news_app/core/widgets/news_cards/news_tile_list_view.dart';
import 'package:news_app/core/widgets/texts/section_heading.dart';
import 'package:news_app/features/news/screens/home/widgets/category_list_view.dart';
import 'package:news_app/features/news/screens/home/widgets/home_appbar.dart';
import 'package:news_app/features/news/screens/home/widgets/hottest_card_list_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: HomeAppBar(),
      body: Padding(
        padding: EdgeInsets.only(left: 15.0),
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [

            // Spacing
            SliverToBoxAdapter(child: SizedBox(height: AppSizes.spaceBtwItems + 5)),

            // Hottest News Section Heading
            SliverToBoxAdapter(child: SectionHeading(title: 'Hottest News')),

            // Hottest News ListView
            SliverToBoxAdapter(
              child: HottestCardListView(),
            ),

            // Latest News Section Heading
            SliverToBoxAdapter(child: SectionHeading(title: 'Latest News')),

            // Categories ListView
            SliverToBoxAdapter(
              child: CategoryListView(),
            ),
            
            // Spacing
            SliverToBoxAdapter(child: SizedBox(height: AppSizes.spaceBtwItems + 5)),

            // News Tile ListView
            NewsTileListView(),
          ],
        ),
      ),
    );
  }
}






