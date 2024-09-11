import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:swag_app_flutter/app/custom/custom_app_bar.dart';
import 'package:swag_app_flutter/app/custom/custom_grediant_button.dart';
import 'package:swag_app_flutter/app/custom/custom_icon.dart';
import 'package:swag_app_flutter/app/custom/custom_text_form_field.dart';
import 'package:swag_app_flutter/app/theme/colors.dart';
import 'package:swag_app_flutter/app/utils/text_string.dart';
import 'package:swag_app_flutter/app/views/auth_screen/login_controller.dart';
import 'package:swag_app_flutter/app/views/auth_screen/reset_password_view.dart';
import 'package:swag_app_flutter/app/views/auth_screen/signup_view.dart';

import '../../services/theme_provider.dart';

class LogInView extends GetView<LogInController> {
  LogInView({super.key});
  final loginController = Get.put(LogInController());

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
                    TextString.logInTitle,
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
                  controller: loginController.emailController.value,
                ),
                SizedBox(
                  height: Get.height * 0.03,
                ),
                Obx(
                  () => CustomTextFormField(
                    hintText: TextString.passwordHintText,
                    controller: loginController.passwordController.value,
                    obscureText: loginController.isVisible.value,
                    suffixIcon: InkWell(
                      onTap: () {
                        loginController.togglePasswordVisibility();
                      },
                      child: CustomIcon(
                        icon: loginController.isVisible.value
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
                InkWell(
                  onTap: () {
                    Get.to(() => ResetPasswordView());
                  },
                  child: Text(
                    TextString.fogetPasswordText,
                    style: Get.textTheme.titleMedium!.copyWith(
                      color: Colorz.main,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: SizerUtil.deviceType == DeviceType.mobile
                  ? MainAxisAlignment.end
                  : MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomGrediantButton(
                  onPressed: () {
                    loginController.logInUser();
                  },
                  text: TextString.logInTitle,
                  isGradient: true,
                ),
                SizedBox(
                  height: Get.height * 0.03,
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => SignUpView());
                  },
                  child: Text(
                    TextString.createAccountText,
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
