import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/widgets/category/category.dart';
import 'package:news_app/features/news/screens/cubits/category_cubit/category_cubit.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({
    super.key,
  });

  final List<String> categories = const [
    'general',
    'business',
    'entertainment',
    'health',
    'science',
    'sports',
    'technology',
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryCubit(),
      child: SizedBox(
        height: 30,
        child: BlocBuilder<CategoryCubit, int>(
          builder: (context, selectedIndex) {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final isSelected = selectedIndex == index;

                  return GestureDetector(
                    onTap: () {
                      context.read<CategoryCubit>().selectCategory(index);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Category(
                        title: categories[index],
                        isSelected: isSelected,
                        onTap: () {
                          context.read<CategoryCubit>().selectCategory(index);
                        },
                      ),
                    ),
                  );
                },
              );
          },
        ),
      ),
    );
  }
}