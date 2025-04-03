import 'package:dio/dio.dart';

class ApiServices {
  final dio = Dio();
  Options options = Options(
    receiveDataWhenStatusError: true,
    contentType: 'application/json',
    sendTimeout: Duration(seconds: 5),
    receiveTimeout: Duration(seconds: 5),
  );
  Map<String, dynamic> headers = {'Token': 'Bearer Token'};

  ///GetReq
  Future<dynamic> getApi({
    required String apiurl,
    bool isAuthRequired = false,
  }) async {
    if (isAuthRequired == true) {
      options.headers = headers;
    }
    try {
      Response response = await dio.get(apiurl, options: options);
      return response.data;
    } catch (e) {
      print(e.toString());
    }
  }

  ///Postreq
  Future<dynamic> postApi({
    required String apiurl,
    Object? data,
    bool isAuthRequired = false,
  }) async {
    if (isAuthRequired == true) {
      options.headers = headers;
    }
    try {
      Response response = await dio.post(apiurl, data: data, options: options);
      return response.data;
    } catch (e) {
      print(e.toString());
    }
  }
}
