import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie/Feature/favourite/data/favourite_local_data_source.dart';
import 'package:movie/Feature/home/domin/entities/movie_detailes_entity.dart';

part 'favourite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit(this.favoriteLocalDataSource) : super(FavoriteInitial());
  final FavoriteLocalDataSource favoriteLocalDataSource;

  Future<void> getFavorites() async {
    final List<MovieDetailsEntity> movies =
        await favoriteLocalDataSource.getFavorites();
    emit(FavoritesSuccess(movies));
  }

  void addFavorite(MovieDetailsEntity movie) {
    favoriteLocalDataSource.addFavorite(movie);
    getFavorites();
  }

  void removeFavorite(int movieId) {
    favoriteLocalDataSource.removeFavorite(movieId);
    getFavorites();
  }

  bool isFavorite(int movieId) {
    return favoriteLocalDataSource.isFavorite(movieId);
  }
}
