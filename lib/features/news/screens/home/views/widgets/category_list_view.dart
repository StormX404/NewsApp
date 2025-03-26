import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/widgets/category/category.dart';
import 'package:news_app/features/news/screens/home/cubits/category_news_cubit/category_news_cubit.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: BlocBuilder<CategoryNewsCubit, CategoryNewsState>(
        builder: (context, state) {
          final cubit = context.read<CategoryNewsCubit>();
          final selectedIndex = cubit.selectedCategoryIndex;

          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: cubit.categories.length,
            itemBuilder: (context, index) {
              final isSelected = selectedIndex == index;

              return GestureDetector(
                onTap: () {
                  cubit.selectCategory(index);
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Category(
                    title: cubit.categories[index],
                    isSelected: isSelected,
                    onTap: () => cubit.selectCategory(index),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
