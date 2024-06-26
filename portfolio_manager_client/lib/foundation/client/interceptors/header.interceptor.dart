import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:portfolio_manager_client/foundation/client/dio.client.dart';

@singleton
class HeaderInterceptor {
  final DioClient _dioClient;

  HeaderInterceptor({required DioClient dioClient}) : _dioClient = dioClient {
    _init();
  }

  void _init() {
    _dioClient.dio.interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
        options.headers.addAll(
          <String, dynamic>{'Content-Type': 'application/json'},
        );
        handler.next(options);
      },
    ));
  }
}
