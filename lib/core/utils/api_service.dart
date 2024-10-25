import 'package:dio/dio.dart';
import 'package:movie/core/constants/api_constants.dart';

class ApiService {
  final Dio _dio;
  ApiService(this._dio);

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get('${ApiConstants.baseUrl}$endPoint?${ApiConstants.apiKey}');
    return response.data;
  }
}