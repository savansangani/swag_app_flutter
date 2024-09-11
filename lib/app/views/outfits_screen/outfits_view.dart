import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:swag_app_flutter/app/custom/custom_app_bar.dart';
import 'package:swag_app_flutter/app/custom/custom_grediant_button.dart';
import 'package:swag_app_flutter/app/theme/colors.dart';
import 'package:swag_app_flutter/app/views/scanning_instruction_screen/scanning_instruction_view.dart';

import '../../services/theme_provider.dart';

class OutFitsView extends StatelessWidget {
  const OutFitsView({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: const CustomAppBar(
        backButton: false,
        title: "Outfits",
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizerUtil.deviceType == DeviceType.mobile
              ? Get.size.height * 0.02
              : Get.size.width * 0.1,
          vertical: SizerUtil.deviceType == DeviceType.mobile
              ? Get.size.height * 0.02
              : Get.size.height * 0.04,
        ),
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: SizedBox(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                        mainAxisExtent: 250,
                      ),
                      itemBuilder: (context, index) {
                        return Container(
                          height: 300,
                          width: 200,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage(
                                "assets/images/outfitsprod.png",
                              ),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(35),
                            border: Border.all(
                              strokeAlign: BorderSide.strokeAlignInside,
                              width: 1,
                              color: !themeProvider.isDark
                                  ? Colorz.border
                                  : Colorz.textFormFieldDark,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).padding.bottom * 1.2),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: CustomGrediantButton(
                  onPressed: () {
                    Get.to(() => const ScanningInstructionView());
                  },
                  text: "Scan Outfit",
                  isGradient: true,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
