import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/functions/setup_service_locator.dart';
import 'package:news_app/core/utils/constants/sizes.dart';
import 'package:news_app/core/utils/device/device_utility.dart';
import 'package:news_app/core/widgets/appbar/appbar.dart';
import 'package:news_app/core/widgets/custom_shapes/containers/custom_search_container.dart';
import 'package:news_app/core/widgets/news_cards/news_tile_list_view.dart';
import 'package:news_app/features/news/domain/repos/news_repo.dart';
import 'package:news_app/features/news/screens/search/cubits/search_cubit/search_cubit.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(getIt<NewsRepo>()),
      child: Scaffold(
        appBar: CustomAppBar(
          title: Text(
            'Search',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          showBackArrow: false,
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      width: AppDeviceUtils.getScreenWidth(context) * 0.9,
                      child: const CustomSearchContainer(),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            BlocBuilder<SearchCubit, SearchState>(
              builder: (context, state) {
                if (state is SearchLoading) {
                  return const SliverFillRemaining(
                    hasScrollBody: false,
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else if (state is SearchSuccess) {
                  return SliverPadding(
                      padding: const EdgeInsets.only(left: AppSizes.md),
                      sliver: NewsTileListView(
                        news: state.newsList,
                        limit: 20,
                      ));
                } else if (state is SearchFailure) {
                  return SliverFillRemaining(
                    hasScrollBody: false,
                    child: Center(child: Text(state.message)),
                  );
                }
                return const SliverFillRemaining(
                  hasScrollBody: false,
                  child: Center(child: Text('Start searching...')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
