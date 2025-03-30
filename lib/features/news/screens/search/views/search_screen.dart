import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/core/shimmer/news_tile_shimmer.dart';
import 'package:news_app/core/utils/constants/image_strings.dart';
import 'package:news_app/core/widgets/appbar/appbar.dart';
import 'package:news_app/core/widgets/custom_shapes/containers/custom_search_container.dart';
import 'package:news_app/core/widgets/news_cards/news_tile_list_view.dart';
import 'package:news_app/features/news/screens/search/cubits/search_cubit/search_cubit.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: CustomAppBar(
        title: Text('Search', style: Theme.of(context).textTheme.headlineMedium), showBackArrow: false),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox(width: MediaQuery.of(context).size.width * 0.9, child: const CustomSearchContainer()),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: CustomScrollView(
              slivers: [
                BlocBuilder<SearchCubit, SearchState>(
                  builder: (context, state) {
                    if (state is SearchLoading) {
                      return const SliverPadding(padding: EdgeInsets.only(left: 16), sliver: NewsTileListShimmer());
                    } else if (state is SearchSuccess) {
                      return SliverPadding(
                        padding: const EdgeInsets.only(left: 16),
                        sliver: NewsTileListView(news: state.newsList, limit: 20,),
                      );
                    } else if (state is SearchFailure) {
                      return SliverFillRemaining(hasScrollBody: false, child: Center(child: Text(state.message)));
                    }
                    return SliverFillRemaining(
                      hasScrollBody: false,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(margin: const EdgeInsets.only(left: 20), child: Lottie.asset(dark ? AppImages.searchAnimationDark : AppImages.searchAnimation,fit: BoxFit.cover, height: 300, width: 300,),
                            ),
                            Text('Searching for news...', style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center,),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
