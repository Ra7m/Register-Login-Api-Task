// ignore_for_file: unnecessary_import, unused_import

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:regapi_1/features/Auth/model/dataauth/authdata.dart';

import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final AuthData authData = AuthData();

  postDataCubit(
      {required namedata,
      required emaildata,
      required genderdata,
      required nationalIddata,
      required passworddata,
      required phonedata,
      profileImagedata,
      required tokendata}) async {
    emit(AuthLoadingState());
    var user = await authData.postData(
      name: namedata,
      email: emaildata,
      gender: genderdata,
      nationalId: nationalIddata,
      password: passworddata,
      phone: phonedata,
      profileImage: userImage,
      token: tokendata,
    );

    emit(AuthSucessState(userdata: user));
  }

  ImagePicker picker = ImagePicker();
  File? image;
  String? userImage;

  Future<void> addImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      Uint8List bytes = File(image!.path).readAsBytesSync();
      userImage = base64Encode(bytes);
      if (kDebugMode) {
        print('images = $userImage');
      }
      emit(ChooseImage());
    } else {
      if (kDebugMode) {
        print('no image selected');
      }
    }
  }

  postDatalogCubit({
    required emaildata,
    required passworddata,
  }) async {
    emit(AuthLoadinglogState());
    var user = await authData.postlogData(
      email: emaildata,
      password: passworddata,
    );

    emit(AuthSucesslogState(Userdata: user));
  }
}
