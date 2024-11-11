import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie/Feature/home/data/data_source/home_local_data_source.dart';
import 'package:movie/Feature/home/data/data_source/home_remote_data_source.dart';
import 'package:movie/Feature/home/domin/entities/actor_entity.dart';
import 'package:movie/Feature/home/domin/entities/actor_movies_entity.dart';
import 'package:movie/Feature/home/domin/entities/cast_entity.dart';
import 'package:movie/Feature/home/domin/entities/home_entity.dart';
import 'package:movie/Feature/home/domin/entities/movie_detailes_entity.dart';
import 'package:movie/Feature/home/domin/entities/recommendation_entity.dart';
import 'package:movie/Feature/home/domin/entities/video_entity.dart';
import 'package:movie/Feature/home/domin/repo/home_repo.dart';
import 'package:movie/core/constants/name_hive_box.dart';
import 'package:movie/core/errors/failure.dart';
import 'package:movie/core/utils/functions/check_internet_connection.dart';
import 'package:movie/core/utils/functions/save_movies_data.dart';
import 'package:movie/core/utils/functions/should_fetch_from_network.dart';

class HomeRepoImpl implements HomeRepository {
  final BaseHomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;
  HomeRepoImpl(
      {required this.homeLocalDataSource, required this.homeRemoteDataSource});
  @override
  Future<Either<Failure, List<HomeEntity>>> getNowPlaying() async {
    bool isConnected = await checkInternetConnection();
    int? lastUpdate = homeLocalDataSource
        .getLastUpdateTimestamp(HomeLocalDataSourceImpl.nowPlayingTimestampKey);
    if (!shouldFetchFromNetwork(lastUpdate)) {
      final moviesList = homeLocalDataSource.getNowPlayingMoviesFromCache();
      if (moviesList != null && moviesList.isNotEmpty) {
        return right(moviesList);
      }
    }
    try {
      if (isConnected) {
        List<HomeEntity> moviesList =
            await homeRemoteDataSource.getNowPlayingMovies();
        await homeLocalDataSource.cacheNowPlayingMovies(moviesList);
        return right(moviesList);
      } else {
        List<HomeEntity>? moviesList =
            homeLocalDataSource.getNowPlayingMoviesFromCache();

        if (moviesList != null && moviesList.isNotEmpty) {
          return right(moviesList);
        } else {
          return left(ServerFailure(
              "No internet connection and no cached data available."));
        }
      }
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<HomeEntity>>> getPopularMovies() async {
    bool isConnected = await checkInternetConnection();
    int? lastUpdate = homeLocalDataSource.getLastUpdateTimestamp(
        HomeLocalDataSourceImpl.popularMoviesTimestampKey);
    if (!shouldFetchFromNetwork(lastUpdate)) {
      final moviesList = homeLocalDataSource.getPopularMoviesFromCache();
      if (moviesList != null && moviesList.isNotEmpty) {
        return right(moviesList);
      }
    }
    try {
      if (isConnected) {
        List<HomeEntity> moviesList =
            await homeRemoteDataSource.getPopularMovies();
        await homeLocalDataSource.cachePopularMovies(moviesList);
        return right(moviesList);
      } else {
        List<HomeEntity>? moviesList =
            homeLocalDataSource.getPopularMoviesFromCache();
        if (moviesList != null && moviesList.isNotEmpty) {
          return right(moviesList);
        } else {
          return left(ServerFailure(
              "No internet connection and no cached data available."));
        }
      }
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<HomeEntity>>> getPopularPaginationMovies(
      {required int page}) async {
    bool isConnected = await checkInternetConnection();
    try {
      if (isConnected) {
        List<HomeEntity> moviesList =
            await homeRemoteDataSource.getPopularPaginationMovies(page: page);
        saveMoviesData(moviesList, NameHiveBox.popularBox);
        return right(moviesList);
      } else {
        List<HomeEntity>? moviesList = homeLocalDataSource
            .getMoviesByPageFromCache(NameHiveBox.popularBox);
        if (moviesList != null && moviesList.isNotEmpty) {
          return right(moviesList);
        } else {
          return left(ServerFailure(
              "No internet connection and no cached data available."));
        }
      }
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<HomeEntity>>> getTopRatedPaginationMovies(
      {required int page}) async {
    bool isConnected = await checkInternetConnection();
    try {
      if (isConnected) {
        List<HomeEntity> moviesList =
            await homeRemoteDataSource.getTopRatedPaginationMovies(page: page);
        saveMoviesData(moviesList, NameHiveBox.topRatedBox);
        return right(moviesList);
      } else {
        List<HomeEntity>? moviesList = homeLocalDataSource
            .getMoviesByPageFromCache(NameHiveBox.topRatedBox);
        if (moviesList != null && moviesList.isNotEmpty) {
          return right(moviesList);
        } else {
          return left(ServerFailure(
              "No internet connection and no cached data available."));
        }
      }
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<HomeEntity>>> getTopRatedMovies() async {
    bool isConnected = await checkInternetConnection();
    int? lastUpdate = homeLocalDataSource.getLastUpdateTimestamp(
        HomeLocalDataSourceImpl.topRatedMoviesTimestampKey);
    if (!shouldFetchFromNetwork(lastUpdate)) {
      final moviesList = homeLocalDataSource.getTopRatedMoviesFromCache();
      if (moviesList != null && moviesList.isNotEmpty) {
        return right(moviesList);
      }
    }
    try {
      if (isConnected) {
        List<HomeEntity> moviesList =
            await homeRemoteDataSource.getTopRatedMovies();
        await homeLocalDataSource.cacheTopRatedMovies(moviesList);
        return right(moviesList);
      } else {
        List<HomeEntity>? moviesList =
            homeLocalDataSource.getTopRatedMoviesFromCache();
        if (moviesList != null && moviesList.isNotEmpty) {
          return right(moviesList);
        } else {
          return left(ServerFailure(
              "No internet connection and no cached data available."));
        }
      }
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, MovieDetailsEntity>> getMovieDetails(
      int movieId) async {
    try {
      MovieDetailsEntity movieDetail =
          await homeRemoteDataSource.getMovieDetails(movieId);
      return right(movieDetail);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<RecommendationEntity>>> getMovieRecommendations(
      int movieId) async {
    try {
      List<RecommendationEntity> recommendationList =
          await homeRemoteDataSource.getRecommendations(movieId);
      return right(recommendationList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<VideoEntity>>> getVideos(int movieId) async {
    try {
      List<VideoEntity> videos = await homeRemoteDataSource.getVideos(movieId);
      return right(videos);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CastEntity>>> getCast(int movieId) async {
    try {
      List<CastEntity> casts = await homeRemoteDataSource.getCast(movieId);
      return right(casts);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<GenreEntity>>> getGenres() async {
    try {
      List<GenreEntity>? genres =
          homeLocalDataSource.getGenresMoviesFromCache(NameHiveBox.genres);
      if (genres == null && genres!.isEmpty) {
        genres = await homeRemoteDataSource.getGenres();
        saveGenresMoviesData(genres, NameHiveBox.genres);
      }
      return right(genres);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<HomeEntity>>> getDiscoverMovies(
      {int page = 1, required int id}) async {
    try {
      List<HomeEntity> moviesList =
          await homeRemoteDataSource.getDiscoverMovies(page: page, id: id);
      return right(moviesList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ActorEntity>> actorInfo(int personId) async {
    try {
      ActorEntity actor = await homeRemoteDataSource.actorInfo(personId);
      return right(actor);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ActorMoviesEntity>>> getActorMovies(int personId) async {
    try {
      List<ActorMoviesEntity> actorMovies =
          await homeRemoteDataSource.getActorMovies(personId);
      return right(actorMovies);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
