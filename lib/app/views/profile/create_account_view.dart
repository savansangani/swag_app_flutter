import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:swag_app_flutter/app/custom/custom_app_bar.dart';
import 'package:swag_app_flutter/app/custom/custom_grediant_button.dart';
import 'package:swag_app_flutter/app/custom/custom_single_child_scoll_view.dart';
import 'package:swag_app_flutter/app/custom/custom_text_form_field.dart';
import 'package:swag_app_flutter/app/theme/colors.dart';
import 'package:swag_app_flutter/app/utils/text_string.dart';
import 'package:swag_app_flutter/app/views/profile/create_account_cotroller.dart';

import '../../services/theme_provider.dart';

class CreateAccountView extends StatelessWidget {
  CreateAccountView({super.key});
  final controller = Get.put(CreateAccountController());

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: const CustomAppBar(
        backButton: true,
        title: TextString.createAccountTitle,
      ),
      body: Obx(
        () => controller.isloding.value
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colorz.main,
                ),
              )
            : Padding(
                padding: EdgeInsets.only(
                  left: SizerUtil.deviceType == DeviceType.mobile
                      ? Get.size.height * 0.02
                      : Get.size.width * 0.2,
                  right: SizerUtil.deviceType == DeviceType.mobile
                      ? Get.size.height * 0.02
                      : Get.size.width * 0.2,
                  bottom: SizerUtil.deviceType == DeviceType.mobile
                      ? Get.size.height * 0.02
                      : Get.size.width * 0.2,
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: CustomSingleChildScrollView(
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  height: 150,
                                  width: 150,
                                  decoration: BoxDecoration(
                                    color: !themeProvider.isDark
                                        ? Colorz.formBorder
                                        : Colorz.violet,
                                    borderRadius: BorderRadius.circular(100),
                                    image: controller.pickedImage != null
                                        ? DecorationImage(
                                            image: FileImage(
                                                controller.pickedImage!),
                                            fit: BoxFit.cover,
                                          )
                                        : controller.profilePic != null
                                            ? DecorationImage(
                                                image: NetworkImage(
                                                    controller.profilePic!),
                                                fit: BoxFit.cover,
                                              )
                                            : null,
                                  ),
                                  child: controller.profilePic == null
                                      ? Center(
                                          child: SvgPicture.asset(
                                            "assets/icons/camera.svg",
                                          ),
                                        )
                                      : null,
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: Get.height * 0.005,
                                  child: InkWell(
                                    onTap: () async {
                                      await controller.pickImage();
                                    },
                                    child: Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          color: !themeProvider.isDark
                                              ? Colorz.primaryBackground
                                              : Colorz.dark,
                                          borderRadius:
                                              BorderRadius.circular(100),
                                        ),
                                        child: Center(
                                          child: SvgPicture.asset(
                                            "assets/icons/edit.svg",
                                          ),
                                        )),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: Get.height * 0.03,
                            ),
                            CustomTextFormField(
                              hintText: 'Full Name',
                              controller: controller.nameController.value,
                            ),
                            SizedBox(
                              height: Get.height * 0.03,
                            ),
                            CustomTextFormField(
                              hintText: 'Email',
                              controller: controller.emailController.value,
                            ),
                            SizedBox(
                              height: Get.height * 0.03,
                            ),
                            Text(
                              TextString.genderSubTitle,
                              style: Get.textTheme.titleLarge!.copyWith(
                                fontSize: 20,
                                color: Colorz.main,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(
                              height: Get.height * 0.04,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Obx(
                                  () => Column(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          controller
                                              .updateSelectedGender('female');
                                        },
                                        child: Container(
                                          height: 80,
                                          width: 80,
                                          decoration: BoxDecoration(
                                            color: controller
                                                        .selectedGender.value ==
                                                    'female'
                                                ? !themeProvider.isDark
                                                    ? Colorz.formBorder
                                                    : Colorz.formBorder
                                                : !themeProvider.isDark
                                                    ? Colorz.primaryBackground
                                                    : Colorz.dark,
                                            border: Border.all(
                                              color: controller.selectedGender
                                                          .value ==
                                                      'female'
                                                  ? !themeProvider.isDark
                                                      ? Colorz.main
                                                      : Colorz.main
                                                  : !themeProvider.isDark
                                                      ? Colorz.border
                                                      : Colorz
                                                          .textFormFieldDark,
                                              width: 2,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(100),
                                          ),
                                          child: Center(
                                            child: SvgPicture.asset(
                                              controller.selectedGender.value ==
                                                      'female'
                                                  ? "assets/icons/femalemain.svg"
                                                  : !themeProvider.isDark
                                                      ? "assets/icons/female.svg"
                                                      : "assets/icons/darkfemale.svg",
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: Get.height * 0.01,
                                      ),
                                      Text(
                                        TextString.femaleText,
                                        style:
                                            Get.textTheme.titleMedium!.copyWith(
                                          color:
                                              controller.selectedGender.value ==
                                                      'female'
                                                  ? !themeProvider.isDark
                                                      ? Colorz.main
                                                      : Colorz.main
                                                  : !themeProvider.isDark
                                                      ? Colorz.textPrimary
                                                      : Colorz.textVioletGrey,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Obx(
                                  () => Column(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          controller
                                              .updateSelectedGender('male');
                                        },
                                        child: Container(
                                          height: 80,
                                          width: 80,
                                          decoration: BoxDecoration(
                                            color: controller
                                                        .selectedGender.value ==
                                                    'male'
                                                ? !themeProvider.isDark
                                                    ? Colorz.formBorder
                                                    : Colorz.formBorder
                                                : !themeProvider.isDark
                                                    ? Colorz.primaryBackground
                                                    : Colorz.dark,
                                            border: Border.all(
                                              color: controller.selectedGender
                                                          .value ==
                                                      'male'
                                                  ? !themeProvider.isDark
                                                      ? Colorz.main
                                                      : Colorz.main
                                                  : !themeProvider.isDark
                                                      ? Colorz.border
                                                      : Colorz
                                                          .textFormFieldDark,
                                              width: 2,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(100),
                                          ),
                                          child: Center(
                                            child: SvgPicture.asset(
                                              controller.selectedGender.value ==
                                                      'male'
                                                  ? "assets/icons/malemain.svg"
                                                  : !themeProvider.isDark
                                                      ? "assets/icons/male.svg"
                                                      : "assets/icons/darkmale.svg",
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: Get.height * 0.01,
                                      ),
                                      Text(
                                        TextString.maleText,
                                        style:
                                            Get.textTheme.titleMedium!.copyWith(
                                          color:
                                              controller.selectedGender.value ==
                                                      'male'
                                                  ? !themeProvider.isDark
                                                      ? Colorz.main
                                                      : Colorz.main
                                                  : !themeProvider.isDark
                                                      ? Colorz.textPrimary
                                                      : Colorz.textVioletGrey,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    CustomGrediantButton(
                      onPressed: () {
                        controller.goToYearIncomeView();
                      },
                      text: TextString.continueText,
                      isGradient: true,
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
