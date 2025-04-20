import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../models/product_response_model.dart';

class AllProductServices {
  final dio = Dio();

  Future<List<ProductResponse>> fetchProducts() async {
    List<ProductResponse> products = [];

    final Response response =
        await dio.get('https://fakestoreapi.com/products');

    if (response.statusCode == 200) {
      final List<dynamic> data = response.data;
      products = data.map((item) => ProductResponse.fromJson(item)).toList();
    } else {
      debugPrint('Error: ${response.statusCode}');
    }

    return products;
  }
}
