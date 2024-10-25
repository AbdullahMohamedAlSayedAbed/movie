import 'package:hive/hive.dart';
import 'package:movie/Feature/home/domin/entities/home_entity.dart';

abstract class HomeLocalDataSource {
  Future<void> cacheNowPlayingMovies(List<HomeEntity> movies);
  Future<List<HomeEntity>?> getNowPlayingMoviesFromCache();
  void saveMoviesData(List<HomeEntity> movies, String boxName);

}

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  // final Box<HomeEntity> homeBox;

  HomeLocalDataSourceImpl();

  @override
  Future<void> cacheNowPlayingMovies(List<HomeEntity> movies) async {
    // await homeBox.clear();
    // await homeBox.addAll(movies);
  }

  @override
  Future<List<HomeEntity>?> getNowPlayingMoviesFromCache() async {
    return null;
  
    // return homeBox.values.toList();
  }

  @override
  void saveMoviesData(List<HomeEntity> movies, String boxName) {
    var box = Hive.box<HomeEntity>(boxName);
    box.addAll(movies);
  }

}
