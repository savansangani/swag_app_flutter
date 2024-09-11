import 'package:get/get.dart';
import 'package:swag_app_flutter/app/services/api_services.dart';
import 'package:swag_app_flutter/app/utils/helper.dart';
import 'package:swag_app_flutter/app/views/profile/create_account_view.dart';
import 'package:swag_app_flutter/app/views/profile/select_role_view.dart';

class SelectRoleController extends GetxController {
  RxInt selectedRole = 0.obs;
  String? role;
  RxBool isloding = true.obs;
  List<Role> roleList = [
    Role(
      title: "Fashion Enthusiast",
      subTitle: "Seek and personalize your fashion trends.",
      value: "fashion_enthusiast",
    ),
    Role(
      title: "Digital Tailor",
      subTitle: "Craft custom-fit garments a perfect fit.",
      value: "digital_tailor",
    ),
    Role(
      title: "Designer",
      subTitle: "Innovate fashion with unique designs.",
      value: "designer",
    ),
    Role(
      title: "Fashion Consultant",
      subTitle: "Offer personalized styling advice.",
      value: "fashion_consultant",
    ),
    Role(
      title: "Vendor",
      subTitle: "Provide essential fashion items.",
      value: "vendor",
    ),
  ];

  @override
  void onInit() {
    super.onInit();
    _init();
  }

  _init() async {
    await getUserRole();
  }

  void updateSelectedRole(int index) {
    selectedRole.value = index;
  }

  void onContinuePress() async {
    await setUserRole(role: roleList[selectedRole.value].value!);
  }

  Future<void> getUserRole() async {
    isloding;
    final response = await ApiService.getUserRole();
    if (response.statusCode == 200) {
      isloding.value = false;
      role = response.body?.role;
      var index =
          roleList.indexWhere((item) => item.title!.toLowerCase() == role);
      selectedRole.value = index != -1 ? index : 0;
      update();
    } else {
      isloding.value = false;
      Helper.showSnackBar(message: response.message!);
    }
  }

  Future<void> setUserRole({required String role}) async {
    isloding;
    final response = await ApiService.setUserRole(role: role);
    if (response.statusCode == 200) {
      isloding.value = false;
      Get.to(() => CreateAccountView());
      update();
    } else {
      isloding.value = false;
      Helper.showSnackBar(message: response.message!);
    }
  }
}
