import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie/Feature/home/domin/entities/home_entity.dart';
import 'package:movie/Feature/home/domin/entities/movie_detailes_entity.dart';
import 'package:movie/core/constants/name_hive_box.dart';

class AppStorage {
  static final AppStorage _instance = AppStorage._internal();

  // صندوق المفضلات
  Box<MovieDetailsEntity>? _favoritesBox;

  AppStorage._internal();

  // توفير نسخة وحيدة من HiveManager
  factory AppStorage() {
    return _instance;
  }

  // تهيئة Hive وفتح الصناديق المطلوبة
  Future<void> initHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(MovieDetailsEntityAdapter());
    Hive.registerAdapter(GenreEntityAdapter());
    Hive.registerAdapter(HomeEntityAdapter());
    _favoritesBox = await Hive.openBox<MovieDetailsEntity>(NameHiveBox.favorites);
    await Hive.openBox<HomeEntity>(NameHiveBox.homeBox);
    await Hive.openBox<HomeEntity>(NameHiveBox.popularBox);
    await Hive.openBox<HomeEntity>(NameHiveBox.topRatedBox);
    await Hive.openBox<int>(NameHiveBox.timestampsBox);
    await Hive.openBox<GenreEntity>(NameHiveBox.genres);
  }

  // الحصول على صندوق المفضلات
  Box<MovieDetailsEntity> get favoritesBox {
    if (_favoritesBox == null) {
      throw Exception('Hive is not initialized. Call initHive() first.');
    }
    return _favoritesBox!;
  }
}
