import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:swag_app_flutter/app/custom/custom_app_bar.dart';
import 'package:swag_app_flutter/app/custom/custom_grediant_button.dart';
import 'package:swag_app_flutter/app/theme/colors.dart';
import 'package:swag_app_flutter/app/utils/text_string.dart';
import 'package:swag_app_flutter/app/views/profile/select_role_controller.dart';

import '../../services/theme_provider.dart';

class SelectRoleView extends StatelessWidget {
  SelectRoleView({super.key});
  final controller = Get.put(SelectRoleController());

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: const CustomAppBar(
        backButton: false,
        title: "Select your role",
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
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: controller.roleList.length,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: InkWell(
                            onTap: () {
                              controller.updateSelectedRole(index);
                            },
                            child: Obx(
                              () => Container(
                                width: Get.width,
                                decoration: BoxDecoration(
                                  color: controller.selectedRole.value == index
                                      ? themeProvider.isDark
                                          ? Colorz.formBorder
                                          : Colorz.formBorder
                                      : themeProvider.isDark
                                          ? Colorz.dark
                                          : Colorz.primaryBackground,
                                  borderRadius: BorderRadius.circular(24),
                                  border: Border.all(
                                    strokeAlign: BorderSide.strokeAlignInside,
                                    width: 2,
                                    color:
                                        controller.selectedRole.value == index
                                            ? themeProvider.isDark
                                                ? Colorz.main
                                                : Colorz.main
                                            : themeProvider.isDark
                                                ? Colorz.textFormFieldDark
                                                : Colorz.border,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      FittedBox(
                                        child: Text(
                                          controller.roleList[index].title!,
                                          style: Get.textTheme.titleLarge!
                                              .copyWith(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700,
                                            color:
                                                controller.selectedRole.value ==
                                                        index
                                                    ? themeProvider.isDark
                                                        ? Colorz.main
                                                        : Colorz.main
                                                    : themeProvider.isDark
                                                        ? Colorz.violetGrey
                                                        : Colorz.textPrimary,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: Get.height * 0.01,
                                      ),
                                      FittedBox(
                                        child: Text(
                                          controller.roleList[index].subTitle!,
                                          style: Get.textTheme.titleSmall!
                                              .copyWith(
                                            fontWeight: FontWeight.w500,
                                            color:
                                                controller.selectedRole.value ==
                                                        index
                                                    ? themeProvider.isDark
                                                        ? Colorz.main
                                                        : Colorz.main
                                                    : themeProvider.isDark
                                                        ? Colorz.violetGrey
                                                        : Colorz.textSecondary,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    CustomGrediantButton(
                      onPressed: () {
                        controller.onContinuePress();
                      },
                      text: TextString.continueText,
                      isGradient: true,
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}

class Role {
  final String? title;
  final String? subTitle;
  final String? value;

  Role({required this.title, required this.subTitle, required this.value});
}
