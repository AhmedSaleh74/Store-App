import 'package:dio/dio.dart';

class AllProductServices {
  final dio = Dio();
  getAllProduct() {
    final response = dio.get('https://fakestoreapi.com/products');
  }
}
