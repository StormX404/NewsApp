import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/news/screens/home/cubits/all_news_cubit/all_news_cubit.dart';
import 'package:news_app/features/news/screens/home/views/widgets/hottest_card_list_view.dart';

class HottestCardListViewBlocBuilder extends StatelessWidget {
  const HottestCardListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllNewsCubit, AllNewsState>(
      builder: (context, state) {
        if (state is AllNewsSuccess) {
          if (state.news.isNotEmpty) {
            return HottestCardListView(news: state.news);
          } else {
            return const Center(child: Text('No news available'));
          }
        } else if (state is AllNewsFailure) {
          return Center(child: Text(state.errMessage.isNotEmpty ? state.errMessage : 'Failed to load news'));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
