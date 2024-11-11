import 'package:dio/dio.dart';
import 'package:movie/core/constants/api_constants.dart';

class ApiService {
  final Dio _dio;
  ApiService(this._dio);

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get('$endPoint?${ApiConstants.apiKey}');
    return response.data;
  }

  Future<Map<String, dynamic>> getAndQuery(
      {required String endPoint, required String query}) async {
    var response =
        await _dio.get('$endPoint?${ApiConstants.apiKey}&query=$query');
    return response.data;
  }

  Future<Map<String, dynamic>> getAndPagination({
    required String endPoint,
    int page = 1,
  }) async {
    var response = await _dio.get(
      '$endPoint?${ApiConstants.apiKey}&page=$page',
    );
    return response.data;
  }
  Future<Map<String, dynamic>> getAndPaginationAndDiscover({
    required String endPoint,
    int page = 1,
    required int genreId,
  }) async {
    var response = await _dio.get(
      '$endPoint?${ApiConstants.apiKey}&page=$page&with_genres=$genreId',
    );
    return response.data;
  }
}
