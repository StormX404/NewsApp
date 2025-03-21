import 'package:flutter/material.dart';
import 'package:news_app/features/news/screens/home/widgets/home_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: HomeAppBar(),
      body: Center(child: Text('Home Screen')),
    );
  }
}