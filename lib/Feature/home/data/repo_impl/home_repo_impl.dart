import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie/Feature/home/data/data_source/home_remote_data_source.dart';
import 'package:movie/Feature/home/domin/entities/home_entity.dart';
import 'package:movie/Feature/home/domin/entities/movie_detailes_entity.dart';
import 'package:movie/Feature/home/domin/entities/recommendation_entity.dart';
import 'package:movie/Feature/home/domin/repo/home_repo.dart';
import 'package:movie/core/errors/failure.dart';

class HomeRepoImpl implements HomeRepository {
  final BaseHomeRemoteDataSource homeRemoteDataSource;
  // final HomeLocalDataSource homeLocalDataSource;
  HomeRepoImpl({required this.homeRemoteDataSource});
  @override
  Future<Either<Failure, List<HomeEntity>>> getNowPlaying() async {
    try {
      // List<HomeEntity>? cachedMovies =
      //     await homeLocalDataSource.getNowPlayingMoviesFromCache();

      // if (cachedMovies != null && cachedMovies.isNotEmpty) {
      //   return right(cachedMovies);
      // }
      List<HomeEntity> moviesList =
          await homeRemoteDataSource.getNowPlayingMovies();
      // await homeLocalDataSource.cacheNowPlayingMovies(moviesList);

      return right(moviesList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<HomeEntity>>> getPopularMovies() async {
    try {
      List<HomeEntity> moviesList =
          await homeRemoteDataSource.getPopularMovies();

      return right(moviesList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<HomeEntity>>> getTopRatedMovies() async {
    try {
      List<HomeEntity> moviesList =
          await homeRemoteDataSource.getTopRatedMovies();
      return right(moviesList);
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
}
