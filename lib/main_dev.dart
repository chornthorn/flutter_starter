import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'config/flavors/flavor_config.dart';
import 'getx/controllers/controllers.dart';
import 'index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  Get.put<ThemeController>(ThemeController());
  Get.put<LanguageController>(LanguageController());
  FlavorConfig(
    environment: FlavorEnvironment.DEV,
    name: "Dev",
    color: Colors.red,
    location: BannerLocation.topStart,
    variables: {
      "API_ENDPOINT": "http://localhost:8000/api",
    },
  );
  return runApp(AppIndex());
}
