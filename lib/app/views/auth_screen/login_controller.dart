import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swag_app_flutter/app/services/api_services.dart';
import 'package:swag_app_flutter/app/services/shared_preferences.dart';
import 'package:swag_app_flutter/app/utils/helper.dart';
import 'package:swag_app_flutter/app/views/subscription_screen/subscription_view.dart';

class LogInController extends GetxController {
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final isVisible = true.obs;

  void togglePasswordVisibility() {
    isVisible.value = !isVisible.value;
    update();
  }

  Future<void> logInUser() async {
    if (emailController.value.text.isEmpty) {
      Helper.showSnackBar(message: "Please entre email first.");
      return;
    } else if (passwordController.value.text.isEmpty) {
      Helper.showSnackBar(message: "Please entre password.");
      return;
    }
    Helper.showLoading();
    final response = await ApiService.logIn(
      email: emailController.value.text,
      password: passwordController.value.text,
    );
    if (response.statusCode == 200) {
      Helper.hideLoading();
      var token = response.body?.tokens!.accessToken;
      var refreshToken = response.body?.tokens!.refreshToken;
      var email = response.body?.user!.email!;
      SharedPreferencesService().setToken(token ?? '');
      SharedPreferencesService().setRefreshToken(refreshToken ?? '');
      SharedPreferencesService().setEmail(email ?? '');
      Get.to(() => const SubScriptionView());
      // Get.to(() => BottomNavigationBarView());
    } else {
      Helper.hideLoading();
      Helper.showSnackBar(message: response.message!);
    }
  }
}
