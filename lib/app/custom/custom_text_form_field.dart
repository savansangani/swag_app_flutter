import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:swag_app_flutter/app/theme/colors.dart';

import '../services/theme_provider.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.hintText,
    this.labelText,
    this.keyboardType,
    this.obscureText,
    this.maxLine,
    this.suffixIcon,
    this.prefixIcon,
    this.controller,
    this.focusNode,
    this.inputFormatters,
    this.readOnly = false,
    this.onTap,
    this.onChanged,
    this.onSaved,
    this.validator,
    this.outLine = false,
    this.fillColor,
    this.style,
    this.onFieldSubmitted,
    this.textInputAction,
  });

  final String? hintText;
  final TextStyle? style;
  final String? labelText;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final bool outLine;
  final int? maxLine;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? inputFormatters;
  final bool readOnly;
  final Function()? onTap;
  final Function(String)? onChanged;
  final Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final Function(String)? onFieldSubmitted;
  final Color? fillColor;
  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return TextFormField(
      textInputAction: textInputAction,
      onFieldSubmitted: onFieldSubmitted,
      controller: controller,
      focusNode: focusNode,
      obscureText: obscureText ?? false,
      obscuringCharacter: '●',
      maxLines: maxLine ?? 1,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: Get.textTheme.titleMedium!.copyWith(
          color:
              themeProvider.isDark ? Colorz.textVioletGrey : Colorz.secondary,
          fontWeight: FontWeight.w500,
        ),
        labelText: labelText,
        labelStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: Colorz.textVioletGrey,
            ),
        border: Theme.of(context).inputDecorationTheme.border,
        enabledBorder: Theme.of(context).inputDecorationTheme.border,
        focusedBorder: Theme.of(context).inputDecorationTheme.border,
        fillColor: fillColor ??
            (themeProvider.isDark
                ? Colorz.textFormFieldDark
                : Colorz.primaryBackground),
        filled: true,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        prefixStyle: const TextStyle(fontSize: 10),
      ),
      style: style ??
          Get.textTheme.titleMedium!.copyWith(
            fontWeight: FontWeight.w500,
            color: themeProvider.isDark ? Colorz.textWhite : Colorz.secondary,
          ),
      readOnly: readOnly,
      onTap: onTap,
      onChanged: onChanged,
      onSaved: onSaved,
      validator: validator,
      onTapOutside: (event) {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
    );
  }
}
