import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:store_app/models/product_response_model.dart';

class CategoriesService {
  final dio = Dio();
  Future<List<ProductResponse>> fetchProductByCategory(
      {required final String categoryName}) async {
    final List<ProductResponse> productsByCategory = [];
    final Response response = await dio
        .get('https://fakestoreapi.com/products/category/$categoryName');
    if (response.statusCode == 200) {
      final List<dynamic> data = response.data;
      productsByCategory
          .addAll(data.map((item) => ProductResponse.fromJson(item)).toList());
    } else {
      debugPrint('Error: ${response.statusCode}');
    }
    return productsByCategory;
  }
}
