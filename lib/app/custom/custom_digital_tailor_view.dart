import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:swag_app_flutter/app/theme/colors.dart';

import '../services/theme_provider.dart';

class CustomDigitalTailorView extends StatelessWidget {
  final String? title;
  final double? height;
  final double? width;
  final int itemCount;
  final String? image;
  final String? tailorProfile;
  final String? tailorName;
  final String? follower;
  final Function()? onTap;
  const CustomDigitalTailorView({
    super.key,
    this.title,
    this.height,
    this.width,
    required this.itemCount,
    this.image,
    this.tailorProfile,
    this.tailorName,
    this.follower,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Row(
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
          ),
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
                    Container(
                      height: 80,
                      width: 320,
                      decoration: BoxDecoration(
                        color: !themeProvider.isDark
                            ? Colorz.primaryBackground
                            : Colorz.dark,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(35),
                          bottomRight: Radius.circular(35),
                        ),
                        border: Border.all(
                          strokeAlign: BorderSide.strokeAlignInside,
                          width: 1,
                          color: !themeProvider.isDark
                              ? Colorz.textPrimary.withOpacity(0.1)
                              : Colorz.textFormFieldDark,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            Transform(
                              transform: Matrix4.translationValues(0, -15, 0),
                              child: Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                        "$tailorProfile",
                                      ),
                                      fit: BoxFit.cover),
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    strokeAlign: BorderSide.strokeAlignInside,
                                    width: 2,
                                    color: !themeProvider.isDark
                                        ? Colorz.primaryBackground
                                        : Colorz.dark,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            FittedBox(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    tailorName ?? "",
                                    style: Get.textTheme.titleMedium!.copyWith(
                                      fontWeight: FontWeight.w700,
                                      color: !themeProvider.isDark
                                          ? Colorz.textPrimary
                                          : Colorz.violetGrey,
                                    ),
                                  ),
                                  Text(
                                    follower ?? "",
                                    style: Get.textTheme.titleSmall!.copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: !themeProvider.isDark
                                            ? Colorz.textSecondary
                                            : Colorz.textVioletGrey),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
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
