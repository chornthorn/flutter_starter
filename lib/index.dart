import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'config/flavors/flavor_config.dart';
import 'getx/controllers/controllers.dart';
import 'routes/app_routes.dart';
import 'utils/constants/constants.dart';
import 'utils/helpers/localization.g.dart';
import 'views/widgets/flavor_banner.dart';
import 'views/widgets/loading.dart';

class AppIndex extends StatelessWidget {
  const AppIndex({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeController.to.getThemeModeFromStore();
    return FlavorBanner(
      child: Listener(
        onPointerDown: (_) {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus &&
              currentFocus.focusedChild != null) {
            currentFocus.focusedChild!.unfocus();
          }
        },
        child: GetBuilder<LanguageController>(
          builder: (languageController) => Loading(
            child: GetMaterialApp(
              debugShowCheckedModeBanner: true,
              initialRoute: "/",
              onGenerateRoute: generateRoute,
              theme: AppThemes.lightTheme,
              darkTheme: AppThemes.darkTheme,
              themeMode: ThemeMode.system,
              translations: Localization(),
              locale: languageController.getLocale, // <- Current locale
            ),
          ),
        ),
      ),
    );
  }
}
