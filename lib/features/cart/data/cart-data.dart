// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:regapi_1/core/style/value.dart';

class Cartdata {
  static Dio dio = Dio();
  static addCart({required String id}) async {
    var response =
        await dio.post("https://elwekala.onrender.com/cart/add", data: {
      "nationalId": getId,
      "productId": id,
      "quantity": "1"
    });
    var data = response.data;
    print(data);
    return data;
  }
}
