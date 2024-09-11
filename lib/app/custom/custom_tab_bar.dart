import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:swag_app_flutter/app/theme/colors.dart';

import '../services/theme_provider.dart';

class CustomTabBar extends StatelessWidget {
  final List<TabItem> tabs;
  final int tabLength;
  final EdgeInsetsGeometry? padding;
  const CustomTabBar({
    super.key,
    required this.tabs,
    required this.tabLength,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return DefaultTabController(
      length: tabLength,
      child: Padding(
        padding: padding ?? EdgeInsets.zero,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.06,
          decoration: BoxDecoration(
            color: !themeProvider.isDark
                ? Colorz.formBorder
                : Colorz.violet.withOpacity(0.4),
            borderRadius: BorderRadius.circular(40),
          ),
          child: TabBar(
            labelPadding: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            indicatorPadding: EdgeInsets.zero,
            indicatorWeight: 0,
            dividerColor: Colors.transparent,
            indicator: BoxDecoration(
              color: !themeProvider.isDark
                  ? Colorz.primaryBackground
                  : Colorz.main.withOpacity(0.6),
              borderRadius: BorderRadius.circular(40),
              boxShadow: [
                BoxShadow(
                  color: Colorz.tabButtonShadow,
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                )
              ],
            ),
            tabs: [
              ...tabs.map(
                (e) => Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      e.icon != null
                          ? Icon(
                              e.icon,
                              color: Colors.red,
                            )
                          : const SizedBox.shrink(),
                      const SizedBox(width: 5),
                      Text(
                        e.title,
                        style: Get.textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.w500,
                          color: !themeProvider.isDark
                              ? Colorz.main
                              : Colorz.violetGrey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TabItem {
  final String title;
  final IconData? icon;
  // final Widget? widget;
  const TabItem({required this.title, this.icon});
}
