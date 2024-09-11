import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swag_app_flutter/app/model/signup_model.dart';
import 'package:swag_app_flutter/app/services/api_services.dart';
import 'package:swag_app_flutter/app/utils/helper.dart';

class SignUpController extends GetxController {
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final confirmPasswordController = TextEditingController().obs;
  final isVisible = true.obs;
  final isConfirmVisible = true.obs;

  void togglePasswordVisibility() {
    isVisible.value = !isVisible.value;
    update();
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmVisible.value = !isConfirmVisible.value;
    update();
  }

  Future<void> signUpUser() async {
    if (emailController.value.text.isEmpty) {
      Helper.showSnackBar(message: "Please entre email first.");
      return;
    } else if (passwordController.value.text.isEmpty) {
      Helper.showSnackBar(message: "Please entre password.");
      return;
    } else if (confirmPasswordController.value.text.isEmpty) {
      Helper.showSnackBar(message: "Please entre confimpassword.");
      return;
    }

    SignUpModel signup = await ApiService.register(
      email: emailController.value.text,
      password: passwordController.value.text,
      confirmPassword: confirmPasswordController.value.text,
    );
    if (signup.statusCode == 200) {
      Get.back();
    } else {
      Helper.showSnackBar(message: signup.message!);
    }
  }
}
