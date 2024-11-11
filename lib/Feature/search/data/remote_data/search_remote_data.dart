import 'package:movie/Feature/home/data/models/home_model.dart';
import 'package:movie/Feature/home/domin/entities/home_entity.dart';
import 'package:movie/core/constants/api_constants.dart';
import 'package:movie/core/utils/api_service.dart';

class SearchRemoteData {
  final ApiService apiService;

  SearchRemoteData({required this.apiService});
  Future<List<HomeEntity>> getMoviesSearch(String query) async {
    final response = await apiService.getAndQuery(
        endPoint: ApiConstants.search, query: query);
    List<HomeEntity> moviesList = getMoviesList(response);
    return moviesList;
  }

  List<HomeEntity> getMoviesList(Map<String, dynamic> data) {
    List<HomeEntity> moviesList = [];
    for (var movie in data['results']) {
      moviesList.add(HomeModel.fromJson(movie));
    }
    return moviesList;
  }
}
