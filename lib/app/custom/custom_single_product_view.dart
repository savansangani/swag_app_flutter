import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../services/theme_provider.dart';
import '../theme/colors.dart';

class CustomSingleProductView extends StatelessWidget {
  final String? image;
  final String? userImage;
  final String? userName;
  final Function()? onTap;

  const CustomSingleProductView({
    this.image,
    this.userImage,
    this.userName,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 300,
            width: 200,
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
                    ? Colorz.primaryBackground.withOpacity(0.4)
                    : Colorz.primaryBackground.withOpacity(0.6),
              ),
            ),
          ),
          userImage != null || userName != null
              ? const SizedBox(height: 10)
              : const SizedBox.shrink(),
          Row(
            children: [
              userImage != null
                  ? Container(
                      height: 32,
                      width: 32,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("$userImage"),
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
                    )
                  : const SizedBox.shrink(),
              SizedBox(width: userImage != null ? 5 : 0),
              userName != null
                  ? Text(
                      userName!,
                      style: Get.textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.w700,
                        color: !themeProvider.isDark
                            ? Colorz.grey
                            : Colorz.textVioletGrey,
                      ),
                    )
                  : const SizedBox.shrink()
            ],
          )
        ],
      ),
    );
  }
}
