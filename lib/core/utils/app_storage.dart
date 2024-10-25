import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie/Feature/home/domin/entities/movie_detailes_entity.dart';

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
    _favoritesBox = await Hive.openBox<MovieDetailsEntity>('favorites');
  }

  // الحصول على صندوق المفضلات
  Box<MovieDetailsEntity> get favoritesBox {
    if (_favoritesBox == null) {
      throw Exception('Hive is not initialized. Call initHive() first.');
    }
    return _favoritesBox!;
  }
}
