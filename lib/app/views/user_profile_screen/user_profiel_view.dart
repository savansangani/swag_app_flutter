import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:swag_app_flutter/app/custom/custom_single_child_scoll_view.dart';
import 'package:swag_app_flutter/app/theme/colors.dart';
import 'package:swag_app_flutter/app/views/settings/settings_view.dart';
import 'package:swag_app_flutter/app/views/user_profile_screen/card_detail_view.dart';

import '../../services/theme_provider.dart';

class UserProfileView extends StatelessWidget {
  const UserProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    // final themeProvider = Provider.of<ThemeProvider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        forceMaterialTransparency: true,
        centerTitle: false,
        title: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizerUtil.deviceType == DeviceType.mobile
                ? Get.size.height * 0.02
                : Get.size.height * 0.04,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        color: !themeProvider.isDark
                            ? Colorz.textPrimary.withOpacity(0.2)
                            : Colorz.textFormFieldDark,
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
              InkWell(
                onTap: () {
                  Get.to(transition: Transition.upToDown, () => SettingsView());
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
                        color: !themeProvider.isDark
                            ? Colorz.textPrimary.withOpacity(0.2)
                            : Colorz.textFormFieldDark,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          "assets/icons/settings.svg",
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Image.asset(
            !themeProvider.isDark
                ? "assets/images/profilelight.png"
                : "assets/images/profiledark.png",
            fit: BoxFit.cover,
            height: Get.height,
            width: Get.width,
          ),
          CustomSingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: Get.height * 0.35,
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).padding.top + 5),
                  child: Column(
                    children: [
                      Container(
                        height: Get.height * 0.16,
                        width: Get.height * 0.16,
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: AssetImage("assets/images/profilepic.png"),
                            fit: BoxFit.cover,
                          ),
                          shape: BoxShape.circle,
                          border: Border.all(
                              strokeAlign: BorderSide.strokeAlignInside,
                              width: 2,
                              color: !themeProvider.isDark
                                  ? Colorz.primaryBackground
                                  : Colorz.primaryBackground.withOpacity(0.8)),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Mary Smith",
                        style: Get.textTheme.headlineSmall!.copyWith(
                          fontWeight: FontWeight.w700,
                          color: !themeProvider.isDark
                              ? Colorz.textWhite
                              : Colorz.textWhite.withOpacity(0.8),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                    width: Get.width,
                    padding: EdgeInsets.symmetric(
                      horizontal: SizerUtil.deviceType == DeviceType.mobile
                          ? Get.size.height * 0.02
                          : Get.size.width * 0.2,
                      vertical: SizerUtil.deviceType == DeviceType.mobile
                          ? Get.size.height * 0.02
                          : Get.size.height * 0.04,
                    ),
                    decoration: BoxDecoration(
                      color: !themeProvider.isDark
                          ? Colorz.primaryBackground
                          : Colorz.dark,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(35),
                          topRight: Radius.circular(35)),
                    ),
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Get.to(() => const CardDetailView());
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical:
                                  SizerUtil.deviceType == DeviceType.mobile
                                      ? Get.size.height * 0.02
                                      : Get.size.height * 0.01,
                            ),
                            child: Column(
                              children: [
                                Container(
                                  height: Get.height * 0.170,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 20),
                                  decoration: BoxDecoration(
                                    image: const DecorationImage(
                                      image: AssetImage(
                                        "assets/images/cards.png",
                                      ),
                                      fit: BoxFit.cover,
                                      opacity: 0.5,
                                    ),
                                    color: Colorz.textBlack,
                                    borderRadius: BorderRadius.circular(34),
                                    border: Border.all(
                                        strokeAlign:
                                            BorderSide.strokeAlignInside,
                                        width: 1,
                                        color: !themeProvider.isDark
                                            ? Colorz.border
                                            : Colorz.textFormFieldDark),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        "Style Type",
                                        style:
                                            Get.textTheme.titleSmall!.copyWith(
                                          fontWeight: FontWeight.w500,
                                          color: !themeProvider.isDark
                                              ? Colorz.textWhite
                                              : Colorz.textWhite
                                                  .withOpacity(0.8),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              "Streetwear",
                                              style: Get
                                                  .textTheme.headlineSmall!
                                                  .copyWith(
                                                fontWeight: FontWeight.w700,
                                                color: !themeProvider.isDark
                                                    ? Colorz.textWhite
                                                    : Colorz.textWhite
                                                        .withOpacity(0.8),
                                              ),
                                            ),
                                          ),
                                          SvgPicture.asset(
                                            height: 24,
                                            width: 24,
                                            "assets/icons/rightarrowwhite.svg",
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
