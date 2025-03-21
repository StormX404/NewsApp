import 'package:flutter/material.dart';
import 'package:news_app/core/widgets/appbar/appbar.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(
        title: Text('Search' ,style: Theme.of(context).textTheme.headlineMedium,),
        showBackArrow: false,
      ),
      body: Center(child: const Text('Search Screen')),
    );
  }
}