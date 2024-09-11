import 'package:get/get.dart';
import 'package:flutter/widgets.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:swag_app_flutter/app/utils/app_data_service.dart';

class SwagCentreController extends GetxController {
  GlobalKey showcaseKey1 = GlobalKey();
  GlobalKey showcaseKey2 = GlobalKey();
  GlobalKey showcaseKey3 = GlobalKey();
  GlobalKey showcaseKey4 = GlobalKey();

  @override
  void onReady() {
    super.onReady();

    if (appDataService.context != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
          ShowCaseWidget.of(appDataService.context!).startShowCase([showcaseKey1, showcaseKey2, showcaseKey3, showcaseKey4]);
        },
      );
    }
  }
}
