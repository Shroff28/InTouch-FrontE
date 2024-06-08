import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/src/widgets/shadow_border.dart';

import '../../base/utils/common_ui_methods.dart';
import '../../base/utils/constants/color_constant.dart';

ThemeData lightThemeData() {
  return ThemeData(
    useMaterial3: true,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      elevation: 10.0,
      foregroundColor: Colors.white,
      backgroundColor: primaryColor,
    ),
    popupMenuTheme: PopupMenuThemeData(
      color: Colors.white,
      textStyle: lightPopupMenuTextStyle(),
    ),
    radioTheme: RadioThemeData(
        fillColor: MaterialStateProperty.all<Color>(secondaryColor)),
    checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.all<Color>(secondaryColor)),
    bottomSheetTheme: const BottomSheetThemeData(backgroundColor: Colors.white),
    dialogTheme: const DialogTheme(
      backgroundColor: Colors.white,
      titleTextStyle: TextStyle(
        color: blackColor,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: DecoratedInputBorder(
        child: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
        ),
        shadow: BoxShadow(
          color: blackColor.withOpacity(0.5),
          blurRadius: 15,
        ),
      ),
      enabledBorder: DecoratedInputBorder(
        child: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
        ),
        shadow: BoxShadow(
          color: blackColor.withOpacity(0.5),
          blurRadius: 15,
        ),
      ),
      focusedBorder: DecoratedInputBorder(
        child: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
        ),
        shadow: BoxShadow(
          color: blackColor.withOpacity(0.5),
          blurRadius: 15,
        ),
      ),
      errorBorder: DecoratedInputBorder(
        child: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
        ),
        shadow: BoxShadow(
          color: blackColor.withOpacity(0.5),
          blurRadius: 15,
        ),
      ),
      disabledBorder: DecoratedInputBorder(
        child: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
        ),
        shadow: BoxShadow(
          color: blackColor.withOpacity(0.5),
          blurRadius: 15,
        ),
      ),
    ),
    scaffoldBackgroundColor: Colors.white,
    brightness: Brightness.light,
    primaryColor: primaryColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    fontFamily: 'EBGaramond',
  );
}

ThemeData darkThemeData() {
  return ThemeData(
    useMaterial3: true,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        elevation: 10.0,
        foregroundColor: Colors.white,
        backgroundColor: Colors.black45),
    popupMenuTheme: PopupMenuThemeData(
      color: Colors.black,
      textStyle: darkPopupMenuTextStyle(),
    ),
    radioTheme: RadioThemeData(
        fillColor: MaterialStateProperty.all<Color>(secondaryColor)),
    checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.all<Color>(secondaryColor)),
    bottomSheetTheme:
        const BottomSheetThemeData(backgroundColor: Colors.black45),
    dialogTheme: const DialogTheme(backgroundColor: Colors.black45),
    scaffoldBackgroundColor: Colors.black,
    brightness: Brightness.dark,
    primaryColor: Colors.black,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    fontFamily: 'EBGaramond',
  );
}
