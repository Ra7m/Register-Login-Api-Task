import 'package:dio/dio.dart';
import 'package:regapi_1/features/profile-user/model/profile-user-model.dart';
import 'package:regapi_1/helpear/cash-data.dart';


var getToken = CacheShared.shared!.get("token");

class UserProfileService {
  Future<UserProfileModelData> getUserProfileData() async {
    final Dio dio = Dio();
    var response = await dio.post(
      'https://elwekala.onrender.com/user/profile',
      data: {"token": getToken},
    );

    try {
      Map<String, dynamic> jsonData = response.data;
      var user = UserProfileModelData.fromJson(jsonData);
      return user;
    } on DioException catch (e) {
      if (e.response != null) {
        return e.response!.data;
      }
    }
    throw Exception();
  }
}