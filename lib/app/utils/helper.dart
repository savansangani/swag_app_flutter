import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swag_app_flutter/app/custom/custom_icon.dart';
import 'package:swag_app_flutter/app/custom/custom_single_child_scoll_view.dart';
import 'package:swag_app_flutter/app/theme/colors.dart';

class Helper {
  static showSnackBar({
    required String message,
    String? title,
    int duration = 3,
    GlobalKey? key,
    Color color = Colors.red,
  }) {
    Get.snackbar(
      color == Colors.red ? "Error:" : "Message:",
      message,
      messageText: Text(
        message,
        style: Get.textTheme.titleMedium!.copyWith(color: Colorz.textWhite),
      ),
      titleText: Text(
        color == Colors.red ? "Error:" : "Message:",
        style: Get.textTheme.titleLarge!.copyWith(
            color: Colorz.textWhite, fontSize: 18, fontWeight: FontWeight.w800),
      ),
      backgroundColor: color,
      duration: Duration(seconds: duration),
    );
  }

  static bool _isLoading = false;
  static showLoading() {
    _isLoading = true;

    return Get.dialog(
      barrierDismissible: false,
      const PopScope(
        canPop: false,
        child: Center(
          child: CircularProgressIndicator(
            color: Colorz.main,
          ),
        ),
      ),
    );
  }

  static hideLoading() {
    if (_isLoading) {
      Get.back();
    }
  }

  static Future<T?> showCustomDialog<T>({
    String? icon,
    Widget? iconChild,
    String? title,
    List<Widget>? children,
    Widget? action,
    bool? isHideCloseButton,
    Function? closeButton,
  }) async {
    final Size displaySize = Get.size;
    Brightness theme = MediaQuery.of(Get.context!).platformBrightness;
    return await Get.dialog(
      AlertDialog(
        backgroundColor: Colors.transparent,
        contentPadding: EdgeInsets.zero,
        content: Container(
          width: displaySize.width > 750
              ? displaySize.width * 0.5
              : displaySize.width * 0.8,
          decoration: BoxDecoration(
            border: Border.all(
              width: 0.5,
              color: Colorz.main,
            ),
            borderRadius: BorderRadius.circular(30.0),
            color: theme == Brightness.light
                ? Colorz.primaryBackground
                : Colorz.textBlack,
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20.0,
                  horizontal: 40.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (icon != null)
                          CustomIcon(
                            icon: icon,
                            color: Colorz.textPrimary,
                          ),
                        if (iconChild != null) iconChild,
                        const SizedBox(
                          width: 10.0,
                        ),
                        if (title != null)
                          Text(
                            title,
                            style: Get.textTheme.titleMedium!.copyWith(
                              color: theme == Brightness.light
                                  ? Colorz.textPrimary
                                  : Colorz.textWhite,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Flexible(
                      child: CustomSingleChildScrollView(
                        child: Column(
                          children: children ?? [],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    if (action != null) action,
                  ],
                ),
              ),
              isHideCloseButton == true
                  ? const SizedBox()
                  : Positioned(
                      top: 12.0,
                      right: 6.0,
                      child: IconButton(
                        icon: const Icon(
                          Icons.close,
                          color: Colorz.main,
                        ),
                        onPressed: () {
                          if (closeButton != null) {
                            closeButton();
                          } else {
                            Get.back();
                          }
                        },
                      ),
                    ),
            ],
          ),
        ),
      ),
      barrierColor: Colors.black87,
      barrierDismissible: false,
    );
  }
}
