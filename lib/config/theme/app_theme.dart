import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/config/constants/app_colors.dart';
import 'package:food_app/config/constants/app_fonts.dart';

class AppTheme {
  final bool isDarkMode;

  AppTheme({
    required this.isDarkMode,
  });

  ThemeData getTheme() => ThemeData(
        scaffoldBackgroundColor:
            isDarkMode ? AppColors.backgroundDark : AppColors.backgroundLight,
        useMaterial3: true,
      );

  static TextStyle heading1({Color? color}) {
    return TextStyle(
      fontFamily: AppFonts.dmSans,
      fontSize: 26,
      fontWeight: FontWeight.w600,
      color: color,
      height: 36 / 26,
      leadingDistribution: TextLeadingDistribution.even,
      letterSpacing: -0.5,
    );
  }

  static TextStyle heading2({Color? color}) {
    return TextStyle(
      fontFamily: AppFonts.dmSans,
      fontSize: 22,
      fontWeight: FontWeight.w600,
      color: color,
      height: 30 / 22,
      leadingDistribution: TextLeadingDistribution.even,
      letterSpacing: -0.5,
    );
  }

  static TextStyle heading3({Color? color}) {
    return TextStyle(
      fontFamily: AppFonts.mulish,
      fontSize: 22,
      fontWeight: FontWeight.w700,
      color: color,
      height: 30 / 22,
      leadingDistribution: TextLeadingDistribution.even,
    );
  }

  static TextStyle heading4({Color? color}) {
    return TextStyle(
      fontFamily: AppFonts.mulish,
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: color,
      height: 22 / 18,
      leadingDistribution: TextLeadingDistribution.even,
    );
  }

  static TextStyle heading5({Color? color}) {
    return TextStyle(
      fontFamily: AppFonts.mulish,
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: color,
      height: 22 / 16,
      leadingDistribution: TextLeadingDistribution.even,
    );
  }

  static TextStyle subtitle1({Color? color}) {
    return TextStyle(
      fontFamily: AppFonts.mulish,
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: color,
      height: 28 / 18,
      leadingDistribution: TextLeadingDistribution.even,
    );
  }

  static TextStyle subtitle2({Color? color}) {
    return TextStyle(
      fontFamily: AppFonts.mulish,
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: color,
      height: 26 / 16,
      leadingDistribution: TextLeadingDistribution.even,
    );
  }

  static TextStyle subtitle3({Color? color}) {
    return TextStyle(
      fontFamily: AppFonts.mulish,
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: color,
      height: 22 / 14,
      leadingDistribution: TextLeadingDistribution.even,
    );
  }

  static TextStyle body1({Color? color}) {
    return TextStyle(
      fontFamily: AppFonts.mulish,
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: color,
      height: 28 / 16,
      leadingDistribution: TextLeadingDistribution.even,
    );
  }

  static TextStyle body2({Color? color}) {
    return TextStyle(
      fontFamily: AppFonts.mulish,
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: color,
      height: 24 / 14,
      leadingDistribution: TextLeadingDistribution.even,
    );
  }

  static TextStyle caption1({Color? color}) {
    return TextStyle(
      fontFamily: AppFonts.mulish,
      fontSize: 15,
      fontWeight: FontWeight.w400,
      color: color,
      height: 24 / 15,
      leadingDistribution: TextLeadingDistribution.even,
    );
  }

  static TextStyle caption2({Color? color}) {
    return TextStyle(
      fontFamily: AppFonts.mulish,
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: color,
      height: 20 / 14,
      leadingDistribution: TextLeadingDistribution.even,
    );
  }

  static TextStyle caption3({Color? color}) {
    return TextStyle(
      fontFamily: AppFonts.mulish,
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: color,
      height: 22 / 12,
      leadingDistribution: TextLeadingDistribution.even,
    );
  }

  static TextStyle smallButton({Color? color}) {
    return TextStyle(
      fontFamily: AppFonts.mulish,
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: color,
      height: 22 / 14,
      leadingDistribution: TextLeadingDistribution.even,
    );
  }

  static TextStyle mediumButton({Color? color}) {
    return TextStyle(
      fontFamily: AppFonts.mulish,
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: color,
      height: 22 / 16,
      leadingDistribution: TextLeadingDistribution.even,
    );
  }

  static TextStyle extraButton({Color? color}) {
    return TextStyle(
      fontFamily: AppFonts.mulish,
      fontSize: 16,
      fontWeight: FontWeight.w800,
      color: color,
      height: 22 / 16,
      leadingDistribution: TextLeadingDistribution.even,
    );
  }

  static TextStyle priceSmall({Color? color}) {
    return TextStyle(
      fontFamily: AppFonts.mulish,
      fontSize: 14,
      fontWeight: FontWeight.w700,
      color: color,
      height: 20 / 14,
      leadingDistribution: TextLeadingDistribution.even,
    );
  }

  static TextStyle priceMedium({Color? color}) {
    return TextStyle(
      fontFamily: AppFonts.mulish,
      fontSize: 16,
      fontWeight: FontWeight.w800,
      color: color,
      height: 20 / 16,
      leadingDistribution: TextLeadingDistribution.even,
    );
  }

  static TextStyle priceLarge({Color? color}) {
    return TextStyle(
      fontFamily: AppFonts.mulish,
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: color,
      height: 20 / 24,
      leadingDistribution: TextLeadingDistribution.even,
    );
  }

  static TextStyle cardsDetailsSmall({Color? color}) {
    return TextStyle(
      fontFamily: AppFonts.mulish,
      fontSize: 12,
      fontWeight: FontWeight.w600,
      color: color,
      height: 16 / 12,
      leadingDistribution: TextLeadingDistribution.even,
    );
  }

  static TextStyle cardsDetailsLarge({Color? color}) {
    return TextStyle(
      fontFamily: AppFonts.mulish,
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: color,
      height: 20 / 14,
      leadingDistribution: TextLeadingDistribution.even,
    );
  }

  static TextStyle inputLabelIntern({Color? color}) {
    return TextStyle(
      fontFamily: AppFonts.mulish,
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: color,
      height: 14 / 12,
      leadingDistribution: TextLeadingDistribution.even,
    );
  }

  static TextStyle inputLabelDefault({Color? color}) {
    return TextStyle(
      fontFamily: AppFonts.mulish,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: color,
      height: 22 / 14,
      leadingDistribution: TextLeadingDistribution.even,
    );
  }

  static TextStyle inputLabelExternal({Color? color}) {
    return TextStyle(
      fontFamily: AppFonts.mulish,
      fontSize: 13,
      fontWeight: FontWeight.w600,
      color: color,
      height: 16 / 13,
      leadingDistribution: TextLeadingDistribution.even,
    );
  }

  static TextStyle inputLabelPlaceholder({Color? color}) {
    return TextStyle(
      fontFamily: AppFonts.mulish,
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: color,
      height: 18 / 14,
      leadingDistribution: TextLeadingDistribution.even,
    );
  }

  static TextStyle inputPlaceholderActive({Color? color}) {
    return TextStyle(
      fontFamily: AppFonts.mulish,
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: color,
      height: 18 / 14,
      leadingDistribution: TextLeadingDistribution.even,
    );
  }

  static TextStyle inputPlaceholderDefault({Color? color}) {
    return TextStyle(
      fontFamily: AppFonts.mulish,
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: color,
      height: 18 / 14,
      leadingDistribution: TextLeadingDistribution.even,
    );
  }
}

final isDarkModeProvider = StateProvider((ref) => false);
