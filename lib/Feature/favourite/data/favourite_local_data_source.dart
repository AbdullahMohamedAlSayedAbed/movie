import 'package:hive/hive.dart';
import 'package:movie/Feature/home/domin/entities/movie_detailes_entity.dart';

abstract class FavoriteLocalDataSource {
  List<MovieDetailsEntity> getFavorites();
  void addFavorite(MovieDetailsEntity movie);
  void removeFavorite(int movieId);
  bool isFavorite(int movieId);
}

class FavoriteLocalDataSourceImpl implements FavoriteLocalDataSource {
  final Box<MovieDetailsEntity> favoritesBox;

  FavoriteLocalDataSourceImpl(this.favoritesBox);
  @override
  List<MovieDetailsEntity> getFavorites() {
    return favoritesBox.values.toList();
  }

  @override
  void addFavorite(MovieDetailsEntity movie) {
    favoritesBox.put(movie.id, movie);
  }

  @override
  void removeFavorite(int movieId) {
    favoritesBox.delete(movieId);
  }

  @override
  bool isFavorite(int movieId) {
    return favoritesBox.containsKey(movieId);
  }
}
