import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:swag_app_flutter/app/custom/custom_app_bar.dart';
import 'package:swag_app_flutter/app/custom/custom_grediant_button.dart';
import 'package:swag_app_flutter/app/theme/colors.dart';
import 'package:swag_app_flutter/app/utils/text_string.dart';
import 'package:swag_app_flutter/app/views/profile/your_income_controller.dart';
import '../../services/theme_provider.dart';

class YearIncomeView extends StatelessWidget {
  YearIncomeView({super.key});
  final controller = Get.put(YearIncomeController(gender: Get.arguments));

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: const CustomAppBar(
        backButton: true,
        title: TextString.yearIncomeTitle,
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
                        itemCount: controller.incomeList.length,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: InkWell(
                            onTap: () {
                              controller.updateSelectedRange(index);
                            },
                            child: Obx(
                              () => Container(
                                width: Get.width,
                                decoration: BoxDecoration(
                                  color: controller.selectedRange.value == index
                                      ? !themeProvider.isDark
                                          ? Colorz.formBorder
                                          : Colorz.formBorder
                                      : !themeProvider.isDark
                                          ? Colorz.primaryBackground
                                          : Colorz.dark,
                                  borderRadius: BorderRadius.circular(24),
                                  border: Border.all(
                                    strokeAlign: BorderSide.strokeAlignInside,
                                    width: 2,
                                    color:
                                        controller.selectedRange.value == index
                                            ? !themeProvider.isDark
                                                ? Colorz.main
                                                : Colorz.main
                                            : !themeProvider.isDark
                                                ? Colorz.border
                                                : Colorz.textFormFieldDark,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      FittedBox(
                                        child: Text(
                                          controller.incomeList[index].amount!,
                                          style: Get.textTheme.titleLarge!
                                              .copyWith(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700,
                                            color: controller
                                                        .selectedRange.value ==
                                                    index
                                                ? !themeProvider.isDark
                                                    ? Colorz.main
                                                    : Colorz.main
                                                : !themeProvider.isDark
                                                    ? Colorz.textPrimary
                                                    : Colorz.violetGrey,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: Get.height * 0.01,
                                      ),
                                      FittedBox(
                                        child: Text(
                                          controller.incomeList[index].year!,
                                          style: Get.textTheme.titleSmall!
                                              .copyWith(
                                            fontWeight: FontWeight.w500,
                                            color: controller
                                                        .selectedRange.value ==
                                                    index
                                                ? !themeProvider.isDark
                                                    ? Colorz.main
                                                    : Colorz.main
                                                : !themeProvider.isDark
                                                    ? Colorz.textSecondary
                                                    : Colorz.violetGrey,
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

class Income {
  final String? amount;
  final String? year;

  Income({required this.amount, required this.year});
}
