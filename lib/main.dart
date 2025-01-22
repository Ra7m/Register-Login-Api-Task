// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:regapi_1/core/blocobserve.dart';
import 'package:regapi_1/features/catog/data/data-lap.dart';
import 'package:regapi_1/features/profile-user/data/profile-user-data.dart';
import 'package:regapi_1/helpear/cash-data.dart';
import 'package:regapi_1/myapp.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  CacheShared.init();
  // WidgetsFlutterBinding
  // ProfileUserData.getProfile();
  LapHomeData.getLap();
  Bloc.observer = MyBlocObserver();
  runApp(
    DevicePreview(
        enabled: true,
        tools: const [
          ...DevicePreview.defaultTools,
        ],
        builder: (context) => const MyApp()),
  );
}
