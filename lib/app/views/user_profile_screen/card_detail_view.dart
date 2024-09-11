import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:swag_app_flutter/app/custom/custom_single_child_scoll_view.dart';
import 'package:swag_app_flutter/app/theme/colors.dart';

import '../../services/theme_provider.dart';

class CardDetailView extends StatelessWidget {
  const CardDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        forceMaterialTransparency: true,
        automaticallyImplyLeading: false,
        centerTitle: false,
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
                    color: !themeProvider.isDark
                        ? Colorz.textFormFieldDark
                        : Colorz.textPrimary.withOpacity(0.2),
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
      body: CustomSingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: Get.height * 0.55,
              width: Get.width,
              color: Colorz.textBlack,
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.bottomLeft,
                children: [
                  Container(
                    height: Get.size.height * 0.55,
                    width: Get.size.width,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            "assets/images/cards.png",
                          ),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Container(
                    height: Get.size.height * 0.55,
                    width: Get.size.width,
                    color: Colorz.textBlack.withOpacity(0.4),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: SizerUtil.deviceType == DeviceType.mobile
                          ? Get.size.height * 0.02
                          : Get.size.height * 0.04,
                      vertical: SizerUtil.deviceType == DeviceType.mobile
                          ? Get.size.height * 0.02
                          : Get.size.height * 0.04,
                    ),
                    child: Text(
                      "Deep Winter",
                      style: Get.textTheme.displayLarge!.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: 48,
                        color: !themeProvider.isDark
                            ? Colorz.textWhite
                            : Colorz.textWhite.withOpacity(0.8),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizerUtil.deviceType == DeviceType.mobile
                      ? Get.size.height * 0.02
                      : Get.size.height * 0.04,
                  vertical: 20),
              child: Text(
                "Deep Winter color types are characterized by a striking and vivid color palette, ideally suited to their typically cool and high-contrast features. Individuals with this color profile often have dark hair, ranging from medium brown to black, and a cool skin tone that may be pale, olive, or dark. Their eyes are typically deep and intense, such as dark brown, black, or a vivid green or blue. The Deep Winter palette includes cool and rich colors like icy pastels, true white, deep charcoal, and vibrant jewel tones like emerald green, royal blue, and rich purples. These colors complement the natural contrast and intensity of their appearance, creating a stunning and harmonious look. Wearing these colors can make Deep Winters look more vibrant and dynamic, accentuating their natural beauty. This color type should generally avoid warm and muted tones like oranges and yellows, as these can clash with their cool undertones and overpower their natural contrast.",
                style: Get.textTheme.titleMedium!.copyWith(
                  height: 2,
                  fontWeight: FontWeight.w500,
                  color: !themeProvider.isDark
                      ? Colorz.textPrimary
                      : Colorz.violetGrey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
