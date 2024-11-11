import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie/Feature/home/domin/entities/home_entity.dart';
import 'package:movie/Feature/home/domin/entities/movie_detailes_entity.dart';

void saveMoviesData(List<HomeEntity> movies, String boxName) {
  var box = Hive.box<HomeEntity>(boxName);
  box.addAll(movies);
}
void saveGenresMoviesData(List<GenreEntity> movies, String boxName) {
  var box = Hive.box<GenreEntity>(boxName);
  box.addAll(movies);
}
