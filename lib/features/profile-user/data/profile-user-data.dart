// ignore_for_file: unused_catch_clause, file_names, avoid_print, empty_catches

import 'package:dio/dio.dart';
import 'package:regapi_1/features/profile-user/model/profile-user-model.dart';


class ProfileUserData {
 static Dio dio = Dio();
 static getProfile() async {
    var response = await dio.post(
      "https://elwekala.onrender.com/user/profile",
      data: {"token": "r09ypnum75im6282yuu"},
    );
    try {
      var repoData = response.data;
      var user = UserProfileModelData.fromJson(repoData);
      print(user.userProfileModel.profileImage);
      return user;
    } on DioException catch (e) {}
  }
}
