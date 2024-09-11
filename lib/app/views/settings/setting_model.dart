class SettingModel {
  final String title;
  final Function()? onTap;
  final bool isDeleteAccount;

  SettingModel({
    required this.title,
    required this.onTap,
    this.isDeleteAccount = false,
  });
}
