import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:swag_app_flutter/app/theme/colors.dart';
import 'package:swag_app_flutter/app/utils/text_string.dart';
import 'package:swag_app_flutter/app/views/onboarding_screen/onboarding_controller.dart';

class OnBoardingView extends StatelessWidget {
  OnBoardingView({super.key});

  final onBoardingController = Get.put(OnBoardingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            SizerUtil.deviceType == DeviceType.mobile
                ? "assets/images/onboardingimg.png"
                : "assets/images/ipadonboardingimg.png",
            fit: BoxFit.cover,
            height: Get.height,
            width: Get.width,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: SizerUtil.deviceType == DeviceType.mobile
                  ? Get.size.height * 0.02
                  : Get.size.width * 0.2,
              right: SizerUtil.deviceType == DeviceType.mobile
                  ? Get.size.height * 0.02
                  : Get.size.width * 0.2,
              top: SizerUtil.deviceType == DeviceType.mobile
                  ? Get.height * 0.09
                  : Get.height * 0.09,
              bottom: SizerUtil.deviceType == DeviceType.mobile
                  ? Get.size.height * 0.02
                  : Get.size.height * 0.03,
            ),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    "assets/logo/whitelogo.png",
                  ),
                ),
                const Expanded(child: SizedBox()),
                Container(
                  height: 65,
                  decoration: BoxDecoration(
                    color: Colorz.appleButton,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/logo/apple.svg",
                        height: 30,
                        width: 30,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        TextString.appleButtonText,
                        style: Get.textTheme.titleMedium!.copyWith(
                          color: Colorz.textWhite,
                          fontSize: 20,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.03,
                ),
                InkWell(
                  onTap: onBoardingController.goToOtherOpthionView,
                  child: Text(
                    TextString.otherOptions,
                    style: Get.textTheme.titleMedium!.copyWith(
                      color: Colorz.textWhite,
                      fontSize: 20,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
