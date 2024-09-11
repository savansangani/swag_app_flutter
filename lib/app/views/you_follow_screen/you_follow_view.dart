import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:swag_app_flutter/app/custom/custom_app_bar.dart';
import 'package:swag_app_flutter/app/custom/custom_product_view.dart';
import 'package:swag_app_flutter/app/custom/custom_single_product_view.dart';
import 'package:swag_app_flutter/app/theme/colors.dart';

import '../../services/theme_provider.dart';

class YouFollowView extends StatelessWidget {
  const YouFollowView({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: const CustomAppBar(
        title: "You follow",
      ),
      body: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          return CustomProductView(
            onTap: () {},
            userImage: "assets/images/tailorprofile.jpeg",
            textWidget: Text(
              "Adam Liu",
              style: Get.textTheme.titleLarge!.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: !themeProvider.isDark
                    ? Colorz.grey
                    : Colorz.textVioletGrey,
              ),
            ),
            listView: SizedBox(
              height: 300,
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
          );
        },
      ),
    );
  }
}
