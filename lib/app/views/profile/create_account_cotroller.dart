import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:swag_app_flutter/app/services/api_services.dart';
import 'package:swag_app_flutter/app/utils/helper.dart';
import 'package:swag_app_flutter/app/views/profile/year_income_view.dart';

class CreateAccountController extends GetxController {
  RxString selectedGender = 'female'.obs;
  final Rx<File?> _pickedImage = Rx<File?>(null);
  File? get pickedImage => _pickedImage.value;
  RxBool isloding = true.obs;
  final nameController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  String? profilePic;

  @override
  void onInit() {
    super.onInit();
    _init();
  }

  _init() async {
    await getUserPersonal();
  }

  Future<void> getUserPersonal() async {
    isloding;
    final response = await ApiService.getUserPersonal();
    if (response.statusCode == 200) {
      isloding.value = false;
      profilePic = response.body?.avatar ?? '';
      selectedGender.value = response.body?.gender ?? 'female';
      nameController.value.text = response.body?.name ?? '';
      emailController.value.text = response.body?.email ?? '';
      update();
    } else {
      isloding.value = false;
      Helper.showSnackBar(message: response.message!);
    }
  }

  pickImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      _pickedImage.value = File(pickedImage.path);
    }
  }

  void updateSelectedGender(String gender) {
    selectedGender.value = gender;
  }

  void goToYearIncomeView() {
    if (nameController.value.text.isEmpty) {
      Helper.showSnackBar(message: "Please entre fullname.");
      return;
    } else if (emailController.value.text.isEmpty) {
      Helper.showSnackBar(message: "Please entre email.");
      return;
    }
    setUserPersonal();
  }

  Future<void> setUserPersonal() async {
    isloding;
    final response = await ApiService.setUserPersonal(
      name: nameController.value.text,
      email: emailController.value.text,
      gender: selectedGender.value,
      avtar: pickedImage,
    );
    if (response.statusCode == 200) {
      isloding.value = false;
      Get.to(
        () => YearIncomeView(),
        arguments: selectedGender.value,
      );
    } else {
      isloding.value = false;
      Helper.showSnackBar(message: response.message!);
    }
  }
}
