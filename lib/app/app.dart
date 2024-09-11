import 'package:flutter/material.dart';

import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:swag_app_flutter/app/services/theme_provider.dart';
import 'package:swag_app_flutter/app/theme/theme.dart';
import 'package:swag_app_flutter/app/views/splash_screen/splash_view.dart';

class SwagApp extends StatelessWidget {
  const SwagApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => ThemeProvider()..init(),
      child: Consumer<ThemeProvider>(
          builder: (context, ThemeProvider notifier, child) {
          return Sizer(
            builder: (context, orientation, deviceType) => GetMaterialApp(
              debugShowCheckedModeBanner: false,
              theme: buildLightThemeData(context),
              darkTheme: buildDarkThemeData(context),
              themeMode: notifier.isDark ? ThemeMode.dark : ThemeMode.light,
              home: SplashView(),
            ),
          );
        }
      ),
    );
  }
}
