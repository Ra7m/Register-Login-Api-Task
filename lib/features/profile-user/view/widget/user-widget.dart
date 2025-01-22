import 'package:flutter/material.dart';
import 'package:regapi_1/features/profile-user/model/profile-user-model.dart';
import 'package:regapi_1/features/profile-user/view/widget/img-shower.dart';
import 'package:regapi_1/features/profile-user/view/widget/info.dart';


class UserWidget extends StatelessWidget {
  const UserWidget({required this.user, super.key});
  final UserProfileModelData user;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 16,
        ),
        child: Column(
          // spacing: 16,
          children: [
            imageShower(image: user.userProfileModel.profileImage),
            InfoCard(
              icon: Icons.person,
              txt: user.userProfileModel.name,
            ),
            InfoCard(
              icon: Icons.email,
              txt: user.userProfileModel.email,
            ),
            InfoCard(
              icon: Icons.badge,
              txt: user.userProfileModel.nationalId,
            ),
            InfoCard(
              icon: Icons.phone,
              txt: user.userProfileModel.phone,
            ),
          ],
        ),
      ),
    );
  }
}