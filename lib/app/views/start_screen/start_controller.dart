import 'package:get/get.dart';
import 'package:swag_app_flutter/app/views/onboarding_screen/onboarding_view.dart';

class StartController extends GetxController {
  goToNextScreen() {
    Get.to(() => OnBoardingView());
  }
}
