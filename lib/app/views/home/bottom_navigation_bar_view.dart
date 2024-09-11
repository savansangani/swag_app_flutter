import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:swag_app_flutter/app/theme/colors.dart';
import 'package:swag_app_flutter/app/utils/app_data_service.dart';
import 'package:swag_app_flutter/app/views/home/bottom_navigation_bar_controller.dart';
import 'package:swag_app_flutter/app/views/catelogue_screen/catelogues_view.dart';
import 'package:swag_app_flutter/app/views/outfits_screen/outfits_view.dart';
import 'package:swag_app_flutter/app/views/swag_centre_screen/swag_centre_view.dart';
import 'package:swag_app_flutter/app/views/try_on_screen/try_on_view.dart';

import '../../services/theme_provider.dart';

class BottomNavigationBarView extends StatelessWidget {
  BottomNavigationBarView({super.key});

  final controller = Get.put(BottomNavigationBarController());

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
        extendBody: true,
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: !themeProvider.isDark
                      ? Colorz.appleButton.withOpacity(0.05)
                      : Colorz.violetGrey.withOpacity(0.05),
                  blurRadius: 4,
                  offset: const Offset(0, -4)),
            ],
            color: themeProvider.isDark
                ? Colorz.dark
                : Colorz.primaryBackground,
          ),
          height: kBottomNavigationBarHeight +
              MediaQuery.of(context).padding.bottom * 1.5,
          width: double.infinity,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _buildIcon(
                0,
                "assets/icons/swag.svg",
                "assets/icons/swagd.svg",
                "assets/icons/swaglight.svg",
                "assets/icons/swagdark.svg",
                themeProvider,
              ),
              _buildIcon(
                1,
                "assets/icons/tryon.svg",
                "assets/icons/tryond.svg",
                "assets/icons/tryonlight.svg",
                "assets/icons/tryondark.svg",
                themeProvider,
              ),
              _buildIcon(
                2,
                "assets/icons/outfits.svg",
                "assets/icons/outfitsd.svg",
                "assets/icons/outfitslight.svg",
                "assets/icons/outfitsdark.svg",
                themeProvider,
              ),
              _buildIcon(
                3,
                "assets/icons/catelogue.svg",
                "assets/icons/catelogued.svg",
                "assets/icons/cateloguelight.svg",
                "assets/icons/cateloguedark.svg",
                themeProvider,
              ),
            ],
          ),
        ),
        body: Obx(
          () => IndexedStack(
            index: controller.selectedIndex.value,
            children: [
              ShowCaseWidget(
                builder: (context) {
                  appDataService.context = context;
                  return const SwagCentreView();
                },
              ),
              const TryOnView(),
              const OutFitsView(),
              const CatelogueView(),
            ],
          ),
        ));
  }

  InkWell _buildIcon(int index, String activeIcon, String activedarkIcon,
      String lightIcon, String darkIcon, theme) {
    return InkWell(
      onTap: () {
        controller.selectedIndex.value = index;
      },
      child: Obx(
        () => SvgPicture.asset(
          height: 35,
          width: 35,
          controller.selectedIndex.value == index
              ? (!theme.isDark ? activeIcon : activedarkIcon)
              : (!theme.isDark ? lightIcon : darkIcon),
        ),
      ),
    );
  }
}
