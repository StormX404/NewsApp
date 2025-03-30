part of 'favorites_cubit.dart';

@immutable
abstract class FavoritesState {}

class FavoritesInitial extends FavoritesState {}

class FavoritesLoaded extends FavoritesState {
  FavoritesLoaded(this.favorites);
  final List<NewsEntity> favorites;
}
