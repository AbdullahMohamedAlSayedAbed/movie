import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie/Feature/actors/data/data_source.dart/person_local_data_source.dart';
import 'package:movie/Feature/actors/data/data_source.dart/person_remote_data_source.dart';
import 'package:movie/Feature/actors/domin/entities/person_entity.dart';
import 'package:movie/Feature/actors/domin/repo/person_repo.dart';
import 'package:movie/core/errors/failure.dart';
import 'package:movie/core/utils/functions/check_internet_connection.dart';
import 'package:movie/core/utils/functions/should_fetch_from_network.dart';

class PersonRepoImpl extends PersonRepo {
  final PersonRemoteDataSource personRemoteDataSource;
  final PersonLocalDataSource personLocalDataSource;

  PersonRepoImpl(
      {required this.personRemoteDataSource,
      required this.personLocalDataSource});

  @override
  Future<Either<Failure, List<PersonEntity>>> getPersonsSearch(
      {required String query}) async {
    bool isConnected = await checkInternetConnection();
    try {
      if (isConnected) {
        List<PersonEntity> personSearchList =
            await personRemoteDataSource.getSearchPersons(query: query);
        return right(personSearchList);
      } else {
        return left(ServerFailure(
            "No internet connection and no cached data available."));
      }
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<PersonEntity>>> getPersonPopular() async {
    bool isConnected = await checkInternetConnection();
    int? lastUpdate = personLocalDataSource
        .getLastUpdateTimestamp(PersonLocalDataSource.personTimestampKey);
    if (!shouldFetchFromNetwork(lastUpdate)) {
      final List<PersonEntity> personList =
          personLocalDataSource.getAllPersons();
      if (personList.isNotEmpty) {
        return right(personList);
      }
    }
    try {
      if (isConnected) {
        final List<PersonEntity> personList =
            await personRemoteDataSource.getPopularPersons();
        await personLocalDataSource.saveAndClearPerson(personList);
        return right(personList);
      } else {
        final List<PersonEntity> personList =
            personLocalDataSource.getAllPersons();

        if (personList.isNotEmpty) {
          return right(personList);
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
  Future<Either<Failure, List<PersonEntity>>> getPersonPopularAndPagination(
      int page) async {
    bool isConnected = await checkInternetConnection();
    try {
      if (isConnected) {
        List<PersonEntity> personList =
            await personRemoteDataSource.getPopularPersonsAndPagination(page);
        await personLocalDataSource.savePerson(personList);
        return right(personList);
      } else {
        List<PersonEntity>? personList = personLocalDataSource.getAllPersons();
        if (personList.isNotEmpty) {
          return right(personList);
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
}
