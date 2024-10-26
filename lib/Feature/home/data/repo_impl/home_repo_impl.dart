import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie/Feature/home/data/data_source/home_local_data_source.dart';
import 'package:movie/Feature/home/data/data_source/home_remote_data_source.dart';
import 'package:movie/Feature/home/domin/entities/home_entity.dart';
import 'package:movie/Feature/home/domin/entities/movie_detailes_entity.dart';
import 'package:movie/Feature/home/domin/entities/recommendation_entity.dart';
import 'package:movie/Feature/home/domin/entities/video_entity.dart';
import 'package:movie/Feature/home/domin/repo/home_repo.dart';
import 'package:movie/core/errors/failure.dart';
import 'package:movie/core/utils/functions/check_internet_connection.dart';

class HomeRepoImpl implements HomeRepository {
  final BaseHomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;
  HomeRepoImpl(
      {required this.homeLocalDataSource, required this.homeRemoteDataSource});
  @override
  Future<Either<Failure, List<HomeEntity>>> getNowPlaying() async {
    bool isConnected = await checkInternetConnection();
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
  Future<Either<Failure, List<HomeEntity>>> getTopRatedMovies() async {
    bool isConnected = await checkInternetConnection();
    try {
      if (isConnected) {
        List<HomeEntity> moviesList =
            await homeRemoteDataSource.getTopRatedMovies();
        await homeLocalDataSource.cacheTopRatedMovies(moviesList);
        return right(moviesList);
      }else
      {
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
}
