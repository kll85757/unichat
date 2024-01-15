import 'package:flutter/material.dart';

import 'colors.dart';

class EthTheme {
  const EthTheme()
      : this._(
          brightness: Brightness.light,
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          primaryTextColor: const Color.fromARGB(255, 0, 119, 255),
          secondaryTextColor: const Color.fromARGB(255, 255, 255, 255),
          dividerColor: const Color.fromARGB(255, 59, 108, 255),
          highlightColor: const Color.fromARGB(255, 0, 17, 255),
        );

  const EthTheme._({
    required this.backgroundColor,
    required this.primaryTextColor,
    required this.secondaryTextColor,
    required this.brightness,
    required this.dividerColor,
    required this.highlightColor,
  });

  final Color backgroundColor;
  final Color primaryTextColor;
  final Color secondaryTextColor;
  final Brightness brightness;
  final Color dividerColor;
  final Color highlightColor;

  TextStyle get _baseTextStyle => const TextStyle(
        height: 1.25,
        color: EthColors.violetBlue,
      );

  ButtonStyle get _buttonStyle => ButtonStyle(
        animationDuration: Duration.zero,
        overlayColor: MaterialStateProperty.all(Colors.transparent), 
        padding: MaterialStateProperty.all(const EdgeInsets.all(8)),
        backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 0, 157, 255)),
        foregroundColor: MaterialStateProperty.all(EthColors.mimiPink),
        iconColor: MaterialStateProperty.all(EthColors.mimiPink),
      );

  ThemeData toMaterialTheme() => ThemeData(
        brightness: brightness,
        splashColor: Colors.transparent,
        textButtonTheme: TextButtonThemeData(style: _buttonStyle),
        textTheme: TextTheme(
          displayLarge: _baseTextStyle.copyWith(
            fontSize: 72,
            fontWeight: FontWeight.bold,
          ),
          displayMedium: _baseTextStyle.copyWith(
            fontSize: 42,
            fontWeight: FontWeight.w600,
          ),
          displaySmall: _baseTextStyle.copyWith(
            fontSize: 26,
            fontWeight: FontWeight.w700,
          ),
          headlineMedium: _baseTextStyle.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          titleMedium: _baseTextStyle.copyWith(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
          titleSmall: _baseTextStyle.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
          bodyLarge: _baseTextStyle.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
          bodyMedium: _baseTextStyle.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          bodySmall: _baseTextStyle.copyWith(
            fontSize: 12,
            fontWeight: FontWeight.normal,
          ),
          labelLarge: _baseTextStyle.copyWith(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        colorScheme: ColorScheme.light(
          brightness: brightness,
          primary: Color.fromARGB(255, 111, 212, 255),
          secondary: Color.fromARGB(255, 0, 187, 255),
          background: backgroundColor,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          titleTextStyle: _baseTextStyle.copyWith(
            fontSize: 17,
            color: Color.fromARGB(255, 0, 183, 255),
            fontWeight: FontWeight.bold,
            letterSpacing: .23,
          ),
          foregroundColor: const Color.fromARGB(255, 255, 255, 255),
        ),
        canvasColor: backgroundColor,
        scaffoldBackgroundColor: backgroundColor,
        highlightColor: Color.fromARGB(255, 39, 175, 243),
        hintColor: const Color.fromARGB(255, 255, 255, 255),
        dividerColor: Color.fromARGB(255, 0, 114, 213),
      );
}
