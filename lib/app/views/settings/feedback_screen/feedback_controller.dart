import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:swag_app_flutter/app/services/api_services.dart';
import 'package:swag_app_flutter/app/theme/colors.dart';
import 'package:swag_app_flutter/app/utils/helper.dart';

class FeedbackController extends GetxController {
  final Rx<File?> _pickedImage = Rx<File?>(null);
  final feedbackController = TextEditingController().obs;
  final RxBool _isLoading = RxBool(false);
  bool get isLoading => _isLoading.value;
  File? get pickedImage => _pickedImage.value;

  void pickImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      _pickedImage.value = File(pickedImage.path);
    }
  }

  void setLoading(bool value) {
    _isLoading.value = value;
  }

  Future<void> submitFeedback() async {
    try {
      if (feedbackController.value.text.isEmpty) {
        Helper.showSnackBar(message: "Please entre feedback.");
        return;
      }
      setLoading(true);

      final response = await ApiService.feedback(
        feedbackText: feedbackController.value.text,
        image: pickedImage,
      );
      if (response.statusCode == 200) {
        setLoading(false);
        Get.back();
        Helper.showSnackBar(message: response.message!, color: Colorz.success);
      } else {
        !isLoading;
        Helper.showSnackBar(message: response.message!);
      }
    } catch (e) {
      setLoading(false);
      Helper.showSnackBar(message: e.toString());
    } finally {
      setLoading(false);
      update();
    }
  }
}
