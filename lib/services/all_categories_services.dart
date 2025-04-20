import 'package:dio/dio.dart';
import 'package:store_app/helper/api.dart';

class CategoryService {
  final API api;
  CategoryService({required this.api});
  Future<List<String>> fetchCategories() async {
    final List<String> categories = [];
    final Response response =
        await api.get(url: 'https://fakestoreapi.com/products/categories');

    final List<dynamic> data = response.data;
    categories.clear();
    categories
        .addAll(data.cast<String>()); // تحويل List<dynamic> إلى List<String>
    return categories;
  }
}
