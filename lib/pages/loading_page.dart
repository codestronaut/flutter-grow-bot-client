import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grow_bot_app/data/controller/data_controller.dart';
import 'package:grow_bot_app/pages/home_page.dart';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  DataController _controller = DataController();
  late Map<String, dynamic> statusData;
  Random _random = new Random();

  @override
  void initState() {
    getCurrentStatus();
    super.initState();
  }

  void getCurrentStatus() async {
    var randomTemp = _random.nextInt(100);
    var randomHumidity = _random.nextInt(100);
    var randomGreenLevel = _random.nextInt(10);

    statusData = await _controller.getPlantStatus(
      temperature: randomTemp,
      humidity: randomHumidity,
      greenLevel: randomGreenLevel,
    );

    Get.offAll(
      () => HomePage(
        statusData: statusData,
        temperature: randomTemp,
        humidity: randomHumidity,
        greenLevel: randomGreenLevel,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              color: Colors.cyan,
            ),
          ],
        ),
      ),
    );
  }
}
