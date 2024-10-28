import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie/Feature/home/domin/entities/home_entity.dart';
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
    Hive.registerAdapter(HomeEntityAdapter());
    _favoritesBox = await Hive.openBox<MovieDetailsEntity>('favorites');
    await Hive.openBox<HomeEntity>('homeBox');
    await Hive.openBox<HomeEntity>('PopularBox');
    await Hive.openBox<HomeEntity>('TopRatedBox');
    await Hive.openBox<int>('10minutes');

  }

  // الحصول على صندوق المفضلات
  Box<MovieDetailsEntity> get favoritesBox {
    if (_favoritesBox == null) {
      throw Exception('Hive is not initialized. Call initHive() first.');
    }
    return _favoritesBox!;
  }
}
