import 'package:dio/dio.dart';

Dio getDio() {
  Dio dio = Dio();
  dio.interceptors.add(
    InterceptorsWrapper(onRequest: (RequestOptions options, handler) {}),
  );

  return dio;
}
