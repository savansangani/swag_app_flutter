import 'package:flutter/material.dart';
import 'package:swag_app_flutter/app/theme/colors.dart';

ThemeData buildLightThemeData(BuildContext context) {
  return ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: Colorz.light,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    canvasColor: Colorz.light,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: Colorz.light,
      onPrimary: Colorz.light,
      secondary: Colorz.textBlack,
      onSecondary: Colors.transparent,
      primaryContainer: Colors.transparent,
      error: Colors.transparent,
      onError: Colors.transparent,
      surface: Colorz.primaryBackground,
      onSurface: Colorz.textBlack,
    ),
    appBarTheme: AppBarTheme(
      surfaceTintColor: Colors.transparent,
      backgroundColor: Colorz.light,
      elevation: 0.0,
      iconTheme: const IconThemeData(
        color: Colorz.main,
      ),
      titleSpacing: double.minPositive,
      titleTextStyle: Theme.of(context).textTheme.headlineSmall!.copyWith(
            color: Colorz.main,
            fontWeight: FontWeight.w700,
          ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colorz.light,
      selectedItemColor: Colorz.main,
      unselectedItemColor: Colorz.secondary,
      selectedIconTheme: IconThemeData(color: Colorz.main),
      showUnselectedLabels: true,
      elevation: 0.0,
      type: BottomNavigationBarType.fixed,
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        shape: WidgetStateProperty.all(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(5.0),
            ),
          ),
        ),
      ),
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: Colorz.main,
      selectionColor: Colorz.textSecondary,
      selectionHandleColor: Colorz.main,
    ),
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(24.0),
        borderSide: BorderSide(
          color: Colorz.formBorder,
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(24.0),
        borderSide: BorderSide(
          color: Colorz.formBorder,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(24.0),
        borderSide: BorderSide(
          color: Colorz.formBorder,
        ),
      ),
    ),
    // textTheme: GoogleFonts.montserratTextTheme().copyWith(),
    fontFamily: "Montserrat",
  );
}

ThemeData buildDarkThemeData(BuildContext context) {
  return ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: Colorz.dark,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    canvasColor: Colorz.dark,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: Colorz.dark,
      onPrimary: Colorz.dark,
      secondary: Colorz.textWhite,
      onSecondary: Colors.transparent,
      primaryContainer: Colors.transparent,
      error: Colors.transparent,
      onError: Colors.transparent,
      surface: Colors.black,
      onSurface: Colors.white,
    ),
    appBarTheme: AppBarTheme(
      centerTitle: false,
      backgroundColor: Colorz.dark,
      elevation: 0.0,
      iconTheme: const IconThemeData(
        color: Colorz.main,
      ),
      titleSpacing: double.minPositive,
      titleTextStyle: Theme.of(context).textTheme.headlineSmall!.copyWith(
            color: Colorz.main,
            fontWeight: FontWeight.w700,
          ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colorz.dark,
      selectedItemColor: Colorz.main,
      selectedIconTheme: const IconThemeData(color: Colorz.main),
      unselectedItemColor: Colorz.textSecondary,
      showUnselectedLabels: true,
      elevation: 0.0,
      type: BottomNavigationBarType.fixed,
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        shape: WidgetStateProperty.all(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(24.0),
            ),
          ),
        ),
      ),
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: Colorz.main,
      selectionColor: Colorz.textSecondary,
      selectionHandleColor: Colorz.main,
    ),
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(24.0),
        borderSide: BorderSide(
          color: Colorz.formBorder,
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(24.0),
        borderSide: BorderSide(
          color: Colorz.formBorder,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(24.0),
        borderSide: BorderSide(
          color: Colorz.formBorder,
        ),
      ),
    ),
    // textTheme: GoogleFonts.montserratTextTheme().copyWith(),
    fontFamily: "Montserrat",
  );
}
