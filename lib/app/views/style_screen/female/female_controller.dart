import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swag_app_flutter/app/services/api_services.dart';
import 'package:swag_app_flutter/app/utils/helper.dart';
import 'package:swag_app_flutter/app/utils/text_string.dart';
import 'package:swag_app_flutter/app/views/home/bottom_navigation_bar_view.dart';
import 'package:swag_app_flutter/app/views/style_screen/female/additional_view.dart';
import 'package:swag_app_flutter/app/views/style_screen/female/arms_view.dart';
import 'package:swag_app_flutter/app/views/style_screen/female/lower_body_view.dart';

class FemaleController extends GetxController {
  final upperText1Controller = TextEditingController().obs;
  final upperText2Controller = TextEditingController().obs;
  final upperText3Controller = TextEditingController().obs;
  final upperText4Controller = TextEditingController().obs;

  final armText1Controller = TextEditingController().obs;
  final armText2Controller = TextEditingController().obs;
  final armText3Controller = TextEditingController().obs;

  final lowerText1Controller = TextEditingController().obs;
  final lowerText2Controller = TextEditingController().obs;
  final lowerText3Controller = TextEditingController().obs;
  final lowerText4Controller = TextEditingController().obs;

  final additionalText1Controller = TextEditingController().obs;
  final additionalText2Controller = TextEditingController().obs;
  final additionalText3Controller = TextEditingController().obs;
  final additionalText4Controller = TextEditingController().obs;
  RxBool isloding = true.obs;

  void goToArmsView() {
    if (upperText1Controller.value.text.isEmpty) {
      Helper.showSnackBar(
          message: "Please entre ${TextString.upperHintText1}.");
      return;
    } else if (upperText2Controller.value.text.isEmpty) {
      Helper.showSnackBar(
          message: "Please entre ${TextString.upperHintText2}.");
      return;
    } else if (upperText3Controller.value.text.isEmpty) {
      Helper.showSnackBar(
          message: "Please entre ${TextString.upperHintText3}.");
      return;
    } else if (upperText4Controller.value.text.isEmpty) {
      Helper.showSnackBar(
          message: "Please entre ${TextString.upperHintText4}.");
      return;
    }
    Get.to(() => ArmsView());
  }

  void goToLowerBodyView() {
    if (armText1Controller.value.text.isEmpty) {
      Helper.showSnackBar(message: "Please entre ${TextString.armsHintText1}.");
      return;
    } else if (armText2Controller.value.text.isEmpty) {
      Helper.showSnackBar(message: "Please entre ${TextString.armsHintText2}.");
      return;
    } else if (armText3Controller.value.text.isEmpty) {
      Helper.showSnackBar(message: "Please entre ${TextString.armsHintText3}.");
      return;
    }
    Get.to(() => LowerBodyView());
  }

  void goToAdditionalView() {
    if (lowerText1Controller.value.text.isEmpty) {
      Helper.showSnackBar(
          message: "Please entre ${TextString.lowerHintText1}.");
      return;
    } else if (lowerText2Controller.value.text.isEmpty) {
      Helper.showSnackBar(
          message: "Please entre ${TextString.lowerHintText2}.");
      return;
    } else if (lowerText3Controller.value.text.isEmpty) {
      Helper.showSnackBar(
          message: "Please entre ${TextString.lowerHintText3}.");
      return;
    } else if (lowerText4Controller.value.text.isEmpty) {
      Helper.showSnackBar(
          message: "Please entre ${TextString.lowerHintText4}.");
      return;
    }
    Get.to(() => AdditionalView());
  }

  void goToInstructionView() {
    if (additionalText1Controller.value.text.isEmpty) {
      Helper.showSnackBar(
          message: "Please entre ${TextString.additionalHintText1}.");
      return;
    } else if (additionalText2Controller.value.text.isEmpty) {
      Helper.showSnackBar(
          message: "Please entre ${TextString.additionalHintText2}.");
      return;
    } else if (additionalText3Controller.value.text.isEmpty) {
      Helper.showSnackBar(
          message: "Please entre ${TextString.additionalHintText3}.");
      return;
    } else if (additionalText4Controller.value.text.isEmpty) {
      Helper.showSnackBar(
          message: "Please entre ${TextString.additionalHintText4}.");
      return;
    }
    // Get.to(() => const InstructionView());
    Get.to(() => BottomNavigationBarView());
  }

  Future<void> getUpperBodyMeasurement() async {
    isloding;
    final response = await ApiService.getBodyMeasurement();
    if (response.statusCode == 200) {
      isloding.value = false;
      upperText1Controller.value.text =
          response.body?.bodyMeasurement?.bustCircumference.toString() ?? '';
      upperText2Controller.value.text =
          response.body?.bodyMeasurement?.waistCircumference.toString() ?? '';
      upperText3Controller.value.text =
          response.body?.bodyMeasurement?.hipCircumference.toString() ?? '';
      upperText4Controller.value.text =
          response.body?.bodyMeasurement?.shoulderWidth.toString() ?? '';

      armText1Controller.value.text =
          response.body?.bodyMeasurement?.sleeveLength.toString() ?? '';
      armText2Controller.value.text =
          response.body?.bodyMeasurement?.armCircumference.toString() ?? '';
      armText3Controller.value.text =
          response.body?.bodyMeasurement?.wristCircumference.toString() ?? '';

      lowerText1Controller.value.text =
          response.body?.bodyMeasurement?.inseam.toString() ?? '';
      lowerText2Controller.value.text =
          response.body?.bodyMeasurement?.outseam.toString() ?? '';
      lowerText3Controller.value.text =
          response.body?.bodyMeasurement?.thighCircumference.toString() ?? '';
      lowerText4Controller.value.text =
          response.body?.bodyMeasurement?.dressLength.toString() ?? '';

      additionalText1Controller.value.text =
          response.body?.bodyMeasurement?.frontWaistLength.toString() ?? '';
      additionalText2Controller.value.text =
          response.body?.bodyMeasurement?.backWaistLength.toString() ?? '';
      additionalText3Controller.value.text =
          response.body?.bodyMeasurement?.kneeCircumference.toString() ?? '';
      additionalText4Controller.value.text =
          response.body?.bodyMeasurement?.ankleCircumference.toString() ?? '';

      update();
    } else {
      isloding.value = false;
      Helper.showSnackBar(message: response.message!);
    }
  }

  Future<void> setUpperBodyMeasurement() async {
    isloding;
    final response = await ApiService.setBodyMeasurement(
        neckCircumference: double.parse(upperText1Controller.value.text),
        shoulderWidth: double.parse(upperText2Controller.value.text),
        chestCircumference: double.parse(upperText3Controller.value.text),
        waistCircumference: double.parse(upperText4Controller.value.text),
        );
    if (response.statusCode == 200) {
      isloding.value = false;
      Get.to(() => ArmsView());
      update();
    } else {
      isloding.value = false;
      Helper.showSnackBar(message: response.message!);
    }
  }
}
