
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:swag_app_flutter/app/custom/custom_app_bar.dart';
import 'package:swag_app_flutter/app/theme/colors.dart';
import 'package:swag_app_flutter/app/views/digital_tailors_screen/digital_tailors_details_view.dart';

import '../../services/theme_provider.dart';

class DigitalTailorsView extends StatelessWidget {
  const DigitalTailorsView({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Digital Tailors",
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizerUtil.deviceType == DeviceType.mobile
              ? Get.size.height * 0.02
              : Get.size.width * 0.2,
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Get.to(() => const DigitalTailorsDetailsView());
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
                                image: AssetImage(
                                  "assets/images/digitaltailor.png",
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                children: [
                                  Transform(
                                    transform:
                                        Matrix4.translationValues(0, -15, 0),
                                    child: Container(
                                      height: Get.size.height * 0.08,
                                      width: Get.size.height * 0.08,
                                      decoration: BoxDecoration(
                                        image: const DecorationImage(
                                            image: AssetImage(
                                              "assets/images/tailorprofile.jpeg",
                                            ),
                                            fit: BoxFit.cover),
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          strokeAlign:
                                              BorderSide.strokeAlignInside,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Adam Liu",
                                          style: Get.textTheme.titleMedium!
                                              .copyWith(
                                            fontWeight: FontWeight.w700,
                                            color: !themeProvider.isDark
                                                ? Colorz.textPrimary
                                                : Colorz.violetGrey,
                                          ),
                                        ),
                                        Text(
                                          "249K Followers",
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
                                ],
                              ),
                            ),
                          ),
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
