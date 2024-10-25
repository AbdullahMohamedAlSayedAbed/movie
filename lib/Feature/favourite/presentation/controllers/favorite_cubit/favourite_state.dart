part of 'favourite_cubit.dart';

sealed class FavoriteState extends Equatable {
  const FavoriteState();

  @override
  List<Object> get props => [];
}

final class FavoriteInitial extends FavoriteState {}

class FavoritesSuccess extends FavoriteState {
  final List<MovieDetailsEntity> movies;

  const FavoritesSuccess(this.movies);

  @override
  List<Object> get props => [movies];
}
