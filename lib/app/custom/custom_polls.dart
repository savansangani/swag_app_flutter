import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:swag_app_flutter/app/theme/colors.dart';

import '../services/theme_provider.dart';

class CustomPolls extends StatelessWidget {
  final String title;
  final String? votes;
  final String creatorName;
  final String creatorIcon;
  const CustomPolls({
    super.key,
    required this.title,
    this.votes,
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
        padding: EdgeInsets.symmetric(
          horizontal: SizerUtil.deviceType == DeviceType.mobile
              ? Get.size.height * 0.02
              : Get.size.height * 0.04,
          vertical: SizerUtil.deviceType == DeviceType.mobile
              ? Get.size.height * 0.02
              : Get.size.height * 0.04,
        ),
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
            ListView.builder(
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: SizerUtil.deviceType == DeviceType.mobile
                        ? Get.size.height * 0.01
                        : Get.size.height * 0.01,
                  ),
                  child: Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      SizedBox(
                        height: Get.size.height * 0.06,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: LinearProgressIndicator(
                            value: 0.5,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              !themeProvider.isDark
                                  ? Colorz.main.withOpacity(0.2)
                                  : Colorz.main.withOpacity(0.6),
                            ),
                            backgroundColor: !themeProvider.isDark
                                ? Colorz.lightViolet
                                : Colorz.textFormFieldDark,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "1920s-1930s (Art Deco, Flapper style)",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Get.textTheme.titleSmall!.copyWith(
                            fontWeight: FontWeight.w500,
                            color: !themeProvider.isDark
                                ? Colorz.main
                                : Colorz.textVioletGrey,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
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
                Expanded(
                  child: Text(
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
            ),
          ],
        ),
      ),
    );
  }
}
