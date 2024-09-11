import 'dart:async';
import 'package:get/get.dart';
import 'package:swag_app_flutter/app/views/start_screen/start_view.dart';

import '../../services/shared_preferences.dart';
import '../home/bottom_navigation_bar_view.dart';

class SplashController extends GetxController {


  @override
  void onInit() {
    super.onInit();
    _init();
  }

  _init() {
    Timer(const Duration(seconds: 1), () async {
      if(await  SharedPreferencesService().getToken() != null){
      Get.to(() => BottomNavigationBarView());
      } else {
      Get.off(() => StartView());
      }
    });
  }
}
