import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:movie/Feature/actors/data/data_source.dart/person_local_data_source.dart';
import 'package:movie/Feature/actors/data/data_source.dart/person_remote_data_source.dart';
import 'package:movie/Feature/actors/data/repo_impl.dart/person_repo_impl.dart';
import 'package:movie/Feature/actors/domin/repo/person_repo.dart';
import 'package:movie/Feature/actors/presentation/controllers/person_popular_cubit/person_popular_cubit.dart';
import 'package:movie/Feature/actors/presentation/controllers/person_search_cubit/person_search_cubit.dart';
import 'package:movie/Feature/favourite/data/favourite_local_data_source.dart';
import 'package:movie/Feature/favourite/presentation/controllers/favorite_cubit/favourite_cubit.dart';
import 'package:movie/Feature/home/data/data_source/home_local_data_source.dart';
import 'package:movie/Feature/home/data/repo_impl/home_repo_impl.dart';
import 'package:movie/Feature/home/domin/entities/home_entity.dart';
import 'package:movie/Feature/home/domin/entities/movie_detailes_entity.dart';
import 'package:movie/Feature/home/domin/repo/home_repo.dart';
import 'package:movie/Feature/home/presentation/controller/actor_movies_cubit/actor_movies_cubit.dart';
import 'package:movie/Feature/home/presentation/controller/casts_cubit/casts_cubit.dart';
import 'package:movie/Feature/home/presentation/controller/get_genres_cubit/get_genres_cubit.dart';
import 'package:movie/Feature/home/presentation/controller/movie_detail/movie_detail_cubit.dart';
import 'package:movie/Feature/home/presentation/controller/now_playing/now_playing_cubit.dart';
import 'package:movie/Feature/home/presentation/controller/popular_movies/popular_movies_cubit.dart';
import 'package:movie/Feature/home/presentation/controller/recommendations/recommendations_cubit.dart';
import 'package:movie/Feature/home/presentation/controller/top_ated_movies/top_rated_movies_cubit.dart';
import 'package:movie/Feature/home/presentation/controller/videos_cubit/videos_cubit.dart';
import 'package:movie/Feature/search/data/remote_data/search_remote_data.dart';
import 'package:movie/Feature/search/data/repo_impl/search_repo_impl.dart';
import 'package:movie/Feature/search/presentation/controller/search_cubit.dart';
import 'package:movie/core/constants/api_constants.dart';
import 'package:movie/core/constants/name_hive_box.dart';
import '../../../Feature/home/data/data_source/home_remote_data_source.dart';
import '../api_service.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  // Register ApiService
  getIt.registerLazySingleton<ApiService>(
    () => ApiService(Dio(BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ))),
  );

  // Register HomeCubit
  getIt.registerFactory<PopularMoviesCubit>(
    () => PopularMoviesCubit(
      getIt.get<HomeRepository>(),
    ),
  );
  getIt.registerFactory<TopRatedMoviesCubit>(
    () => TopRatedMoviesCubit(
      getIt.get<HomeRepository>(),
    ),
  );
  getIt.registerFactory<NowPlayingCubit>(
    () => NowPlayingCubit(
      getIt.get<HomeRepository>(),
    ),
  );
  getIt.registerFactory<MovieDetailCubit>(
    () => MovieDetailCubit(
      getIt.get<HomeRepository>(),
    ),
  );
  getIt.registerFactory<RecommendationsCubit>(
    () => RecommendationsCubit(
      getIt.get<HomeRepository>(),
    ),
  );
  getIt.registerFactory<VideosCubit>(
    () => VideosCubit(
      getIt.get<HomeRepository>(),
    ),
  );
  getIt.registerFactory<CastsCubit>(
    () => CastsCubit(
      getIt.get<HomeRepository>(),
    ),
  );
  getIt.registerFactory<GetGenresCubit>(
    () => GetGenresCubit(
      getIt.get<HomeRepository>(),
    ),
  );
  getIt.registerFactory<ActorMoviesCubit>(
    () => ActorMoviesCubit(
      getIt.get<HomeRepository>(),
    ),
  );
  // Register SearchCubit
  getIt.registerFactory<SearchCubit>(
    () => SearchCubit(
      getIt.get<SearchRepoImpl>(),
    ),
  );
  getIt.registerFactory<FavoriteCubit>(
    () => FavoriteCubit(
      getIt.get<FavoriteLocalDataSource>(),
    ),
  );

  // Register HomeRemoteDataSource as BaseHomeRemoteDataSource
  getIt.registerLazySingleton<BaseHomeRemoteDataSource>(
    () => HomeRemoteDataSource(apiService: getIt.get<ApiService>()),
  );
  getIt.registerLazySingleton<FavoriteLocalDataSource>(
    () => FavoriteLocalDataSourceImpl(
        Hive.box<MovieDetailsEntity>(NameHiveBox.favorites)),
  );

  // Register HomeRepoImpl
  getIt.registerLazySingleton<HomeRepository>(
    () => HomeRepoImpl(
        homeLocalDataSource: HomeLocalDataSourceImpl(
          timestampsBox: Hive.box<int>(NameHiveBox.timestampsBox),
          homeBox: Hive.box<HomeEntity>(NameHiveBox.homeBox),
          popularBox: Hive.box<HomeEntity>(NameHiveBox.popularBox),
          topRatedBox: Hive.box<HomeEntity>(NameHiveBox.topRatedBox),
        ),
        homeRemoteDataSource: getIt.get<BaseHomeRemoteDataSource>()),
  );

  // Register SearchRemoteData
  getIt.registerLazySingleton<SearchRemoteData>(() => SearchRemoteData(
        apiService: getIt.get<ApiService>(),
      ));
  getIt.registerLazySingleton<SearchRepoImpl>(() => SearchRepoImpl(
        getIt.get<SearchRemoteData>(),
      ));
  getIt.registerLazySingleton<PersonRemoteDataSource>(
      () => PersonRemoteDataSourceImpl(
            getIt.get<ApiService>(),
          ));
  getIt.registerLazySingleton<PersonRepo>(() => PersonRepoImpl(
        personLocalDataSource: PersonLocalDataSource(
            timestampsBox: Hive.box<int>(NameHiveBox.timestampsPersonBox)),
        personRemoteDataSource: getIt.get<PersonRemoteDataSource>(),
      ));
  getIt.registerFactory<PersonSearchCubit>(
    () => PersonSearchCubit(
      getIt.get<PersonRepo>(),
    ),
  );
  getIt.registerFactory<PersonPopularCubit>(
    () => PersonPopularCubit(
      getIt.get<PersonRepo>(),
    ),
  );
}
