import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:swag_app_flutter/app/theme/colors.dart';

import '../services/theme_provider.dart';

class CustomImagePolls extends StatelessWidget {
  final String title;
  final String creatorName;
  final String creatorIcon;

  const CustomImagePolls({
    super.key,
    required this.title,
    required this.creatorName,
    required this.creatorIcon,
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizerUtil.deviceType == DeviceType.mobile
            ? Get.size.height * 0.02
            : Get.size.height * 0.04,
        vertical: SizerUtil.deviceType == DeviceType.mobile
            ? Get.size.height * 0.02
            : Get.size.height * 0.04,
      ),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            width: 1,
            color: !themeProvider.isDark
                ? Colorz.formBorder
                : Colorz.violet.withOpacity(0.1),
          ),
          color: !themeProvider.isDark
              ? Colorz.pollBackground
              : Colorz.textFormFieldDark,
        ),
        child: Column(
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: Get.textTheme.titleLarge!.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: !themeProvider.isDark
                    ? Colorz.main
                    : Colorz.violet.withOpacity(1),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GridView.builder(
              padding: EdgeInsets.zero,
              itemCount: 2,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                childAspectRatio: Get.size.aspectRatio * 1.35,
              ),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Container(
                          height: Get.height * 0.25,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage(
                                "assets/images/prod.png",
                              ),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(35),
                            border: Border.all(
                              strokeAlign: BorderSide.strokeAlignInside,
                              width: 1,
                              color: !themeProvider.isDark
                                  ? Colorz.primaryBackground.withOpacity(0.4)
                                  : Colorz.primaryBackground.withOpacity(0.6),
                            ),
                          ),
                        ),
                        Container(
                          height: Get.height * 0.25,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colorz.textBlack.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(35),
                            border: Border.all(
                              strokeAlign: BorderSide.strokeAlignInside,
                              width: 1,
                              color: !themeProvider.isDark
                                  ? Colorz.primaryBackground.withOpacity(0.4)
                                  : Colorz.primaryBackground.withOpacity(0.6),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: SvgPicture.asset(
                            height: 30,
                            width: 30,
                            "assets/icons/heart.svg",
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "12 Votes",
                      style: Get.textTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: !themeProvider.isDark
                            ? Colorz.textSecondary
                            : Colorz.textVioletGrey,
                      ),
                    ),
                  ],
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Container(
                  height: 32,
                  width: 32,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        creatorIcon,
                      ),
                      fit: BoxFit.cover,
                    ),
                    shape: BoxShape.circle,
                    border: Border.all(
                      strokeAlign: BorderSide.strokeAlignInside,
                      width: 1,
                      color: !themeProvider.isDark
                          ? Colorz.border
                          : Colorz.textFormFieldDark,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  creatorName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Get.textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w700,
                    color: !themeProvider.isDark
                        ? Colorz.textPrimary
                        : Colorz.textVioletGrey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
