import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie/Feature/actors/domin/entities/person_entity.dart';
import 'package:movie/Feature/home/domin/entities/home_entity.dart';
import 'package:movie/Feature/home/domin/entities/movie_detailes_entity.dart';
import 'package:movie/core/constants/name_hive_box.dart';

class AppStorage {
  // Singleton Instance
  static final AppStorage _instance = AppStorage._internal();

  // Private Constructor
  AppStorage._internal();

  // Factory Constructor to return the singleton instance
  factory AppStorage() => _instance;

  // Boxes
  late final Box<MovieDetailsEntity> _favoritesBox;
  late final Box<HomeEntity> _homeBox;
  late final Box<HomeEntity> _popularBox;
  late final Box<HomeEntity> _topRatedBox;
  late final Box<int> _timestampsBox;
  late final Box<GenreEntity> _genresBox;
  late final Box<PersonEntity> _personBox;

  // Initialization Method
  Future<void> initHive() async {
    await Hive.initFlutter();

    // Register Adapters
    _registerAdapters();

    // Open Boxes
    _favoritesBox = await _openBox<MovieDetailsEntity>(NameHiveBox.favorites);
    _homeBox = await _openBox<HomeEntity>(NameHiveBox.homeBox);
    _popularBox = await _openBox<HomeEntity>(NameHiveBox.popularBox);
    _topRatedBox = await _openBox<HomeEntity>(NameHiveBox.topRatedBox);
    _timestampsBox = await _openBox<int>(NameHiveBox.timestampsBox);
    _genresBox = await _openBox<GenreEntity>(NameHiveBox.genres);
    _personBox = await _openBox<PersonEntity>(NameHiveBox.personBox);
    await _openBox<int>(NameHiveBox.timestampsPersonBox);
    await _openBox<KnownForEntity>(NameHiveBox.knownFor);
  }

  // Register Hive Adapters
  void _registerAdapters() {
    Hive.registerAdapter(MovieDetailsEntityAdapter());
    Hive.registerAdapter(GenreEntityAdapter());
    Hive.registerAdapter(HomeEntityAdapter());
    Hive.registerAdapter(PersonEntityAdapter());
    Hive.registerAdapter(KnownForEntityAdapter());
  }

  // Generic Method to Open a Box
  Future<Box<T>> _openBox<T>(String name) async => await Hive.openBox<T>(name);

  // Box Accessors
  Box<MovieDetailsEntity> get favoritesBox => _favoritesBox;
  Box<HomeEntity> get homeBox => _homeBox;
  Box<HomeEntity> get popularBox => _popularBox;
  Box<HomeEntity> get topRatedBox => _topRatedBox;
  Box<int> get timestampsBox => _timestampsBox;
  Box<GenreEntity> get genresBox => _genresBox;
  Box<PersonEntity> get personBox => _personBox;
}
