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
  const NavigationMenu({super.key, this.index = 0});
  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavigationCubit()..emit(index), // Initialize index
      child: BlocBuilder<NavigationCubit, int>(
        builder: (context, state) {
          return WillPopScope(
            onWillPop: () async {
              if (state != 0) {
                context.read<NavigationCubit>().changeTab(0);
                return false; 
              }
              return true; 
            },
            child: Scaffold(
              body: context.read<NavigationCubit>().screens[state],
              bottomNavigationBar: Stack(
                children: [
                  ClipRRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                      child: Container(
                        height: 80,
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(color: Colors.grey.withOpacity(0.3)),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 80,
                    child: BottomNavigationBar(
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
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
