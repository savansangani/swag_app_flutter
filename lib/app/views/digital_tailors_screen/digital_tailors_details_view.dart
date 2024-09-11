import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:swag_app_flutter/app/custom/custom_polls.dart';
import 'package:swag_app_flutter/app/custom/custom_product_view.dart';
import 'package:swag_app_flutter/app/custom/custom_single_child_scoll_view.dart';
import 'package:swag_app_flutter/app/custom/custom_single_product_view.dart';
import '../../services/theme_provider.dart';
import '../../theme/colors.dart';

class DigitalTailorsDetailsView extends StatelessWidget {
  const DigitalTailorsDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        forceMaterialTransparency: true,
        backgroundColor: Colors.transparent,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
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
              InkWell(
                onTap: () {},
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 15.0,
                      sigmaY: 15.0,
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: !themeProvider.isDark
                            ? Colorz.textFormFieldDark
                            : Colorz.textPrimary.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Text(
                        "Following",
                        style: Get.textTheme.titleMedium!.copyWith(
                            fontWeight: FontWeight.w500,
                            color: Colorz.textWhite),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: CustomSingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: Get.height * 0.55,
              width: Get.width,
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.bottomCenter,
                children: [
                  Image.asset(
                    "assets/images/tailordetail.png",
                    height: Get.size.height * 0.55,
                    width: Get.size.width,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: Get.size.height * 0.48,
                    child: Column(
                      children: [
                        Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                            color: !themeProvider.isDark
                                ? Colorz.primaryBackground
                                : Colorz.dark,
                            shape: BoxShape.circle,
                            image: const DecorationImage(
                                image: AssetImage(
                                  "assets/images/tailorprofile.jpeg",
                                ),
                                fit: BoxFit.cover),
                            border: Border.all(
                              strokeAlign: BorderSide.strokeAlignInside,
                              width: 1,
                              color: !themeProvider.isDark
                                  ? Colorz.border
                                  : Colorz.textFormFieldDark,
                            ),
                            boxShadow: [
                              BoxShadow(
                                  color: Colorz.tabButtonShadow,
                                  offset: const Offset(0, 10),
                                  blurRadius: 30)
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Adam Liu",
                          style: Get.textTheme.headlineSmall!.copyWith(
                            fontWeight: FontWeight.w700,
                            color: !themeProvider.isDark
                                ? Colorz.textPrimary
                                : Colorz.violetGrey,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "249K Followers",
                          style: Get.textTheme.titleSmall!.copyWith(
                            fontWeight: FontWeight.w500,
                            color: !themeProvider.isDark
                                ? Colorz.textPrimary
                                : Colorz.violetGrey,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Get.size.height * 0.14,
            ),
            CustomProductView(
              title: "Looks",
              listView: SizedBox(
                height: 350,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return const CustomSingleProductView(
                      image: "assets/images/prod.png",
                    );
                  },
                ),
              ),
            ),
            const CustomPolls(
              title: "What is your favorite decade for fashion inspiration?",
              creatorName: "Adam Liu",
              creatorIcon: "assets/images/prod.png",
            ),
          ],
        ),
      ),
    );
  }
}
