import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie/Feature/home/domin/entities/home_entity.dart';

void saveMoviesData(List<HomeEntity> movies, String boxName) {
  var box = Hive.box<HomeEntity>(boxName);
  box.addAll(movies);
}
