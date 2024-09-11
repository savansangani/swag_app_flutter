import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:swag_app_flutter/app/theme/colors.dart';

import '../services/theme_provider.dart';

class CustomProductView extends StatelessWidget {
  final String? title;
  final String? userImage;
  final Widget listView;
  final Widget? textWidget;
  final Function()? onTap;

  const CustomProductView({
    this.title,
    this.onTap,
    this.userImage,
    this.textWidget,
    required this.listView,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizerUtil.deviceType == DeviceType.mobile
                ? Get.size.height * 0.02
                : Get.size.height * 0.04,
            vertical: SizerUtil.deviceType == DeviceType.mobile
                ? Get.size.height * 0.02
                : Get.size.height * 0.04,
          ),
          child: Row(
            children: [
              userImage != null
                  ? Container(
                      height: 40,
                      width: 40,
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
              SizedBox(width: userImage != null ? 10 : 0),
              title != null
                  ? Expanded(
                      child: Text(
                        title!,
                        style: Get.textTheme.titleLarge!.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: !themeProvider.isDark
                                ? Colorz.textPrimary
                                : Colorz.violetGrey),
                      ),
                    )
                  : textWidget != null
                      ? Expanded(child: textWidget!)
                      : const SizedBox.shrink(),
              onTap != null
                  ? InkWell(
                      onTap: onTap,
                      child: SvgPicture.asset(
                        !themeProvider.isDark
                            ? "assets/icons/rightarrowlight.svg"
                            : "assets/icons/rightarrowdark.svg",
                      ),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
        listView,
      ],
    );
  }
}
