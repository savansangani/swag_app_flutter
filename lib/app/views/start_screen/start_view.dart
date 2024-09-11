import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:swag_app_flutter/app/custom/custom_grediant_button.dart';
import 'package:swag_app_flutter/app/theme/colors.dart';
import 'package:swag_app_flutter/app/utils/text_string.dart';
import 'package:swag_app_flutter/app/views/start_screen/start_controller.dart';

import '../../services/theme_provider.dart';

class StartView extends StatelessWidget {
  StartView({super.key});
  final startController = Get.put(StartController());

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizerUtil.deviceType == DeviceType.mobile
              ? 20
              : MediaQuery.of(context).size.width * 0.2,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              // color: Colors.amber,
              child: Center(
                child: Image.asset(
                  SizerUtil.deviceType == DeviceType.mobile
                      ? "assets/images/img.png"
                      : "assets/images/ipadimg.png",
                  // height: Get.height * 0.6,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              transform: Matrix4.translationValues(0, Get.height * -0.03, 0),
              child: Image.asset(
                themeProvider.isDark
                    ? "assets/logo/darklogo.png"
                    : "assets/logo/swaglogo.png",
              ),
            ),
            Text(
              TextString.startText1,
              style: Get.textTheme.titleLarge!.copyWith(
                color: themeProvider.isDark
                    ? Colorz.textVioletGrey
                    : Colorz.textSecondary,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: Get.height * 0.04,
            ),
            CustomGrediantButton(
              onPressed: startController.goToNextScreen,
              text: TextString.startButtonText,
              isGradient: true,
            ),
            SizedBox(
              height: Get.height * 0.01,
            )
          ],
        ),
      ),
    );
  }
}
