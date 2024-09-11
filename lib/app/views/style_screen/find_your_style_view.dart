import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:swag_app_flutter/app/custom/custom_grediant_button.dart';
import 'package:swag_app_flutter/app/theme/colors.dart';
import 'package:swag_app_flutter/app/utils/text_string.dart';
import 'package:swag_app_flutter/app/views/style_screen/female/upper_body_view.dart';
import 'package:swag_app_flutter/app/views/style_screen/find_your_style_controller.dart';
import 'package:swag_app_flutter/app/views/style_screen/male/male_upper_body_view.dart';

class FindYourStyleView extends StatelessWidget {
  FindYourStyleView({super.key});
  final controller = Get.put(FindYourStyleController());

  @override
  Widget build(BuildContext context) {
    final gender = Get.arguments;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            SizerUtil.deviceType == DeviceType.mobile
                ? "assets/images/findstyle1.png"
                : "assets/images/ipadfindstyle1.png",
            fit: BoxFit.cover,
            height: Get.height,
            width: Get.width,
          ),
          Padding(
            padding: EdgeInsets.only(
                top: kToolbarHeight,
                right: SizerUtil.deviceType == DeviceType.mobile
                    ? Get.size.height * 0.02
                    : Get.size.width * 0.2,
                left: SizerUtil.deviceType == DeviceType.mobile
                    ? Get.size.height * 0.02
                    : Get.size.width * 0.2,
                bottom: kToolbarHeight),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 15.0,
                            sigmaY: 15.0,
                          ),
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: Colorz.textPrimary.withOpacity(0.2),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: SvgPicture.asset(
                                "assets/icons/whiteback.svg",
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  // mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      TextString.findstyleTitle,
                      style: Get.textTheme.displayMedium!.copyWith(
                        fontSize: 48,
                        color: Colorz.textWhite,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.03,
                    ),
                    Text(
                      TextString.findstyleSubTitle,
                      style: Get.textTheme.titleMedium!.copyWith(
                        color: Colorz.textWhite,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.03,
                    ),
                    const CustomGrediantButton(
                      text: TextString.scanBodyButtonText,
                      isGradient: true,
                    ),
                    SizedBox(
                      height: Get.height * 0.03,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: InkWell(
                        onTap: () {
                          if (gender == 'female') {
                            Get.to(() => UpperBodyView());
                          } else if (gender == 'male') {
                            Get.to(() => MaleUpperBodyView());
                          }
                        },
                        child: Text(
                          TextString.scanManualButtonText,
                          style: Get.textTheme.titleLarge!.copyWith(
                            fontSize: 20,
                            color: Colorz.textWhite,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
