import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:injectable/injectable.dart';

/// Dio client class to make http requests
@singleton
class DioClient extends DioForNative {
  ///
  /// Get default [BaseOptions]
  ///
  static BaseOptions get _baseOptions => BaseOptions()
    ..followRedirects = true
    ..baseUrl =
        'http://localhost:3000'
    ..connectTimeout = const Duration(seconds: 30)
    ..maxRedirects = 5
    ..contentType = Headers.formUrlEncodedContentType;

  ///
  /// Constructor
  ///
  DioClient() : super(_baseOptions);
}
