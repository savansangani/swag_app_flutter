import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:swag_app_flutter/app/custom/custom_app_bar.dart';
import 'package:swag_app_flutter/app/custom/custom_grediant_button.dart';
import 'package:swag_app_flutter/app/theme/colors.dart';
import 'package:swag_app_flutter/app/utils/text_string.dart';
import 'package:swag_app_flutter/app/views/style_screen/male/male_controller.dart';

import '../../../services/theme_provider.dart';

class MaleInstructionView extends StatelessWidget {
  MaleInstructionView({super.key});
  final controller = Get.put(MaleController());

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: CustomAppBar(
        backgroundColor: Colorz.formBorder,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: AlignmentDirectional.topCenter,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: SizerUtil.deviceType == DeviceType.mobile
                      ? Get.size.height * 0.025
                      : Get.size.width * 0.2,
                ),
                height: Get.height * 0.5,
                width: Get.width,
                color: Colorz.formBorder,
              ),
              Padding(
                padding: EdgeInsets.only(top: Get.height * 0.03),
                child: Container(
                  height: Get.height * 0.4,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        Colorz.gradient1.withOpacity(0.2),
                        Colorz.gradient2.withOpacity(0.2),
                        Colorz.gradient3.withOpacity(0.2),
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: Get.height * 0.47,
                child: Image.asset(
                  !themeProvider.isDark
                      ? "assets/images/maledarkbody.png"
                      : "assets/images/malebody.png",
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizerUtil.deviceType == DeviceType.mobile
                  ? Get.size.height * 0.025
                  : Get.size.width * 0.2,
            ),
            child: Text(
              TextString.instructionSubTitle,
              textAlign: TextAlign.center,
              style: Get.textTheme.titleMedium!.copyWith(
                color: !themeProvider.isDark
                    ? Colorz.textVioletGrey
                    : Colorz.textPrimary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizerUtil.deviceType == DeviceType.mobile
                  ? Get.size.height * 0.025
                  : Get.size.width * 0.2,
            ),
            child: const CustomGrediantButton(
              text: TextString.startScanningText,
              isGradient: true,
            ),
          ),
          Padding(
            // padding: const EdgeInsets.only(left: 20, bottom: 60, right: 20),
            padding: EdgeInsets.only(
              left: SizerUtil.deviceType == DeviceType.mobile
                  ? Get.size.height * 0.025
                  : Get.size.width * 0.2,
              right: SizerUtil.deviceType == DeviceType.mobile
                  ? Get.size.height * 0.025
                  : Get.size.width * 0.2,
              bottom: SizerUtil.deviceType == DeviceType.mobile
                  ? Get.size.height * 0.060
                  : Get.size.width * 0.2,
            ),
            child: Text(
              TextString.uploadPhotoText,
              textAlign: TextAlign.center,
              style: Get.textTheme.titleLarge!.copyWith(
                fontSize: 20,
                color: !themeProvider.isDark
                    ? Colorz.primaryBackground
                    : Colorz.main,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
