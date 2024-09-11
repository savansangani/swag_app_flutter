import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:swag_app_flutter/app/custom/custom_app_bar.dart';
import 'package:swag_app_flutter/app/custom/custom_grediant_button.dart';
import 'package:swag_app_flutter/app/theme/colors.dart';
import 'package:swag_app_flutter/app/utils/text_string.dart';
import 'package:swag_app_flutter/app/views/auth_screen/login_view.dart';

import '../../services/theme_provider.dart';

class ResetPasswordSucessView extends StatelessWidget {
  const ResetPasswordSucessView({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
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
            Text(
              TextString.resetPasswordSubTitle,
              style: Get.textTheme.titleMedium!.copyWith(
                color: !themeProvider.isDark
                    ? Colorz.textVioletGrey
                    : Colorz.textSecondary,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Expanded(
              child: SizedBox(),
            ),
            CustomGrediantButton(
              onPressed: () {
                Get.off(() => LogInView());
              },
              text: TextString.backToLoginText,
              isGradient: true,
            ),
          ],
        ),
      ),
    );
  }
}
