import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:swag_app_flutter/app/custom/custom_app_bar.dart';
import 'package:swag_app_flutter/app/custom/custom_tab_bar.dart';
import 'package:swag_app_flutter/app/theme/colors.dart';
import 'package:swag_app_flutter/app/views/events_screen/events_detail_view.dart';

import '../../services/theme_provider.dart';

class EventsView extends StatelessWidget {
  const EventsView({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Events",
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizerUtil.deviceType == DeviceType.mobile
              ? Get.size.height * 0.02
              : Get.size.width * 0.2,
        ),
        child: Column(
          children: [
            const CustomTabBar(
              tabLength: 2,
              tabs: [
                TabItem(title: "Upcoming"),
                TabItem(title: "Recent"),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Get.to(() => const EventsDetailView());
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Container(
                            height: Get.size.height * 0.30,
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                image: AssetImage("assets/images/event.png"),
                                fit: BoxFit.fill,
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
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: BackdropFilter(
                                filter: ImageFilter.blur(
                                  sigmaX: 8.0,
                                  sigmaY: 8.0,
                                ),
                                child: Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 15),
                                  decoration: BoxDecoration(
                                    color: !themeProvider.isDark
                                        ? Colors.white
                                        : Colorz.dark.withOpacity(0.8),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Los Angeles Fashion Week",
                                        style:
                                            Get.textTheme.titleMedium!.copyWith(
                                          fontWeight: FontWeight.w700,
                                          color: !themeProvider.isDark
                                              ? Colorz.textPrimary
                                              : Colorz.violetGrey,
                                        ),
                                      ),
                                      Text(
                                        "15 Oct — 17 Oct",
                                        style: Get.textTheme.titleSmall!
                                            .copyWith(
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
                          )
                        ],
                      ),
                    ),
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
