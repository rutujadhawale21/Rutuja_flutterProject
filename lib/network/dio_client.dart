import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../constants/constants.dart';

class DioClient {
  final Dio _dio = Dio();

  DioClient() {
    _dio.options
      ..baseUrl = APIEndpoints.currencyAPIUrl
      ..headers = {'content-Type': 'applications/header'};
  }

  Future<Response> get(String endpoint,
      {Map<String, dynamic>? queryParameter}) async {
    try {
      return await _dio.get(endpoint, queryParameters: queryParameter);
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }
}

final dioProvider = Provider((ref) => DioClient());
