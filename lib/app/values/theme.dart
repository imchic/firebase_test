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
  static const String fontName = 'NanumSquare';

  bool get isDarkMode => Get.find<AppController>().isDarkMode.value;

  static const TextTheme textTheme = TextTheme(
    headline1: TextStyle(
      fontFamily: fontName,
      fontWeight: FontWeight.w700,
      fontSize: 96,
      letterSpacing: -1.5,
      //color: darkText,
    ),
    headline2: TextStyle(
      fontFamily: fontName,
      fontWeight: FontWeight.w700,
      fontSize: 60,
      letterSpacing: -0.5,
      //color: darkText,
    ),
    headline3: TextStyle(
      fontFamily: fontName,
      fontWeight: FontWeight.w700,
      fontSize: 48,
      //color: darkText,
    ),
    headline4: TextStyle(
      fontFamily: fontName,
      fontWeight: FontWeight.w700,
      fontSize: 34,
      letterSpacing: 0.25,
      //color: darkText,
    ),
    headline5: TextStyle(
      fontFamily: fontName,
      fontWeight: FontWeight.w700,
      fontSize: 24,
      //color: darkText,
    ),
    headline6: TextStyle(
      fontFamily: fontName,
      fontWeight: FontWeight.w700,
      fontSize: 20,
      letterSpacing: 0.15,
      //color: darkText,
    ),
    subtitle1: TextStyle(
      fontFamily: fontName,
      fontWeight: FontWeight.w700,
      fontSize: 16,
      letterSpacing: 0.15,
      //color: darkText,
    ),
    subtitle2: TextStyle(
      fontFamily: fontName,
      fontWeight: FontWeight.w700,
      fontSize: 14,
      letterSpacing: 0.1,
      //color: darkText,
    ),
    bodyText1: TextStyle(
      fontFamily: fontName,
      fontWeight: FontWeight.w400,
      fontSize: 16,
      letterSpacing: 0.5,
      //color: darkText,
    ),
    bodyText2: TextStyle(
      fontFamily: fontName,
      fontWeight: FontWeight.w400,
      fontSize: 14,
      letterSpacing: 0.25,
      //color: darkText,
    ),
    button: TextStyle(
      fontFamily: fontName,
      fontWeight: FontWeight.w700,
      fontSize: 14,
      letterSpacing: 1.25,
      //color: darkText,
    ),
    caption: TextStyle(
      fontFamily: fontName,
      fontWeight: FontWeight.w400,
      fontSize: 12,
      letterSpacing: 0.4,
      //color: darkText,
    ),
    overline: TextStyle(
      fontFamily: fontName,
      fontWeight: FontWeight.w400,
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

  static final lightTheme = ThemeData(
      textTheme: _buildTextTheme(ThemeData.light().textTheme),
      colorScheme: ColorScheme.light().copyWith(
        brightness: Brightness.light,
        primary: Color(0xFF0056D2),
        onPrimary: Color(0xFFFFFFFF),
        primaryContainer: Color(0xFFDAE2FF),
        onPrimaryContainer: Color(0xFF001847),
        secondary: Color(0xFF006874),
        onSecondary: Color(0xFFFFFFFF),
        secondaryContainer: Color(0xFF97F0FF),
        onSecondaryContainer: Color(0xFF001F24),
        tertiary: Color(0xFF0D61A4),
        onTertiary: Color(0xFFFFFFFF),
        tertiaryContainer: Color(0xFFD2E4FF),
        onTertiaryContainer: Color(0xFF001C37),
        error: Color(0xFFBA1A1A),
        errorContainer: Color(0xFFFFDAD6),
        onError: Color(0xFFFFFFFF),
        onErrorContainer: Color(0xFF410002),
        background: Color(0xFFFFFBFF),
        onBackground: Color(0xFF311300),
        surface: Color(0xFFFFFBFF),
        onSurface: Color(0xFF311300),
        surfaceVariant: Color(0xFFE1E2EC),
        onSurfaceVariant: Color(0xFF45464F),
        outline: Color(0xFF757780),
        onInverseSurface: Color(0xFFFFEDE4),
        inverseSurface: Color(0xFF512400),
        inversePrimary: Color(0xFFB2C5FF),
        shadow: Color(0xFF000000),
        surfaceTint: Color(0xFF0056D2),
      )
  );

  static final darkTheme = ThemeData(
      textTheme: _buildTextTheme(ThemeData.dark().textTheme),
      colorScheme: ColorScheme.dark().copyWith(
        brightness: Brightness.dark,
        primary: Color(0xFFB2C5FF),
        onPrimary: Color(0xFF002C72),
        primaryContainer: Color(0xFF0040A1),
        onPrimaryContainer: Color(0xFFDAE2FF),
        secondary: Color(0xFF4FD8EB),
        onSecondary: Color(0xFF00363D),
        secondaryContainer: Color(0xFF004F58),
        onSecondaryContainer: Color(0xFF97F0FF),
        tertiary: Color(0xFFA0C9FF),
        onTertiary: Color(0xFF00325A),
        tertiaryContainer: Color(0xFF00487F),
        onTertiaryContainer: Color(0xFFD2E4FF),
        error: Color(0xFFFFB4AB),
        errorContainer: Color(0xFF93000A),
        onError: Color(0xFF690005),
        onErrorContainer: Color(0xFFFFDAD6),
        background: Color(0xFF311300),
        onBackground: Color(0xFFFFDBC7),
        surface: Color(0xFF311300),
        onSurface: Color(0xFFFFDBC7),
        surfaceVariant: Color(0xFF45464F),
        onSurfaceVariant: Color(0xFFC5C6D0),
        outline: Color(0xFF8F909A),
        onInverseSurface: Color(0xFF311300),
        inverseSurface: Color(0xFFFFDBC7),
        inversePrimary: Color(0xFF0056D2),
        shadow: Color(0xFF000000),
        surfaceTint: Color(0xFFB2C5FF),
      ));
}
