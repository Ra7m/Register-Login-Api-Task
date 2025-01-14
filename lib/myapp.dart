// ignore_for_file: unused_import
import 'package:flutter/material.dart';
import 'package:regapi_1/features/Auth/view/screenn/authscreen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthScreen(),
    );
  }
}