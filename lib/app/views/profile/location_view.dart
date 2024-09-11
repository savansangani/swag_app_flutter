import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:swag_app_flutter/app/custom/custom_app_bar.dart';
import 'package:swag_app_flutter/app/custom/custom_grediant_button.dart';
import 'package:swag_app_flutter/app/custom/custom_text_form_field.dart';
import 'package:swag_app_flutter/app/theme/colors.dart';
import 'package:swag_app_flutter/app/utils/text_string.dart';
import 'package:swag_app_flutter/app/views/profile/location_controller.dart';

class LocationView extends StatelessWidget {
  LocationView({super.key});
  final controller = Get.put(LocationController(gender: Get.arguments));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        backButton: true,
        title: TextString.locationTitle,
      ),
      body: Obx(
        () => controller.isloding.value
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colorz.main,
                ),
              )
            : Padding(
                padding: EdgeInsets.only(
                  right: SizerUtil.deviceType == DeviceType.mobile
                      ? Get.size.height * 0.02
                      : Get.size.width * 0.2,
                  left: SizerUtil.deviceType == DeviceType.mobile
                      ? Get.size.height * 0.02
                      : Get.size.width * 0.2,
                  bottom: SizerUtil.deviceType == DeviceType.mobile
                      ? Get.size.height * 0.04
                      : Get.size.width * 0.3,
                ),
                child: Column(
                  mainAxisAlignment: SizerUtil.deviceType == DeviceType.mobile
                      ? MainAxisAlignment.spaceBetween
                      : MainAxisAlignment.start,
                  children: [
                    CustomTextFormField(
                      hintText: TextString.cityHintText,
                      controller: controller.locationController.value,
                    ),
                    SizerUtil.deviceType == DeviceType.mobile
                        ? const SizedBox.shrink()
                        : SizedBox(
                            height: Get.size.height * 0.03,
                          ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CustomGrediantButton(
                          onPressed: () {
                            controller.onContinuePress();
                          },
                          text: TextString.continueText,
                          isGradient: true,
                        ),
                      ],
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
