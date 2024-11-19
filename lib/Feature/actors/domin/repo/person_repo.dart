import 'package:dartz/dartz.dart';
import 'package:movie/Feature/actors/domin/entities/person_entity.dart';
import 'package:movie/core/errors/failure.dart';

abstract class PersonRepo {
  Future<Either<Failure, List<PersonEntity>>> getPersonsSearch(
      {required String query});
  Future<Either<Failure, List<PersonEntity>>> getPersonPopular();
  Future<Either<Failure, List<PersonEntity>>> getPersonPopularAndPagination(int page);
}
