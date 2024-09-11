import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:swag_app_flutter/app/custom/custom_grediant_button.dart';
import 'package:swag_app_flutter/app/theme/colors.dart';

class ScanningInstructionView extends StatelessWidget {
  const ScanningInstructionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(0, 49, 7, 7),
        title: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizerUtil.deviceType == DeviceType.mobile
                ? Get.size.height * 0.02
                : Get.size.height * 0.04,
          ),
          child: InkWell(
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
        ),
      ),
      body: Stack(
        children: [
          Image.asset(
            "assets/images/scanninginstruc.png",
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
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Scan clothes you like",
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
                  "Simply scan any clothing item, and our AI technology will identify it, providing you with purchase links instantly.",
                  style: Get.textTheme.titleMedium!.copyWith(
                    color: Colorz.textWhite,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.03,
                ),
                CustomGrediantButton(
                  onPressed: () {},
                  text: "Start Scanning",
                  isGradient: true,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
