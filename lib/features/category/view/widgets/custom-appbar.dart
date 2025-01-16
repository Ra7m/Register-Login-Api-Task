// ignore_for_file: file_names

import 'package:flutter/material.dart';

AppBar customAppBar({required String title}) {
  return AppBar(
      title: Text(
        title,
        style: const TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
      ),
      centerTitle: true,
      elevation: 5,
      backgroundColor: Colors.brown);
}