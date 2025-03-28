import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/utils/constants/app_colors.dart';
import 'package:news_app/core/utils/constants/sizes.dart';
<<<<<<< HEAD:lib/features/news/screens/home/views/widgets/home_view_body.dart
import 'package:news_app/core/widgets/texts/section_heading.dart';
import 'package:news_app/features/news/screens/home/cubits/all_news_cubit/all_news_cubit.dart';
import 'package:news_app/features/news/screens/home/views/widgets/category_list_view.dart';
import 'package:news_app/features/news/screens/home/views/widgets/hottest_card_list_view_bloc_builder.dart';
import 'package:news_app/features/news/screens/home/views/widgets/news_tile_list_view_bloc_builder.dart';
=======
import 'package:news_app/core/widgets/news_cards/news_tile_list_view.dart';
import 'package:news_app/core/widgets/texts/section_heading.dart';
import 'package:news_app/features/news/screens/cubits/all_news_cubit/all_news_cubit.dart';
import 'package:news_app/features/news/screens/home/widgets/category_list_view.dart';
import 'package:news_app/features/news/screens/home/widgets/hottest_card_list_view_bloc_builder.dart';
>>>>>>> origin/main:lib/features/news/screens/home/widgets/home_view_body.dart

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: AppColors.primary,
      backgroundColor: dark ? AppColors.dark : AppColors.light,
      elevation: 0,
      displacement: 0,
      onRefresh: () async {
        await context.read<AllNewsCubit>().fetchAllNews();
      },
      child: const Padding(
        padding: EdgeInsets.only(left: AppSizes.md),
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(child: SizedBox(height: AppSizes.spaceBtwItems + 5)),
            SliverToBoxAdapter(child: SectionHeading(title: 'Latest News')),
            SliverToBoxAdapter(child: HottestCardListViewBlocBuilder()),
<<<<<<< HEAD:lib/features/news/screens/home/views/widgets/home_view_body.dart
            SliverToBoxAdapter(child: SectionHeading(title: 'News For You')),
            SliverToBoxAdapter(child: CategoryListView()),
            SliverToBoxAdapter(child: SizedBox(height: AppSizes.spaceBtwItems + 5)),
            NewsTileListViewBlocBuilder(),
=======
            SliverToBoxAdapter(child: SectionHeading(title: 'News')),
            SliverToBoxAdapter(child: CategoryListView()),
            SliverToBoxAdapter(child: SizedBox(height: AppSizes.spaceBtwItems + 5)),
            NewsTileListView(),
>>>>>>> origin/main:lib/features/news/screens/home/widgets/home_view_body.dart
          ],
        ),
      ),
    );
  }
}