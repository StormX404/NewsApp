import 'package:flutter/material.dart';
import 'package:news_app/core/widgets/appbar/appbar.dart';

class FavoritesScreens extends StatelessWidget {
  const FavoritesScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(
        title: Text('Favorites' ,style: Theme.of(context).textTheme.headlineMedium,),
        showBackArrow: false,
      ),
      body: const Center(child: Text('Favorites Screen')),
    );
  }
}
