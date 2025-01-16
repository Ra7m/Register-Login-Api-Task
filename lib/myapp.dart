// ignore_for_file: unused_import
import 'package:flutter/material.dart';
import 'package:regapi_1/features/Auth/view/screenn/authloginscreen.dart';
import 'package:regapi_1/features/Auth/view/screenn/authscreen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:device_preview/device_preview.dart';
import 'package:regapi_1/features/splash/splash.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScreenUtilInit(
      designSize: Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        builder: DevicePreview.appBuilder,
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
