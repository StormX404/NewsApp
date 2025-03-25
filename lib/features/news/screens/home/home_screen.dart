import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:news_app/core/functions/setup_service_locator.dart';
import 'package:news_app/core/utils/constants/app_colors.dart';
import 'package:news_app/core/utils/constants/sizes.dart';
import 'package:news_app/core/widgets/news_cards/news_tile_list_view.dart';
import 'package:news_app/core/widgets/texts/section_heading.dart';
import 'package:news_app/features/news/domain/use_cases/fetch_all_news_use_case.dart';
import 'package:news_app/features/news/screens/cubits/all_news_cubit/all_news_cubit.dart';
import 'package:news_app/features/news/screens/home/widgets/category_list_view.dart';
import 'package:news_app/features/news/screens/home/widgets/home_appbar.dart';
import 'package:news_app/features/news/screens/home/widgets/hottest_card_list_view_bloc_builder.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final fetchAllNewsUseCase = getIt<FetchAllNewsUseCase>();

    return BlocProvider(
        create: (_) => AllNewsCubit(fetchAllNewsUseCase)..fetchAllNews(),
      child: Scaffold(
        appBar: const HomeAppBar(),
        body: Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              // Spacing
              const SliverToBoxAdapter(
                  child: SizedBox(height: AppSizes.spaceBtwSections)),

              // Hottest News Section Heading
              const SliverToBoxAdapter(
                  child: SectionHeading(title: 'Hottest News')),

              // Hottest News ListView
              const SliverToBoxAdapter(
                child: HottestCardListViewBlocBuilder(),
              ),

              // Latest News Section Heading
              SliverToBoxAdapter(
                  child: SectionHeading(
                    title: 'Latest News',
                    icon: TextButton(
                      onPressed: () {},
                      child: const Icon(
                        Iconsax.arrow_right_2,
                        size: AppSizes.iconMd,
                        color: AppColors.primary,
                      ),
                    ),
                  )),

              // Categories ListView
              const SliverToBoxAdapter(
                child: CategoryListView(),
              ),

              // Spacing
              const SliverToBoxAdapter(
                  child: SizedBox(height: AppSizes.spaceBtwItems + 5)),

              // News Tile ListView
              const NewsTileListView(),
            ],
          ),
        ),
      ),
    );
  }
}
