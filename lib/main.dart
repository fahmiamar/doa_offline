// ignore_for_file: deprecated_member_use, non_constant_identifier_names

// ignore: avoid_web_libraries_in_flutter

import 'package:app_doa/tema.dart';

import 'package:app_doa/pages/beranda_page.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aplikasi Doa Muslim',
      theme: ThemeData(
        fontFamily: 'NeoSans',
        primaryColor: bg1,
      ),
      home: BerandaPage(),
    );
  }
}
