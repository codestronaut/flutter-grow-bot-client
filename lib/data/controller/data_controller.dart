import 'dart:async';

import 'package:grow_bot_app/data/helper/network_helper.dart';
import 'package:grow_bot_app/utils/utils.dart';

class DataController {
  Future<dynamic> getPlantStatus({
    required int temperature,
    required int humidity,
    required int greenLevel,
  }) async {
    try {
      NetworkHelper networkHelper = NetworkHelper(
        url: Utils.baseUrl,
        body: <String, dynamic>{
          'temperature': temperature,
          'humidity': humidity,
          'greenLevel': greenLevel,
        },
      );

      var plantStatusData = await networkHelper.post();
      print('data updated: $plantStatusData');
      return plantStatusData;
    } on TimeoutException catch (_) {
      // Implement 404 page later
      throw ("No respond after 20 seconds");
    } catch (e) {
      // Implement 404 page later
      throw ("Failed to fetch API");
    }
  }
}
