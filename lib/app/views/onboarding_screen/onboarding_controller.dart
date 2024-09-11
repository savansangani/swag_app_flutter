import 'package:get/get.dart';
import 'package:swag_app_flutter/app/views/auth_screen/other_option_view.dart';

class OnBoardingController extends GetxController {
  void goToOtherOpthionView() {
    Get.to(
      transition: Transition.fadeIn,
      () => OtherOtionView(),
    );
  }
}
