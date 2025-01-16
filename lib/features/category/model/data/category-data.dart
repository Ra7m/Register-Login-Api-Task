import 'package:dio/dio.dart';
import 'package:regapi_1/features/category/model/category-model/category-model.dart';

class CategoryData {
  final Dio dio = Dio();
  Future<List<CategoryModel>> getData({required String endPoint}) async {
    var response =
        await dio.get('https://fakestoreapi.com/products/category/$endPoint');
    if (response.statusCode == 200) {
      List data = response.data;
      List<CategoryModel> listCategory =
          data.map((e) => CategoryModel.fromJson(e)).toList();
      return listCategory;
    } else {
      throw Exception('Failed to load data');
    }
  }
}