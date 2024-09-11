import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swag_app_flutter/app/theme/colors.dart';

class CustomSwitch extends StatelessWidget {
  final bool value;
  final Function(bool value) onChanged;

  const CustomSwitch({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25,
      child: CupertinoSwitch(
        value: value,
        activeColor: Colorz.main,
        thumbColor: Colors.white,
        onChanged: onChanged,
      ),
    );
  }
}
