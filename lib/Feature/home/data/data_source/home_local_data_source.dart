import 'package:hive/hive.dart';
import 'package:movie/Feature/home/domin/entities/home_entity.dart';
import 'package:movie/Feature/home/domin/entities/movie_detailes_entity.dart';

abstract class HomeLocalDataSource {
  Future<void> cacheNowPlayingMovies(List<HomeEntity> movies);
  List<HomeEntity>? getNowPlayingMoviesFromCache();
  void saveMoviesData(List<HomeEntity> movies, String boxName);
  Future<void> cachePopularMovies(List<HomeEntity> movies);
  List<HomeEntity>? getPopularMoviesFromCache();
  Future<void> cacheTopRatedMovies(List<HomeEntity> movies);
  List<HomeEntity>? getTopRatedMoviesFromCache();
  int? getLastUpdateTimestamp(String key);
  List<HomeEntity>? getMoviesByPageFromCache(String boxName);
  List<GenreEntity>? getGenresMoviesFromCache(String boxName);
}

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  final Box<HomeEntity> homeBox;
  final Box<HomeEntity> popularBox;
  final Box<HomeEntity> topRatedBox;
  final Box<int> timestampsBox;

  HomeLocalDataSourceImpl(
      {required this.timestampsBox,
      required this.homeBox,
      required this.popularBox,
      required this.topRatedBox});
  static const nowPlayingTimestampKey =
      'nowPlayingTimestamp'; // NEW: مفتاح توقيت Now Playing
  static const popularMoviesTimestampKey =
      'popularMoviesTimestamp'; // NEW: مفتاح توقيت Popular Movies
  static const topRatedMoviesTimestampKey =
      'topRatedMoviesTimestamp'; // NEW: مفتاح توقيت Top Rated Movies

  @override
  Future<void> cacheNowPlayingMovies(List<HomeEntity> movies) async {
    await homeBox.clear();
    await homeBox.addAll(movies);
  }

  @override
  List<HomeEntity>? getNowPlayingMoviesFromCache() {
    return homeBox.values.toList();
  }

  @override
  void saveMoviesData(List<HomeEntity> movies, String boxName) {
    var box = Hive.box<HomeEntity>(boxName);
    box.addAll(movies);
  }

  @override
  Future<void> cachePopularMovies(List<HomeEntity> movies) async {
    await popularBox.clear();
    await popularBox.addAll(movies);
  }

  @override
  List<HomeEntity>? getPopularMoviesFromCache() {
    return popularBox.values.toList();
  }

  @override
  Future<void> cacheTopRatedMovies(List<HomeEntity> movies) async {
    await topRatedBox.clear();
    await topRatedBox.addAll(movies);
  }

  @override
  List<HomeEntity>? getTopRatedMoviesFromCache() {
    return topRatedBox.values.toList();
  }

  @override
  int? getLastUpdateTimestamp(String key) {
    return timestampsBox.get(key);
  }

  @override
  List<HomeEntity>? getMoviesByPageFromCache(String boxName) {
    var box = Hive.box<HomeEntity>(boxName);
    return box.values.toList();
  }
  
  @override
  List<GenreEntity>? getGenresMoviesFromCache(String boxName) {
    var box = Hive.box<GenreEntity>(boxName);
    return box.values.toList();
  }
}
