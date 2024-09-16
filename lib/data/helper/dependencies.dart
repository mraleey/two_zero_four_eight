// data/helper/dependencies.dart
import 'dart:async';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api/api_client.dart';
import '../app_urls.dart';

Future<void> init() async {
  // SharedPreferences
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  Get.put(sharedPreferences);

  // ApiClient
  Get.lazyPut(() => ApiClient(appBaseUrl: AppUrls.baseUrl));
}
