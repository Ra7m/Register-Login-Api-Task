// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:regapi_1/features/Auth/view/screenn/authloginscreen.dart';
import 'package:regapi_1/features/Auth/view/screenn/authscreen.dart';
import 'package:regapi_1/features/cart/cubit/cart_cubit.dart';
import 'package:regapi_1/features/category/view/screen/login.dart';
import 'package:regapi_1/features/catog/view/screen/home-lap-cart.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      builder: (_, child) {
        return BlocProvider(
          create: (context) => CartCubit(),
          child: const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: AuthloginScreen(),
          ),
        );
      },
    );
  }
}
