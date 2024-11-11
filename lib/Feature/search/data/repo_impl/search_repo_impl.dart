import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie/Feature/home/domin/entities/home_entity.dart';
import 'package:movie/Feature/search/data/remote_data/search_remote_data.dart';
import 'package:movie/core/errors/failure.dart';

class SearchRepoImpl {
  final SearchRemoteData searchRemoteData;

  SearchRepoImpl(this.searchRemoteData);

  Future<Either<Failure, List<HomeEntity>>> getMoviesSearch(
      String query) async {
    try {
      final result = await searchRemoteData.getMoviesSearch(query);
      return right(result);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
