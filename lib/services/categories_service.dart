import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_response_model.dart';

class CategoriesService {
  final API api;
  CategoriesService({required this.api});
  Future<List<ProductResponse>> fetchProductByCategory(
      {required final String categoryName}) async {
    final List<ProductResponse> productsByCategory = [];
    final Response response = await api.get(
        url: 'https://fakestoreapi.com/products/category/$categoryName');
    final List<dynamic> data = response.data;
    productsByCategory.clear();
    productsByCategory
        .addAll(data.map((item) => ProductResponse.fromJson(item)).toList());
    return productsByCategory;
  }
}
