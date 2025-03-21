import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:news_app/core/utils/constants/app_colors.dart';
import 'package:news_app/features/news/screens/favorites/favorites_screens.dart';
import 'package:news_app/features/news/screens/home/home_screen.dart';
import 'package:news_app/features/news/screens/search/search_screen.dart';

class NavigationCubit extends Cubit<int> {
  NavigationCubit() : super(0);

  final List<Widget> screens = [
    const HomeScreen(),
    const SearchScreen(),
    const FavoritesScreens(),
  ];

  void changeTab(int index) {
    emit(index);
  }
}

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: BlocBuilder<NavigationCubit, int>(
        builder: (context, state) {
          return context.read<NavigationCubit>().screens[state];
        },
      ),
      bottomNavigationBar: Stack(
        children: [
          Container(
            height: 80,
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: Colors.grey.withOpacity(0.3)),
              ),
            ),
          ),
          SizedBox(
            height: 80,
            child: BlocBuilder<NavigationCubit, int>(
              builder: (context, state) {
                return BottomNavigationBar(
                  currentIndex: state,
                  onTap: (index) =>
                      context.read<NavigationCubit>().changeTab(index),
                  backgroundColor: Colors.transparent,
                  selectedItemColor: AppColors.primary,
                  unselectedItemColor: Colors.grey,
                  type: BottomNavigationBarType.fixed,
                  showUnselectedLabels: false,
                  elevation: 0,
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(Iconsax.home),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Iconsax.search_normal),
                      label: 'Search',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Iconsax.heart),
                      label: 'Favorite',
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
