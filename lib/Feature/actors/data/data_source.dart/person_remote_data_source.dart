import 'package:movie/Feature/actors/data/models/person_model.dart';
import 'package:movie/Feature/actors/domin/entities/person_entity.dart';
import 'package:movie/core/constants/api_constants.dart';
import 'package:movie/core/utils/api_service.dart';

abstract class PersonRemoteDataSource {
  Future<List<PersonEntity>> getSearchPersons({required String query});
  Future<List<PersonEntity>> getPopularPersons();
  Future<List<PersonEntity>> getPopularPersonsAndPagination(int page);
}

class PersonRemoteDataSourceImpl extends PersonRemoteDataSource {
  final ApiService apiService;

  PersonRemoteDataSourceImpl(this.apiService);
  @override
  Future<List<PersonEntity>> getSearchPersons({required String query}) async {
    final response = await apiService.getAndQuery(
        endPoint: ApiConstants.searchActors, query: query);
    List<PersonEntity> personSearchList = (response['results'] as List)
        .map((e) => PersonModel.fromJson(e) as PersonEntity)
        .toList();
    return personSearchList;
  }

  @override
  Future<List<PersonEntity>> getPopularPersons() async {
    final response = await apiService.get(endPoint: ApiConstants.personPopular);
    List<PersonEntity> personPopularList = (response['results'] as List)
        .map((e) => PersonModel.fromJson(e) as PersonEntity)
        .toList();
    return personPopularList;
  }
  
  @override
  Future<List<PersonEntity>> getPopularPersonsAndPagination(int page) async{
    final response = await apiService.getAndPagination(endPoint: ApiConstants.personPopular,page: page);
    List<PersonEntity> personPopularList = (response['results'] as List)
        .map((e) => PersonModel.fromJson(e) as PersonEntity)
        .toList();
    return personPopularList;
  }
}
