import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/widgets/news_cards/news_tile_list_view.dart';
import 'package:news_app/features/news/screens/home/cubits/category_news_cubit/category_news_cubit.dart';

class NewsTileListViewBlocBuilder extends StatelessWidget {
  const NewsTileListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryNewsCubit, CategoryNewsState>(
      builder: (context, state) {
        if (state is CategoryNewsSuccess) {
          if (state.news.isNotEmpty) {
            return NewsTileListView(news: state.news);
          } else {
            return const SliverToBoxAdapter(
              child: Center(child: Text('No news available')),
            );
          }
        } else if (state is CategoryNewsFailure) {
          return SliverToBoxAdapter(
            child: Center(
              child: Text(state.errMessage.isNotEmpty ? state.errMessage : 'Failed to load news'),
            ),
          );
        } else if (state is CategoryNewsLoading) {
          return const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          );
        } else {
          return const SliverToBoxAdapter(
            child: Center(child: Text('Unknown state')),
          );
        }
      },
    );
  }
}
