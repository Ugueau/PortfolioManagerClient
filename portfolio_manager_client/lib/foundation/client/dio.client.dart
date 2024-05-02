import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

/// Dio client class to make http requests
@singleton
class DioClient {
  final Dio _dio = Dio();

  DioClient() {
    BaseOptions options = BaseOptions(
      baseUrl: 'http://localhost:3000',
      connectTimeout: const Duration(seconds: 5),
      contentType: Headers.formUrlEncodedContentType,
    );
    _dio.options = options;
  }

  Dio get dio => _dio;
}
