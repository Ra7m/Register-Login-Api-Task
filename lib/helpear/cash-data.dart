// ignore_for_file: file_names, camel_case_types, avoid_print, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class sharedpref {
  static SharedPreferences? prefs;
  static init() async {
    prefs = await SharedPreferences.getInstance();
  }
}

class TestCash extends StatefulWidget {
  const TestCash({super.key});

  @override
  State<TestCash> createState() => _TestCashState();
}

class _TestCashState extends State<TestCash> {
  var x = 0;
  @override
  Widget build(BuildContext context) {
    sharedpref.prefs!.setDouble("keyx", x.toDouble());
    var z = sharedpref.prefs!.getDouble("keyx");
    print(z); // Use the variable 'z'
    return Scaffold(
      appBar: AppBar(
        title: Text(x.toString()),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
