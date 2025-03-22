import 'package:flutter/material.dart';
import 'package:news_app/core/widgets/category/category.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
    );
  }
}