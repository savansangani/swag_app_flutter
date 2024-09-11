import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:swag_app_flutter/app/custom/custom_app_bar.dart';
import 'package:swag_app_flutter/app/custom/custom_grediant_button.dart';
import 'package:swag_app_flutter/app/custom/custom_text_form_field.dart';
import 'package:swag_app_flutter/app/theme/colors.dart';
import 'package:swag_app_flutter/app/utils/text_string.dart';
import 'package:swag_app_flutter/app/views/auth_screen/signup_controller.dart';

import '../../custom/custom_icon.dart';
import '../../services/theme_provider.dart';

class SignUpView extends StatelessWidget {
  SignUpView({super.key});
  final signUpController = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const CustomAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizerUtil.deviceType == DeviceType.mobile
              ? Get.size.height * 0.02
              : Get.size.width * 0.2,
          vertical: SizerUtil.deviceType == DeviceType.mobile
              ? Get.size.height * 0.02
              : Get.size.width * 0.2,
        ),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: SizerUtil.deviceType == DeviceType.mobile
                      ? Alignment.centerLeft
                      : Alignment.center,
                  child: Text(
                    TextString.signUpTitle,
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
                  controller: signUpController.emailController.value,
                ),
                SizedBox(
                  height: Get.height * 0.03,
                ),
                Obx(
                  () => CustomTextFormField(
                    hintText: TextString.passwordHintText,
                    controller: signUpController.passwordController.value,
                    obscureText: signUpController.isVisible.value,
                    suffixIcon: InkWell(
                      onTap: () {
                        signUpController.togglePasswordVisibility();
                      },
                      child: CustomIcon(
                        icon: signUpController.isVisible.value
                            ? 'assets/icons/eyeoff.svg'
                            : 'assets/icons/eyeon.svg',
                        padding: 12,
                        color: !themeProvider.isDark
                            ? Colorz.textSecondary
                            : Colorz.main,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.03,
                ),
                Obx(
                  () => CustomTextFormField(
                    hintText: TextString.confirmPasswordHintText,
                    controller:
                        signUpController.confirmPasswordController.value,
                    obscureText: signUpController.isConfirmVisible.value,
                    suffixIcon: InkWell(
                      onTap: () {
                        signUpController.toggleConfirmPasswordVisibility();
                      },
                      child: CustomIcon(
                        icon: signUpController.isConfirmVisible.value
                            ? 'assets/icons/eyeoff.svg'
                            : 'assets/icons/eyeon.svg',
                        padding: 12,
                        color: !themeProvider.isDark
                            ? Colorz.textSecondary
                            : Colorz.main,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomGrediantButton(
                  text: TextString.signUpTitle,
                  isGradient: true,
                  onPressed: () {
                    signUpController.signUpUser();
                  },
                ),
                SizedBox(
                  height: Get.height * 0.03,
                ),
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Text(
                    TextString.logInTitle,
                    style: Get.textTheme.titleMedium!.copyWith(
                      color: themeProvider.isDark
                          ? Colorz.primaryBackground.withOpacity(0.8)
                          : Colorz.main,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
