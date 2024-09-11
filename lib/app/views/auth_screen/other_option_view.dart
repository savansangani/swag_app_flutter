import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:swag_app_flutter/app/custom/custom_app_bar.dart';
import 'package:swag_app_flutter/app/custom/custom_grediant_button.dart';
import 'package:swag_app_flutter/app/theme/colors.dart';
import 'package:swag_app_flutter/app/utils/text_string.dart';
import 'package:swag_app_flutter/app/views/auth_screen/other_option_controller.dart';

import '../../services/theme_provider.dart';

class OtherOtionView extends GetView<OtherOptionController> {
  OtherOtionView({super.key});
  final otherOptionController = Get.put(OtherOptionController());

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
        appBar: const CustomAppBar(),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizerUtil.deviceType == DeviceType.mobile
                ? Get.size.height * 0.02
                : Get.size.width * 0.2,
            vertical: SizerUtil.deviceType == DeviceType.mobile
                ? Get.size.height * 0.02
                : Get.size.width * 0.1,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                TextString.otherOptionTitle,
                style: Get.textTheme.displayLarge!.copyWith(
                  fontWeight: FontWeight.w700,
                  color: Colorz.main,
                ),
              ),
              SizedBox(
                height: Get.height * 0.03,
              ),
              InkWell(
                onTap: () {
                  // Get.to(() => BottomNavigationBarView());
                  otherOptionController.initiateSignInWithGoogle();
                },
                child: Container(
                  height: 65,
                  decoration: BoxDecoration(
                    color: Colorz.primaryBackground,
                    boxShadow: [
                      BoxShadow(
                        color: !themeProvider.isDark
                            ? Colorz.textBlack.withOpacity(0.15)
                            : Colorz.textBlack.withOpacity(0.15),
                        offset: const Offset(0.0, 7), //(x,y)
                        blurRadius: 14,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                      strokeAlign: BorderSide.strokeAlignInside,
                      width: 1,
                      color: Colorz.border,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/logo/google.svg",
                        height: 30,
                        width: 30,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        TextString.googleButtonText,
                        style: Get.textTheme.titleMedium!.copyWith(
                          color: Colorz.textPrimary,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: Get.height * 0.03,
              ),
              CustomGrediantButton(
                onPressed: otherOptionController.goToLogInView,
                text: TextString.logInWithEmail,
                textColor: Colorz.main,
                isGradient: true,
                opecity: 0.12,
              ),
              SizedBox(
                height: Get.height * 0.03,
              ),
              CustomGrediantButton(
                onPressed: otherOptionController.goToSignUpView,
                text: TextString.signUpWithEmail,
                textColor: Colorz.main,
                isGradient: true,
                opecity: 0.12,
              ),
            ],
          ),
        ));
  }
}
