import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:grow_bot_app/pages/home_page.dart';
import 'package:grow_bot_app/pages/loading_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
      ),
    );
    return GetMaterialApp(
      title: 'Grow Bot App Client',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        accentColor: Color(0xFF69f0ae),
      ),
      home: LoadingPage(),
    );
  }
}
