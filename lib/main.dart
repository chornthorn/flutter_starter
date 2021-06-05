import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'config/flavors/flavor_config.dart';
import 'getx/controllers/controllers.dart';
import 'index.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  Get.put<ThemeController>(ThemeController());
  Get.put<LanguageController>(LanguageController());

  FlavorConfig(
    environment: FlavorEnvironment.PROD,
    name: "Production",
    variables: {
      "API_ENDPOINT": "www.bongthorn.tech/api",
    },
  );
  return runApp(AppIndex());
}
