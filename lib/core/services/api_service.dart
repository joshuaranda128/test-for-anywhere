import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio()
    ..options.connectTimeout = const Duration(milliseconds: 5000)
    ..options.receiveTimeout = const Duration(milliseconds: 5000)
    ..options.sendTimeout = const Duration(milliseconds: 5000);

  Future<Response> postRequest({
    required String path,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    _dio.options.contentType = Headers.jsonContentType;
    final response = await _dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
    );
    return response;
  }

  Future<Response> getRequest({
    required String path,
    Map<String, dynamic>? queryParams,
  }) async {
    final response = await _dio.get(
      path,
      queryParameters: queryParams,
    );
    return response;
  }
}
