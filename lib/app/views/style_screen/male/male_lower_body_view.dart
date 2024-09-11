import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:swag_app_flutter/app/custom/custom_app_bar.dart';
import 'package:swag_app_flutter/app/custom/custom_grediant_button.dart';
import 'package:swag_app_flutter/app/custom/custom_single_child_scoll_view.dart';
import 'package:swag_app_flutter/app/custom/custom_text_form_field.dart';
import 'package:swag_app_flutter/app/theme/colors.dart';
import 'package:swag_app_flutter/app/utils/text_string.dart';
import 'package:swag_app_flutter/app/views/style_screen/male/male_controller.dart';
import '../../../services/theme_provider.dart';

class MaleLowerBodyView extends StatelessWidget {
  MaleLowerBodyView({super.key});
  final controller = Get.put(MaleController());

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: const CustomAppBar(
        backButton: true,
        title: TextString.yourParaMeterTitle,
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: SizerUtil.deviceType == DeviceType.mobile
              ? Get.size.height * 0.02
              : Get.size.width * 0.2,
          right: SizerUtil.deviceType == DeviceType.mobile
              ? Get.size.height * 0.02
              : Get.size.width * 0.2,
          top: SizerUtil.deviceType == DeviceType.mobile
              ? Get.height * 0.02
              : Get.height * 0.03,
          bottom: SizerUtil.deviceType == DeviceType.mobile
              ? Get.size.height * 0.04
              : Get.size.height * 0.03,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: CustomSingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        TextString.maleLowerBodyTitle,
                        style: Get.textTheme.titleLarge!.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: !themeProvider.isDark
                              ? Colorz.secondary
                              : Colorz.textVioletGrey,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.03,
                    ),
                    CustomTextFormField(
                      hintText: TextString.maleLowerHintText1,
                      controller: controller.maleLowerText1Controller.value,
                      suffixIcon: SizedBox(
                        width: Get.width * 0.01,
                        child: Center(
                          child: Text(
                            TextString.suffixText,
                            style: Get.textTheme.titleMedium!.copyWith(
                              color: !themeProvider.isDark
                                  ? Colorz.secondary
                                  : Colorz.textVioletGrey,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 5),
                      child: Text(
                        TextString.maleLowerSubText1,
                        style: Get.textTheme.titleMedium!.copyWith(
                          color: !themeProvider.isDark
                              ? Colorz.secondary
                              : Colorz.textVioletGrey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.016,
                    ),
                    CustomTextFormField(
                      hintText: TextString.maleLowerHintText2,
                      controller: controller.maleLowerText2Controller.value,
                      suffixIcon: SizedBox(
                        width: Get.width * 0.01,
                        child: Center(
                          child: Text(
                            TextString.suffixText,
                            style: Get.textTheme.titleMedium!.copyWith(
                              color: !themeProvider.isDark
                                  ? Colorz.secondary
                                  : Colorz.textVioletGrey,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 5),
                      child: Text(
                        TextString.maleLowerSubText2,
                        style: Get.textTheme.titleMedium!.copyWith(
                          color: !themeProvider.isDark
                              ? Colorz.secondary
                              : Colorz.textVioletGrey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.016,
                    ),
                    CustomTextFormField(
                      hintText: TextString.maleLowerHintText3,
                      controller: controller.maleLowerText3Controller.value,
                      suffixIcon: SizedBox(
                        width: Get.width * 0.01,
                        child: Center(
                          child: Text(
                            TextString.suffixText,
                            style: Get.textTheme.titleMedium!.copyWith(
                              color: !themeProvider.isDark
                                  ? Colorz.secondary
                                  : Colorz.textVioletGrey,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 5),
                      child: Text(
                        TextString.maleLowerSubText3,
                        style: Get.textTheme.titleMedium!.copyWith(
                          color: !themeProvider.isDark
                              ? Colorz.secondary
                              : Colorz.textVioletGrey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                CustomGrediantButton(
                  onPressed: () {
                    controller.goToMaleAdditionalView();
                  },
                  text: TextString.continueText,
                  textColor: Colorz.main,
                  isGradient: true,
                  opecity: 0.12,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
