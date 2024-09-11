import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:swag_app_flutter/app/custom/custom_grediant_button.dart';
import 'package:swag_app_flutter/app/custom/custom_product_view.dart';
import 'package:swag_app_flutter/app/custom/custom_single_child_scoll_view.dart';
import 'package:swag_app_flutter/app/custom/custom_single_product_view.dart';
import 'package:swag_app_flutter/app/theme/colors.dart';

import '../../services/theme_provider.dart';

class EventsDetailView extends StatelessWidget {
  const EventsDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        centerTitle: false,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
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
            SizedBox(
              height: Get.height * 0.55,
              width: Get.width,
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.bottomCenter,
                children: [
                  Image.asset(
                    "assets/images/event.png",
                    height: Get.size.height * 0.55,
                    width: Get.size.width,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: Get.size.height * 0.44,
                    child: Column(
                      children: [
                        Container(
                          width: Get.size.width * 0.8,
                          decoration: BoxDecoration(
                            color: !themeProvider.isDark
                                ? Colorz.primaryBackground
                                : Colorz.dark,
                            borderRadius: BorderRadius.circular(20),
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
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Los Angeles Fashion Week",
                                  style: Get.textTheme.headlineSmall!.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: !themeProvider.isDark
                                        ? Colorz.textPrimary
                                        : Colorz.violetGrey,
                                  ),
                                ),
                                SizedBox(
                                  height: Get.height * 0.02,
                                ),
                                Text(
                                  "15 Oct — 17 Oct",
                                  style: Get.textTheme.titleSmall!.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: !themeProvider.isDark
                                          ? Colorz.textSecondary
                                          : Colorz.textVioletGrey),
                                ),
                                SizedBox(
                                  height: Get.height * 0.02,
                                ),
                                CustomGrediantButton(
                                  onPressed: () {},
                                  text: "Details",
                                  textColor: Colorz.main,
                                  isGradient: true,
                                  opecity: 0.12,
                                ),
                              ],
                            ),
                          ),
                        ),
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
          ],
        ),
      ),
    );
  }
}
