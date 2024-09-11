import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:swag_app_flutter/app/custom/custom_app_bar.dart';
import 'package:swag_app_flutter/app/custom/custom_single_child_scoll_view.dart';
import 'package:swag_app_flutter/app/custom/custom_switch.dart';
import 'package:swag_app_flutter/app/theme/colors.dart';
import 'package:swag_app_flutter/app/views/onboarding_screen/onboarding_view.dart';
import 'package:swag_app_flutter/app/views/profile/create_account_view.dart';
import 'package:swag_app_flutter/app/views/settings/feedback_screen/feedback_view.dart';
import 'package:swag_app_flutter/app/views/settings/setting_model.dart';
import 'package:swag_app_flutter/app/views/settings/settings_controller.dart';
import 'package:swag_app_flutter/app/views/subscription_screen/subscription_view.dart';
import '../../services/shared_preferences.dart';
import '../../services/theme_provider.dart';

class SettingsView extends StatelessWidget {
  SettingsView({super.key});

  final controller = Get.put(SettingsController());

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    List<SettingModel> settingList = [
      SettingModel(title: "Dark Mode", onTap: () {}),
      SettingModel(title: "Manage Photos", onTap: () {}),
      SettingModel(
          title: "Edit Profile",
          onTap: () {
            Get.to(() => CreateAccountView());
          }),
      SettingModel(title: "Change Password", onTap: () {}),
      SettingModel(
          title: "Restore Subscription",
          onTap: () {
            Get.to(() => const SubScriptionView());
          }),
      SettingModel(
          title: "Feedback",
          onTap: () {
            Get.to(() => FeedbackView());
          }),
      SettingModel(title: "Privacy Policy", onTap: () {}),
      SettingModel(title: "FAQ", onTap: () {}),
      SettingModel(
        title: "Log Out",
        onTap: () {
          SharedPreferencesService().deleteAll();
          Get.offAll(() => OnBoardingView());
        },
      ),
      SettingModel(
          title: "Delete Profile", onTap: () {}, isDeleteAccount: true),
    ];

    return Scaffold(
      appBar: const CustomAppBar(
        title: "Settings",
      ),
      body: CustomSingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: settingList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: settingList[index].onTap,
                    shape: Border(
                      bottom: BorderSide(
                          width: 1,
                          color: !themeProvider.isDark
                              ? Colorz.border
                              : Colorz.textFormFieldDark),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: SizerUtil.deviceType == DeviceType.mobile
                          ? Get.size.height * 0.02
                          : Get.size.height * 0.04,
                    ),
                    title: Text(
                      settingList[index].title,
                      style: Get.textTheme.titleLarge!.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: settingList[index].isDeleteAccount
                              ? Colorz.error
                              : !themeProvider.isDark
                                  ? Colorz.textPrimary
                                  : Colorz.violetGrey),
                    ),
                    trailing: settingList[index].title == 'Dark Mode'
                        ? CustomSwitch(
                            value: themeProvider.isDark,
                            onChanged: (value) async {
                              themeProvider.changeTheme();
                            },
                          )
                        : const SizedBox.shrink(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
