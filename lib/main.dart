import 'package:flutter/material.dart';
import 'package:regapi_1/helpear/cash-data.dart';
import 'package:regapi_1/myapp.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  sharedpref.init();
  // WidgetsFlutterBinding
  runApp(
    DevicePreview(
        enabled: true,
        tools: const [
          ...DevicePreview.defaultTools,
        ],
        builder: (context) => const MyApp()),
  );
}
