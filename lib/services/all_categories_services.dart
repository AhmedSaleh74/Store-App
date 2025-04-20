import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class CategoryService {
  final Dio dio = Dio();

  Future<List<String>> fetchCategories() async {
    List<String> categories = [];

    final Response response =
        await dio.get('https://fakestoreapi.com/products/categories');

    if (response.statusCode == 200) {
      final List<dynamic> data = response.data;
      categories = data.cast<String>(); // تحويل List<dynamic> إلى List<String>
    } else {
      debugPrint('Error: ${response.statusCode}');
    }

    return categories;
  }
}
