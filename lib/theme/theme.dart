import 'dart:math' as math;

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemeScheme extends Equatable {
  AppThemeScheme() {
    kPrimaryBackgroundColor = Colors.white;
    kSecondaryBackgroundColor = const Color(0xffF7F7FF);

    kPrimaryBackgroundColorDark = const Color(0xff15202B);
    kSecondaryBackgroundColorDark = const Color(0xff192734);

    kerrorColor = const Color(0xffEA4B6B);

    kPrimaryColor = const Color(0xff4082f3);
    kPrimaryColorLight = const Color(0xff08B8D0);
    kSecondaryColor = const Color(0xff47dda2);
  }

  late final Color kPrimaryBackgroundColor;
  late final Color kSecondaryBackgroundColor;

  late final Color kPrimaryBackgroundColorDark;
  late final Color kSecondaryBackgroundColorDark;

  late final Color kerrorColor;

  late final Color kPrimaryColor;
  late final Color kPrimaryColorLight;
  late final Color kSecondaryColor;

  @override
  List<Object> get props {
    return [
      kPrimaryBackgroundColor,
      kSecondaryBackgroundColor,
      kPrimaryBackgroundColorDark,
      kSecondaryBackgroundColorDark,
      kerrorColor,
      kPrimaryColor,
      kSecondaryColor,
    ];
  }
}

