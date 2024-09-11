import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:swag_app_flutter/app/views/splash_screen/splash_controller.dart';

import '../../services/theme_provider.dart';

class SplashView extends StatelessWidget {
  SplashView({super.key});
  final splashController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              SizerUtil.deviceType == DeviceType.mobile
                  ? "assets/logo/splashlogo.png"
                  : "assets/logo/ipadsplashlogo.png",
            ),
          ),
          SizedBox(
            height: Get.height * 0.02,
          ),
          Center(
            child: Image.asset(
              !themeProvider.isDark
                  ? 'assets/logo/whitelogo.png'
                  : 'assets/logo/swaglogo.png',
            ),
          ),
        ],
      ),
    );
  }
}
