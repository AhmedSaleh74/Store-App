import 'package:dio/dio.dart';

class API {
  final dio = Dio();
  Future<Response> get({required final String url}) async {
    final Response response = await dio.get(url);
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Error: ${response.statusCode}');
    }
  }
}
