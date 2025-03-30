import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:news_app/core/utils/constants/box_names.dart';
import 'package:news_app/features/news/domain/entities/news_entity.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(FavoritesInitial());

  void loadFavorites() {
    final favorites = Hive.box<NewsEntity>(kFavoritesBox).values.toList();
    emit(FavoritesLoaded(favorites));
  }

  void addToFavorites(NewsEntity news) {
    final box = Hive.box<NewsEntity>(kFavoritesBox);
    box.put(news.id, news);
    loadFavorites();
  }

  void removeFromFavorites(String newsId) {
    final box = Hive.box<NewsEntity>(kFavoritesBox);
    box.delete(newsId);
    loadFavorites();
  }

  bool isFavorite(String newsId) {
    final box = Hive.box<NewsEntity>(kFavoritesBox);
    return box.containsKey(newsId);
  }

  void toggleFavorite(NewsEntity news) {
    if (isFavorite(news.id)) {
      removeFromFavorites(news.id);
    } else {
      addToFavorites(news);
    }
  }
}
