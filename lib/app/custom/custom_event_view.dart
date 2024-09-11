import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:swag_app_flutter/app/theme/colors.dart';

import '../services/theme_provider.dart';

class CustomEventView extends StatelessWidget {
  final String? title;
  final double? height;
  final double? width;
  final int itemCount;
  final String? image;
  final String? eventName;
  final String? eventDate;
  final Function()? onTap;
  final bool isback;

  const CustomEventView({
    super.key,
    this.title,
    this.height,
    this.width,
    required this.itemCount,
    this.image,
    this.eventName,
    this.eventDate,
    this.onTap,
    this.isback = true,
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizerUtil.deviceType == DeviceType.mobile
                ? Get.size.height * 0.02
                : Get.size.height * 0.04,
            vertical: SizerUtil.deviceType == DeviceType.mobile
                ? Get.size.height * 0.02
                : Get.size.height * 0.04,
          ),
          child: isback
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title ?? "",
                      style: Get.textTheme.titleLarge!.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: !themeProvider.isDark
                              ? Colorz.textPrimary
                              : Colorz.violetGrey),
                    ),
                    InkWell(
                      onTap: onTap,
                      child: SvgPicture.asset(
                        !themeProvider.isDark
                            ? "assets/icons/rightarrowlight.svg"
                            : "assets/icons/rightarrowdark.svg",
                      ),
                    ),
                  ],
                )
              : null,
        ),
        SizedBox(
          // color: Colors.amberAccent,
          height: 250,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: itemCount,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      height: 250,
                      width: 320,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            "$image",
                          ),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(35),
                        border: Border.all(
                          strokeAlign: BorderSide.strokeAlignInside,
                          width: 1,
                          color: !themeProvider.isDark
                              ? Colorz.textPrimary.withOpacity(0.1)
                              : Colorz.textFormFieldDark,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 8.0,
                            sigmaY: 8.0,
                          ),
                          child: Container(
                            height: 80,
                            width: 280,
                            decoration: BoxDecoration(
                              color: !themeProvider.isDark
                                  ? Colors.white
                                  : Colorz.dark.withOpacity(0.8),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: FittedBox(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      eventName ?? "",
                                      style:
                                          Get.textTheme.titleMedium!.copyWith(
                                        fontWeight: FontWeight.w700,
                                        color: !themeProvider.isDark
                                            ? Colorz.textPrimary
                                            : Colorz.violetGrey,
                                      ),
                                    ),
                                    Text(
                                      eventDate ?? "",
                                      style: Get.textTheme.titleSmall!.copyWith(
                                          fontWeight: FontWeight.w500,
                                          color: !themeProvider.isDark
                                              ? Colorz.textSecondary
                                              : Colorz.textVioletGrey),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
