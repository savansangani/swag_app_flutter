import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:swag_app_flutter/app/custom/custom_app_bar.dart';
import 'package:swag_app_flutter/app/custom/custom_grediant_button.dart';
import 'package:swag_app_flutter/app/custom/custom_text_form_field.dart';
import 'package:swag_app_flutter/app/theme/colors.dart';
import 'package:swag_app_flutter/app/utils/text_string.dart';
import 'package:swag_app_flutter/app/views/auth_screen/other_option_controller.dart';

class ResetPasswordView extends GetView<OtherOptionController> {
  ResetPasswordView({super.key});
  @override
  final controller = Get.put(OtherOptionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: EdgeInsets.only(
          right: SizerUtil.deviceType == DeviceType.mobile
              ? Get.size.height * 0.02
              : Get.size.width * 0.2,
          left: SizerUtil.deviceType == DeviceType.mobile
              ? Get.size.height * 0.02
              : Get.size.width * 0.2,
          bottom: SizerUtil.deviceType == DeviceType.mobile
              ? Get.size.height * 0.04
              : Get.size.width * 0.2,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
              alignment: SizerUtil.deviceType == DeviceType.mobile
                  ? Alignment.centerLeft
                  : Alignment.center,
              child: Text(
                TextString.resetPasswordTitle,
                style: Get.textTheme.displayLarge!.copyWith(
                  fontWeight: FontWeight.w700,
                  color: Colorz.main,
                ),
              ),
            ),
            SizedBox(
              height: Get.height * 0.03,
            ),
            CustomTextFormField(
              hintText: TextString.emailHintText,
              controller: controller.resetPasswordController,
            ),
            const Expanded(
              child: SizedBox(),
            ),
            CustomGrediantButton(
              onPressed: () {
                controller.resetPassword(
                  email: controller.resetPasswordController.value.text,
                );
              },
              text: TextString.resetPasswordText,
              isGradient: true,
            ),
          ],
        ),
      ),
    );
  }
}
