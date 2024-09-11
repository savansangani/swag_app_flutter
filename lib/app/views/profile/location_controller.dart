import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swag_app_flutter/app/services/api_services.dart';
import 'package:swag_app_flutter/app/utils/helper.dart';
import 'package:swag_app_flutter/app/views/style_screen/find_your_style_view.dart';

class LocationController extends GetxController {
  String? gender;
  LocationController({required this.gender});
  RxBool isloding = true.obs;
  final locationController = TextEditingController().obs;

  @override
  void onInit() {
    super.onInit();
    _init();
  }

  _init() async {
    await getUserLocation();
  }

  void onContinuePress() async {
    if (locationController.value.text.isEmpty) {
      Helper.showSnackBar(message: "Please entre location.");
      return;
    }
    setUserLocation(location: locationController.value.text);
  }

  Future<void> getUserLocation() async {
    isloding;
    final response = await ApiService.getUserLocation();
    if (response.statusCode == 200) {
      isloding.value = false;
      locationController.value.text = response.body?.location ?? '';
      update();
    } else {
      isloding.value = false;
      Helper.showSnackBar(message: response.message!);
    }
  }

  Future<void> setUserLocation({required String location}) async {
    isloding;
    final response = await ApiService.setUserLocation(location: location);
    if (response.statusCode == 200) {
      isloding.value = false;

      Get.to(() => FindYourStyleView(), arguments: gender);
      update();
    } else {
      isloding.value = false;
      Helper.showSnackBar(message: response.message!);
    }
  }
}
