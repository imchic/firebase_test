import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/app_controller.dart';

class AppTheme {
  AppTheme._();

  static const Color notWhite = Color(0xFFEDF0F2);
  static const Color nearlyWhite = Color(0xFFFEFEFE);
  static const Color white = Color(0xFFFFFFFF);
  static const Color nearlyBlack = Color(0xFF213333);
  static const Color grey = Color(0xFF3A5160);
  static const Color darkGrey = Color(0xFF313A44);

  static const Color darkText = Color(0xFF253840);
  static const Color darkerText = Color(0xFF17262A);
  static const Color lightText = Color(0xFF4A6572);
  static const Color deactivatedText = Color(0xFF767676);
  static const Color dismissibleBackground = Color(0xFF364A54);
  static const Color chipBackground = Color(0xFFEEF1F3);
  static const Color spacer = Color(0xFFF2F2F2);
  //static const String fontName = 'NanumSquare';
  static const String fontName = 'Pretendard';

  static const TextTheme textTheme = TextTheme(
    headline1: TextStyle(
      fontFamily: fontName,
      fontSize: 96,
      letterSpacing: -1.5,
      //color: Get.isDarkMode ? Colors.white : darkText,
    ),
    headline2: TextStyle(
      fontFamily: fontName,
      fontSize: 60,
      letterSpacing: -0.5,
      //color: darkText,
    ),
    headline3: TextStyle(
      fontFamily: fontName,
      fontSize: 48,
      //color: darkText,
    ),
    headline4: TextStyle(
      fontFamily: fontName,
      fontSize: 34,
      letterSpacing: 0.25,
      //color: darkText,
    ),
    headline5: TextStyle(
      fontFamily: fontName,
      fontSize: 24,
      //color: darkText,
    ),
    headline6: TextStyle(
      fontFamily: fontName,
      fontSize: 20,
      letterSpacing: 0.15,
      //color: darkText,
    ),
    subtitle1: TextStyle(
      fontFamily: fontName,
      fontSize: 16,
      letterSpacing: 0.15,
      //color: darkText,
    ),
    subtitle2: TextStyle(
      fontFamily: fontName,
      fontSize: 14,
      letterSpacing: 0.1,
      //color: darkText,
    ),
    bodyText1: TextStyle(
      fontFamily: fontName,
      fontSize: 16,
      letterSpacing: 0.5,
      //color: darkText,
    ),
    bodyText2: TextStyle(
      fontFamily: fontName,
      fontSize: 14,
      letterSpacing: 0.25,
      //color: darkText,
    ),
    button: TextStyle(
      fontFamily: fontName,
      fontSize: 14,
      letterSpacing: 1.25,
      //color: darkText,
    ),
    caption: TextStyle(
      fontFamily: fontName,
      fontSize: 12,
      letterSpacing: 0.4,
      //color: darkText,
    ),
    overline: TextStyle(
      fontFamily: fontName,
      fontSize: 12,
      letterSpacing: 1.5,
      //color: darkText,
    ),
  );

  static TextTheme _buildTextTheme(TextTheme base) {
    return base.copyWith(
      headline1: textTheme.headline1,
      headline2: textTheme.headline2,
      headline3: textTheme.headline3,
      headline4: textTheme.headline4,
      headline5: textTheme.headline5,
      headline6: textTheme.headline6,
      button: textTheme.button,
      caption: textTheme.caption,
      bodyText1: textTheme.bodyText1,
      bodyText2: textTheme.bodyText2,
      subtitle1: textTheme.subtitle1,
      subtitle2: textTheme.subtitle2,
      overline: textTheme.overline,
    );
  }

  // custom themeMode
  static ThemeMode get themeMode =>
      Get.isDarkMode ? ThemeMode.dark : ThemeMode.light;

  static final lightTheme = ThemeData(
      textTheme: _buildTextTheme(ThemeData.light().textTheme),
      colorScheme: ColorScheme.light().copyWith(
        brightness: Brightness.light,
        primary: Color(0xFF006877),
        onPrimary: Color(0xFFFFFFFF),
        primaryContainer: Color(0xFFA2EEFF),
        onPrimaryContainer: Color(0xFF001F25),
        secondary: Color(0xFF4A6268),
        onSecondary: Color(0xFFFFFFFF),
        secondaryContainer: Color(0xFFCDE7ED),
        onSecondaryContainer: Color(0xFF051F24),
        tertiary: Color(0xFF545D7E),
        onTertiary: Color(0xFFFFFFFF),
        tertiaryContainer: Color(0xFFDBE1FF),
        onTertiaryContainer: Color(0xFF101A37),
        error: Color(0xFFBA1A1A),
        errorContainer: Color(0xFFFFDAD6),
        onError: Color(0xFFFFFFFF),
        onErrorContainer: Color(0xFF410002),
        background: Color(0xFFFBFCFD),
        onBackground: Color(0xFF191C1D),
        surface: Color(0xFFFBFCFD),
        onSurface: Color(0xFF191C1D),
        surfaceVariant: Color(0xFFDBE4E7),
        onSurfaceVariant: Color(0xFF3F484A),
        outline: Color(0xFF6F797B),
        onInverseSurface: Color(0xFFEFF1F2),
        inverseSurface: Color(0xFF2E3132),
        inversePrimary: Color(0xFF52D7EF),
        shadow: Color(0xFF000000),
        surfaceTint: Color(0xFF006877),
      ));

  static final darkTheme = ThemeData(
      textTheme: _buildTextTheme(ThemeData.dark().textTheme),
      colorScheme: ColorScheme.dark().copyWith(
        brightness: Brightness.dark,
        primary: Color(0xFF52D7EF),
        onPrimary: Color(0xFF00363E),
        primaryContainer: Color(0xFF004E5A),
        onPrimaryContainer: Color(0xFFA2EEFF),
        secondary: Color(0xFFB1CBD1),
        onSecondary: Color(0xFF1C3439),
        secondaryContainer: Color(0xFF334A50),
        onSecondaryContainer: Color(0xFFCDE7ED),
        tertiary: Color(0xFFBCC5EB),
        onTertiary: Color(0xFF262F4D),
        tertiaryContainer: Color(0xFF3D4665),
        onTertiaryContainer: Color(0xFFDBE1FF),
        error: Color(0xFFFFB4AB),
        errorContainer: Color(0xFF93000A),
        onError: Color(0xFF690005),
        onErrorContainer: Color(0xFFFFDAD6),
        background: Color(0xFF191C1D),
        onBackground: Color(0xFFE1E3E3),
        surface: Color(0xFF191C1D),
        onSurface: Color(0xFFE1E3E3),
        surfaceVariant: Color(0xFF3F484A),
        onSurfaceVariant: Color(0xFFBFC8CB),
        outline: Color(0xFF899295),
        onInverseSurface: Color(0xFF191C1D),
        inverseSurface: Color(0xFFE1E3E3),
        inversePrimary: Color(0xFF006877),
        shadow: Color(0xFF000000),
        surfaceTint: Color(0xFF52D7EF),
      ));
}
