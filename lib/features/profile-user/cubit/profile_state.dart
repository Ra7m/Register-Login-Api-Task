

import 'package:regapi_1/features/profile-user/model/profile-user-model.dart';

sealed class UserProfileState {}

final class UserProfileInitial extends UserProfileState {}

final class UserSuccessState extends UserProfileState {
  final UserProfileModelData userData;
  UserSuccessState({required this.userData});
}

final class UserLoadingState extends UserProfileState {}
