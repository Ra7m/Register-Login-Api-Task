import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:regapi_1/features/profile-user/cubit/profile_state.dart';
import 'package:regapi_1/features/profile-user/service/user-profile-srv.dart';


class UserProfileCubit extends Cubit<UserProfileState> {
  UserProfileCubit() : super(UserProfileInitial());
  UserProfileService userProfileService = UserProfileService();

  getUserProfileDataCubit() async {
    emit(UserLoadingState());
    var success = await userProfileService.getUserProfileData();
    emit(UserSuccessState(userData: success));
  }
}
