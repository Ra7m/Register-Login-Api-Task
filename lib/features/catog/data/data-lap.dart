// ignore_for_file: avoid_print, file_names

import 'package:dio/dio.dart';
import 'package:regapi_1/features/catog/moddel/model.dart';

class LapHomeData {
  static Dio dio = Dio();
  static getLap() async {
    var response =
        await dio.get("https://elwekala.onrender.com/product/Laptops");
    try {
      if (response.statusCode == 200) {
        List<dynamic> repoData = response.data["product"];
        print(repoData);
        List<LapHomeModel> listModel =
            repoData.map((e) => LapHomeModel.fromJson(e)).toList();
        print(listModel[1].image);
        print(listModel[4].image);

        return listModel;
      }
    } on DioException catch (error) {
      if (error.response != null) {
        return error.response!.data;
      }
    }
  }
}