class AppTheme {
  static ThemeData getTheme() {
    final baseTheme = ThemeData.dark();
    final scheme = AppThemeScheme();

    return baseTheme.copyWith(
      scaffoldBackgroundColor: scheme.kPrimaryBackgroundColorDark,
      backgroundColor: scheme.kSecondaryBackgroundColorDark,
      cardColor: scheme.kSecondaryBackgroundColorDark,
      canvasColor: scheme.kSecondaryBackgroundColorDark,
      // primaryColor: scheme.kPrimaryColor,
      // primaryColorLight: scheme.kPrimaryColorLight,
      // primaryColorDark: scheme.kSecondaryColor,
      bottomSheetTheme: baseTheme.bottomSheetTheme
          .copyWith(backgroundColor: scheme.kPrimaryBackgroundColorDark),
      bottomAppBarColor: scheme.kSecondaryBackgroundColorDark,
      dialogTheme: _getDialogTheme(baseTheme.dialogTheme, scheme),
      applyElevationOverlayColor: !false,
      textTheme: _getTextTheme(
          GoogleFonts.montserratTextTheme(baseTheme.textTheme), scheme),
      errorColor: scheme.kerrorColor,
      elevatedButtonTheme:
          _getElevatedButtonTheme(baseTheme.elevatedButtonTheme, scheme),
      outlinedButtonTheme:
          _getOutlinedButtonTheme(baseTheme.outlinedButtonTheme, scheme),
      buttonTheme:
          _getButtonTheme(baseTheme.buttonTheme, baseTheme.colorScheme, scheme),
      textButtonTheme: _getTextButtonTheme(baseTheme.textButtonTheme, scheme),
      disabledColor: Colors.grey.shade700,
      splashColor: scheme.kPrimaryColor.withOpacity(.5),
      highlightColor: scheme.kPrimaryColor.withOpacity(.2),
      indicatorColor: scheme.kSecondaryColor,
      timePickerTheme: baseTheme.timePickerTheme.copyWith(
        backgroundColor: scheme.kPrimaryBackgroundColorDark,
        dialBackgroundColor: scheme.kSecondaryBackgroundColorDark,
        dayPeriodColor: scheme.kSecondaryBackgroundColorDark,
        dayPeriodBorderSide: BorderSide.none,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32),
        ),
      ),
      popupMenuTheme: baseTheme.popupMenuTheme.copyWith(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        color: scheme.kSecondaryBackgroundColorDark,
      ),
      chipTheme: baseTheme.chipTheme.copyWith(
          backgroundColor: scheme.kPrimaryColor,
          labelStyle: _getTextTheme(
                  GoogleFonts.nunitoTextTheme(baseTheme.textTheme), scheme)
              .bodyText2
              ?.copyWith(color: Colors.white)),
      pageTransitionsTheme: const PageTransitionsTheme(builders: {
        TargetPlatform.android: ZoomPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      }),
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: Colors.accents[math.Random().nextInt(Colors.accents.length)],
        secondary: scheme.kSecondaryColor,
      ),
    );
  }

  static DialogTheme _getDialogTheme(
      DialogTheme baseTheme, AppThemeScheme scheme) {
    return baseTheme.copyWith(
        backgroundColor: scheme.kPrimaryBackgroundColorDark,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)));
  }

  static ButtonThemeData _getButtonTheme(ButtonThemeData baseTheme,
      ColorScheme buttonColorScheme, AppThemeScheme scheme) {
    return baseTheme.copyWith(
        highlightColor: scheme.kSecondaryColor,
        buttonColor: scheme.kPrimaryColor,
        colorScheme: buttonColorScheme.copyWith(secondary: Colors.white),
        textTheme: ButtonTextTheme.accent,
        splashColor: scheme.kSecondaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)));
  }

  static AppBarTheme _getAppBarTheme(
      AppBarTheme baseTheme, AppThemeScheme scheme,
      {TextTheme? textTheme, IconThemeData? iconTheme}) {
    return baseTheme.copyWith(
      elevation: 0,
      centerTitle: true,
      iconTheme: iconTheme,
      brightness: Brightness.dark,
      color: scheme.kPrimaryBackgroundColorDark,
      titleTextStyle: textTheme?.headline5,
    );
  }

  static TextTheme _getTextTheme(TextTheme baseTheme, AppThemeScheme scheme) {
    return baseTheme.copyWith(
      headline1: baseTheme.headline1?.copyWith(
        color: scheme.kPrimaryColor,
        fontSize: 35,
        fontWeight: FontWeight.normal,
      ),
      headline3: baseTheme.headline3?.copyWith(
        color: scheme.kPrimaryColor,
        fontSize: 70,
      ),
      headline4: baseTheme.headline4?.copyWith(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 25,
      ),
      headline5: baseTheme.headline5?.copyWith(
        fontSize: 22,
        fontWeight: FontWeight.w400,
        color: Colors.grey.shade200,
      ),
      headline6: baseTheme.headline6?.copyWith(
        fontSize: 20,
        color: Colors.grey.shade400,
      ),
      subtitle1: baseTheme.subtitle1?.copyWith(
        fontSize: 18,
      ),
      bodyText2: baseTheme.bodyText2?.copyWith(
        color: Colors.grey.shade300,
      ),
      bodyText1: baseTheme.bodyText1?.copyWith(
        color: Colors.grey.shade200,
        fontSize: 15,
        fontWeight: FontWeight.w600,
      ),
      caption: baseTheme.caption?.copyWith(
        color: Colors.grey.shade300,
        fontSize: 15,
      ),
      overline: baseTheme.caption?.copyWith(
        color: Colors.grey.shade100,
        fontSize: 15,
        fontWeight: FontWeight.normal,
      ),
      button: baseTheme.button?.copyWith(
        fontWeight: FontWeight.w400,
        fontSize: 18,
      ),
    );
  }

  static ElevatedButtonThemeData _getElevatedButtonTheme(
      ElevatedButtonThemeData? baseTheme, AppThemeScheme scheme) {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: scheme.kPrimaryColor,
        onPrimary: Colors.white,
        shape: const StadiumBorder(),
      ),
    );
  }

  static OutlinedButtonThemeData _getOutlinedButtonTheme(
      OutlinedButtonThemeData? baseTheme, AppThemeScheme scheme) {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: scheme.kPrimaryColor),
        primary: scheme.kPrimaryColor,
        shape: const StadiumBorder(),
      ),
    );
  }

  static TextButtonThemeData _getTextButtonTheme(
      TextButtonThemeData? baseTheme, AppThemeScheme scheme) {
    return TextButtonThemeData(
      style: ElevatedButton.styleFrom(
        onPrimary: scheme.kPrimaryColor,
        shape: const StadiumBorder(),
      ),
    );
  }
}
