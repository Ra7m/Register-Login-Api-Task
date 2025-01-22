import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:regapi_1/features/profile-user/cubit/profile_cubit.dart';
import 'package:regapi_1/features/profile-user/cubit/profile_state.dart';
import 'package:regapi_1/features/profile-user/view/widget/user-widget.dart';


class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: appBarForm(title: "Profile"),
      body: BlocBuilder<UserProfileCubit, UserProfileState>(
        builder: (context, state) {
          if (state is UserSuccessState) {
            return UserWidget(user: state.userData);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}