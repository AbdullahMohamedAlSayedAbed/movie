import 'package:hive/hive.dart';
import 'package:movie/Feature/home/domin/entities/home_entity.dart';

abstract class HomeLocalDataSource {
  Future<void> cacheNowPlayingMovies(List<HomeEntity> movies);
  List<HomeEntity>? getNowPlayingMoviesFromCache();
  void saveMoviesData(List<HomeEntity> movies, String boxName);
  Future<void> cachePopularMovies(List<HomeEntity> movies);
  List<HomeEntity>? getPopularMoviesFromCache();
  Future<void> cacheTopRatedMovies(List<HomeEntity> movies);
  List<HomeEntity>? getTopRatedMoviesFromCache();
}

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  final Box<HomeEntity> homeBox;
  final Box<HomeEntity> popularBox;
  final Box<HomeEntity> topRatedBox;

  HomeLocalDataSourceImpl(
      {required this.homeBox,
      required this.popularBox,
      required this.topRatedBox});

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
}
