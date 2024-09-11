import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swag_app_flutter/app/services/api_services.dart';
import 'package:swag_app_flutter/app/utils/helper.dart';
import 'package:swag_app_flutter/app/utils/text_string.dart';
import 'package:swag_app_flutter/app/views/home/bottom_navigation_bar_view.dart';
import 'package:swag_app_flutter/app/views/style_screen/male/male_additional_view.dart';
import 'package:swag_app_flutter/app/views/style_screen/male/male_arms_view.dart';
import 'package:swag_app_flutter/app/views/style_screen/male/male_lower_body_view.dart';

class MaleController extends GetxController {
  final maleUpperText1Controller = TextEditingController().obs;
  final maleUpperText2Controller = TextEditingController().obs;
  final maleUpperText3Controller = TextEditingController().obs;
  final maleUpperText4Controller = TextEditingController().obs;

  final maleArmsText1Controller = TextEditingController().obs;
  final maleArmsText2Controller = TextEditingController().obs;
  final maleArmsText3Controller = TextEditingController().obs;

  final maleLowerText1Controller = TextEditingController().obs;
  final maleLowerText2Controller = TextEditingController().obs;
  final maleLowerText3Controller = TextEditingController().obs;

  final maleAdditionalText1Controller = TextEditingController().obs;
  final maleAdditionalText2Controller = TextEditingController().obs;
  final maleAdditionalText3Controller = TextEditingController().obs;
  final maleAdditionalText4Controller = TextEditingController().obs;
  RxBool isloding = true.obs;

  @override
  void onInit() {
    super.onInit();
    _init();
  }

  _init() async {
    await getUpperBodyMeasurement();
  }

  void goToMaleArmsView() {
    if (maleUpperText1Controller.value.text.isEmpty) {
      Helper.showSnackBar(
          message: "Please entre ${TextString.maleUpperHintText1}.");
      return;
    } else if (maleUpperText2Controller.value.text.isEmpty) {
      Helper.showSnackBar(
          message: "Please entre ${TextString.maleUpperHintText2}.");
      return;
    } else if (maleUpperText3Controller.value.text.isEmpty) {
      Helper.showSnackBar(
          message: "Please entre ${TextString.maleUpperHintText3}.");
      return;
    } else if (maleUpperText4Controller.value.text.isEmpty) {
      Helper.showSnackBar(
          message: "Please entre ${TextString.maleUpperHintText4}.");
      return;
    }
    print(maleUpperText4Controller.value.text);
    setUpperBodyMeasurement();
  }

  void goToMaleLowerBodyView() {
    if (maleArmsText1Controller.value.text.isEmpty) {
      Helper.showSnackBar(
          message: "Please entre ${TextString.maleArmsHintText1}.");
      return;
    } else if (maleArmsText2Controller.value.text.isEmpty) {
      Helper.showSnackBar(
          message: "Please entre ${TextString.maleArmsHintText2}.");
      return;
    } else if (maleArmsText3Controller.value.text.isEmpty) {
      Helper.showSnackBar(
          message: "Please entre ${TextString.maleArmsHintText3}.");
      return;
    }
    Get.to(() => MaleLowerBodyView());
  }

  void goToMaleAdditionalView() {
    if (maleLowerText1Controller.value.text.isEmpty) {
      Helper.showSnackBar(
          message: "Please entre ${TextString.maleLowerHintText1}.");
      return;
    } else if (maleLowerText2Controller.value.text.isEmpty) {
      Helper.showSnackBar(
          message: "Please entre ${TextString.maleLowerHintText2}.");
      return;
    } else if (maleLowerText3Controller.value.text.isEmpty) {
      Helper.showSnackBar(
          message: "Please entre ${TextString.maleLowerHintText3}.");
      return;
    }
    Get.to(() => MaleAdditionalView());
  }

  void goToMaleInstructionView() {
    if (maleAdditionalText1Controller.value.text.isEmpty) {
      Helper.showSnackBar(
          message: "Please entre ${TextString.maleAdditionalHintText1}.");
      return;
    } else if (maleAdditionalText2Controller.value.text.isEmpty) {
      Helper.showSnackBar(
          message: "Please entre ${TextString.maleAdditionalHintText2}.");
      return;
    } else if (maleAdditionalText3Controller.value.text.isEmpty) {
      Helper.showSnackBar(
          message: "Please entre ${TextString.maleAdditionalHintText3}.");
      return;
    } else if (maleAdditionalText4Controller.value.text.isEmpty) {
      Helper.showSnackBar(
          message: "Please entre ${TextString.maleAdditionalHintText4}.");
      return;
    }
    // Get.to(() => const MaleInstructionView());
    Get.to(() => BottomNavigationBarView());
  }

  Future<void> getUpperBodyMeasurement() async {
    isloding;
    final response = await ApiService.getBodyMeasurement();
    if (response.statusCode == 200) {
      isloding.value = false;
      print(response.body?.bodyMeasurement?.waistCircumference);
      maleUpperText1Controller.value.text =
          response.body?.bodyMeasurement?.neckCircumference.toString() ?? '';
      maleUpperText2Controller.value.text =
          response.body?.bodyMeasurement?.shoulderWidth.toString() ?? '';
      maleUpperText3Controller.value.text =
          response.body?.bodyMeasurement?.chestCircumference.toString() ?? '';
      maleUpperText4Controller.value.text =
          response.body?.bodyMeasurement?.waistCircumference.toString() ?? '';

      maleArmsText1Controller.value.text =
          response.body?.bodyMeasurement?.sleeveLength.toString() ?? '';
      maleArmsText2Controller.value.text =
          response.body?.bodyMeasurement?.bicepCircumference.toString() ?? '';
      maleArmsText3Controller.value.text =
          response.body?.bodyMeasurement?.wristCircumference.toString() ?? '';

      maleLowerText1Controller.value.text =
          response.body?.bodyMeasurement?.hipCircumference.toString() ?? '';
      maleLowerText2Controller.value.text =
          response.body?.bodyMeasurement?.trouserWaist.toString() ?? '';
      maleLowerText3Controller.value.text =
          response.body?.bodyMeasurement?.inseam.toString() ?? '';
      maleAdditionalText1Controller.value.text =
          response.body?.bodyMeasurement?.trouserOutseam.toString() ?? '';
      maleAdditionalText2Controller.value.text =
          response.body?.bodyMeasurement?.thighCircumference.toString() ?? '';
      maleAdditionalText3Controller.value.text =
          response.body?.bodyMeasurement?.kneeCircumference.toString() ?? '';
      maleAdditionalText4Controller.value.text =
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
      neckCircumference: double.parse(maleUpperText1Controller.value.text),
      shoulderWidth: double.parse(maleUpperText2Controller.value.text),
      chestCircumference: double.parse(maleUpperText3Controller.value.text),
      waistCircumference: double.parse(maleUpperText4Controller.value.text),
    );
    if (response.statusCode == 200) {
      isloding.value = false;
      Get.to(() => MaleArmsView());
      update();
    } else {
      isloding.value = false;
      Helper.showSnackBar(message: response.message!);
    }
  }
}
