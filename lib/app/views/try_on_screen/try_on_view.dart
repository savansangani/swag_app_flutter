import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:swag_app_flutter/app/custom/custom_app_bar.dart';
import 'package:swag_app_flutter/app/custom/custom_grediant_button.dart';
import 'package:swag_app_flutter/app/custom/custom_tab_bar.dart';
import 'package:swag_app_flutter/app/theme/colors.dart';

import '../../services/theme_provider.dart';

class TryOnView extends StatelessWidget {
  const TryOnView({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: const CustomAppBar(
        backButton: false,
        title: " Try on",
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizerUtil.deviceType == DeviceType.mobile
              ? Get.size.height * 0.02
              : Get.size.width * 0.1,
        ),
        child: Stack(
          children: [
            Column(
              children: [
                const CustomTabBar(
                  tabLength: 2,
                  tabs: [
                    TabItem(title: "All Looks"),
                    TabItem(title: "Saved"),
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Column(
                          children: [
                            Container(
                              height: Get.height * 0.6,
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                  image: AssetImage(
                                    "assets/images/tryonprod.png",
                                  ),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(35),
                                border: Border.all(
                                  strokeAlign: BorderSide.strokeAlignInside,
                                  width: 1,
                                  color: !themeProvider.isDark
                                      ? Colorz.primaryBackground
                                          .withOpacity(0.4)
                                      : Colorz.primaryBackground
                                          .withOpacity(0.6),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Container(
                                  height: 32,
                                  width: 32,
                                  decoration: BoxDecoration(
                                    image: const DecorationImage(
                                      image: AssetImage(
                                        "assets/images/tailorprofile.jpeg",
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
                                const SizedBox(width: 5),
                                Text(
                                  "Adam Liu",
                                  style: Get.textTheme.titleMedium!.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: !themeProvider.isDark
                                        ? Colorz.grey
                                        : Colorz.textVioletGrey,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).padding.bottom * 1.2),
              child: const Align(
                alignment: Alignment.bottomCenter,
                child: CustomGrediantButton(
                  text: "Create New Look",
                  isGradient: true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
