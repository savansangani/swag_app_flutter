import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title,
    this.actions,
    this.backgroundColor,
    this.backButton = true,
    this.centerTitle = true,
  });

  final String? title;
  final List<Widget>? actions;
  final bool backButton;
  final bool centerTitle;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: centerTitle,
      backgroundColor: backgroundColor,
      leading: backButton
          ? IconButton(
              icon: SvgPicture.asset("assets/icons/backArrow.svg"),
              highlightColor: Colors.transparent,
              onPressed: () => Get.back(),
            )
          : const SizedBox.shrink(),
      title: title != null ? Text(title!) : null,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
