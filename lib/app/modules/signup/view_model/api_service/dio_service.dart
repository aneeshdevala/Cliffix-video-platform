import 'package:cliffix/app/domain/api_endpoints.dart';
import 'package:dio/dio.dart';

class DioServies {
  static final dio = Dio(BaseOptions(baseUrl: Url.baseUrl));

  static Future<Response<dynamic>> postFunction(
      {required String url, required value}) async {
    return await dio.post(url, data: value).then((value) => value);
  }
}
