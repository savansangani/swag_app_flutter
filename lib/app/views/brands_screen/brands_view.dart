import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:swag_app_flutter/app/custom/custom_app_bar.dart';
import 'package:swag_app_flutter/app/theme/colors.dart';
import 'package:swag_app_flutter/app/views/brands_screen/brands_detail_view.dart';

import '../../services/theme_provider.dart';

class BrandsView extends StatelessWidget {
  const BrandsView({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Brands",
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            color: !themeProvider.isDark
                                ? Colorz.primaryBackground
                                : Colorz.textFormFieldDark,
                            image: DecorationImage(
                                image: AssetImage(
                                  !themeProvider.isDark
                                      ? "assets/icons/brand.png"
                                      : "assets/icons/branddark.png",
                                ),
                                fit: BoxFit.cover),
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 1,
                              color: !themeProvider.isDark
                                  ? Colorz.textPrimary.withOpacity(0.2)
                                  : Colorz.textFormFieldDark,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.05,
                        ),
                        FittedBox(
                          child: InkWell(
                            onTap: () {
                              Get.to(() => const BrandDetailView());
                            },
                            child: Text(
                              "Brand Name",
                              overflow: TextOverflow.ellipsis,
                              style: Get.textTheme.titleLarge!.copyWith(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: !themeProvider.isDark
                                    ? Colorz.textPrimary
                                    : Colorz.violetGrey,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
