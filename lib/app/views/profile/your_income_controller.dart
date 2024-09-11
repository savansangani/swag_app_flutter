import 'package:get/get.dart';
import 'package:swag_app_flutter/app/services/api_services.dart';
import 'package:swag_app_flutter/app/utils/helper.dart';
import 'package:swag_app_flutter/app/views/profile/location_view.dart';
import 'package:swag_app_flutter/app/views/profile/year_income_view.dart';

class YearIncomeController extends GetxController {
  String? gender;
  YearIncomeController({required this.gender});
  RxInt selectedRange = 0.obs;
  RxBool isloding = true.obs;
  String? income;

  List<Income> incomeList = [
    Income(
      amount: "\$10,000 - \$30,000",
      year: "Per year",
    ),
    Income(
      amount: "\$30,000 - \$45,000",
      year: "Per year",
    ),
    Income(
      amount: "\$45,000 - \$75,000",
      year: "Per year",
    ),
    Income(
      amount: "\$75,000 - \$120,000",
      year: "Per year",
    ),
    Income(
      amount: "\$120,000 - \$300,000+",
      year: "Per year",
    ),
  ];

  @override
  void onInit() {
    super.onInit();
    _init();
  }

  _init() async {
    await getUserIncome();
  }

  updateSelectedRange(int index) {
    selectedRange.value = index;
  }

  void onContinuePress() async {
    await setUserIncome(income: incomeList[selectedRange.value].amount!);
  }

  Future<void> getUserIncome() async {
    isloding;
    final response = await ApiService.getUserIncome();
    if (response.statusCode == 200) {
      isloding.value = false;
      income = response.body?.income;
      var index =
          incomeList.indexWhere((item) => item.amount!.toLowerCase() == income);
      selectedRange.value = index != -1 ? index : 0;
      update();
    } else {
      isloding.value = false;
      Helper.showSnackBar(message: response.message!);
    }
  }

  Future<void> setUserIncome({required String income}) async {
    isloding;
    final response = await ApiService.setUserIncome(income: income);
    if (response.statusCode == 200) {
      isloding.value = false;
      Get.to(() => LocationView(), arguments: gender);
      update();
    } else {
      isloding.value = false;
      Helper.showSnackBar(message: response.message!);
    }
  }
}
