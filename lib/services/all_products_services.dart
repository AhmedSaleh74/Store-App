import 'package:dio/dio.dart';
import '../helper/api.dart';
import '../models/product_response_model.dart';

class AllProductServices {
  final API api;
  AllProductServices({required this.api});

  Future<List<ProductResponse>> fetchProducts() async {
    final List<ProductResponse> products = [];

    final Response response =
        await api.get(url: 'https://fakestoreapi.com/products');

    final List<dynamic> data = response.data;
    products.clear();
    products
        .addAll(data.map((item) => ProductResponse.fromJson(item)).toList());
    return products;
  }
}
