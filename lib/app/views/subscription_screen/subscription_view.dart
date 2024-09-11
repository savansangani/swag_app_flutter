import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:swag_app_flutter/app/custom/custom_grediant_button.dart';
import 'package:swag_app_flutter/app/theme/colors.dart';
import 'package:swag_app_flutter/app/utils/text_string.dart';
import 'package:swag_app_flutter/app/views/profile/select_role_view.dart';

class SubScriptionView extends StatelessWidget {
  const SubScriptionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/subscription1.png",
            fit: BoxFit.cover,
            height: Get.height,
            width: Get.width,
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                color: Colorz.textPrimary.withOpacity(0.2),
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: SvgPicture.asset(
                                  "assets/icons/close.svg",
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: SizerUtil.deviceType == DeviceType.mobile
                          ? Alignment.centerLeft
                          : Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Text(
                          TextString.subscriptionTitle,
                          style: Get.textTheme.displayLarge!.copyWith(
                            fontWeight: FontWeight.w700,
                            color: Colorz.textWhite,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                FittedBox(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 50),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset("assets/icons/check.svg"),
                                SizedBox(
                                  width: Get.height * 0.01,
                                ),
                                Text(
                                  TextString.subTitle1,
                                  overflow: TextOverflow.clip,
                                  style: Get.textTheme.titleLarge!.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: Colorz.textWhite,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: Get.height * 0.03,
                            ),
                            Row(
                              children: [
                                SvgPicture.asset("assets/icons/check.svg"),
                                SizedBox(
                                  width: Get.height * 0.01,
                                ),
                                Text(
                                  TextString.subTitle2,
                                  style: Get.textTheme.titleLarge!.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: Colorz.textWhite,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    FittedBox(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30),
                        child: Row(
                          children: [
                            Container(
                              height: Get.height * 0.220,
                              width: 170,
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              decoration: BoxDecoration(
                                color:
                                    Colorz.primaryBackground.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(24),
                                border: Border.all(
                                    width: 2, color: Colorz.primaryBackground),
                              ),
                              child: FittedBox(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Monthly",
                                      style: Get.textTheme.titleSmall!.copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: Colorz.textWhite,
                                      ),
                                    ),
                                    Text(
                                      "\$4.99",
                                      style:
                                          Get.textTheme.headlineSmall!.copyWith(
                                        fontWeight: FontWeight.w700,
                                        color: Colorz.textWhite,
                                      ),
                                    ),
                                    SizedBox(
                                      height: Get.height * 0.01,
                                    ),
                                    Text(
                                      "Free 7 days trial",
                                      style: Get.textTheme.titleSmall!.copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: Colorz.textWhite,
                                      ),
                                    ),
                                    SizedBox(
                                      height: Get.height * 0.02,
                                    ),
                                    Text(
                                      "",
                                      style: Get.textTheme.titleSmall!.copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: Colorz.textWhite,
                                      ),
                                    ),
                                    SizedBox(
                                      height: Get.height * 0.02,
                                    ),
                                    Text(
                                      "Billed annually",
                                      style: Get.textTheme.titleSmall!.copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: Colorz.textWhite,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: Get.height * 0.02,
                            ),
                            Container(
                              height: Get.height * 0.220,
                              width: 170,
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              decoration: BoxDecoration(
                                color: Colorz.textSecondary,
                                borderRadius: BorderRadius.circular(24),
                              ),
                              child: FittedBox(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Yearly",
                                      style: Get.textTheme.titleSmall!.copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: Colorz.textWhite,
                                      ),
                                    ),
                                    Text(
                                      "\$54.99",
                                      style:
                                          Get.textTheme.headlineSmall!.copyWith(
                                        fontWeight: FontWeight.w700,
                                        color: Colorz.textWhite,
                                      ),
                                    ),
                                    SizedBox(
                                      height: Get.height * 0.01,
                                    ),
                                    Text(
                                      "Free 7 days trial",
                                      style: Get.textTheme.titleSmall!.copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: Colorz.textWhite,
                                      ),
                                    ),
                                    SizedBox(
                                      height: Get.height * 0.02,
                                    ),
                                    Text(
                                      "1 month free",
                                      style: Get.textTheme.titleSmall!.copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: Colorz.textWhite,
                                      ),
                                    ),
                                    SizedBox(
                                      height: Get.height * 0.02,
                                    ),
                                    Text(
                                      "Billed annually",
                                      style: Get.textTheme.titleSmall!.copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: Colorz.textWhite,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    CustomGrediantButton(
                      text: TextString.subscriptionButtonText,
                      textColor: Colorz.main,
                      backgroundColor: Colorz.primaryBackground,
                      isGradient: false,
                      onPressed: () {
                        Get.to(() => SelectRoleView());
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
