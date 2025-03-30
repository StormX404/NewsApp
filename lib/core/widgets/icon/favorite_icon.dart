import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:news_app/core/utils/constants/app_colors.dart';
import 'package:news_app/core/widgets/icon/circular_icon.dart';
import 'package:news_app/features/news/domain/entities/news_entity.dart';
import 'package:news_app/features/news/screens/favorites/cubits/favorites_cubit/favorites_cubit.dart';

class FavoriteIcon extends StatelessWidget {
  const FavoriteIcon({super.key, required this.news});
  final NewsEntity news; // تمرير الكائن بالكامل

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, state) {
        final cubit = context.read<FavoritesCubit>();
        final isFav = cubit.isFavorite(news.id);
        return CircularIcon(
          icon: isFav ? Iconsax.heart5 : Iconsax.heart,
          color: isFav ? Colors.red : AppColors.white,
          onPressed: () {
            cubit.toggleFavorite(news);
          },
        );
      },
    );
  }
}
