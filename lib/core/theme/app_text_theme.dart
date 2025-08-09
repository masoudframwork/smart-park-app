import 'package:aml_client/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextTheme {
  AppTextTheme._();

  static TextStyle dataTextStyle({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    bool? isLight,
  }) {
    return GoogleFonts.inter(
      fontSize: fontSize ?? 14,
      fontWeight: fontWeight ?? FontWeight.w400,
      color:
          color ??
          (isLight == false ? AppColor.neutralDarkDark : AppColor.neutralDark),
      letterSpacing: 0.25,
    );
  }

  static TextTheme buildTextTheme({required bool isLight}) {
    final Color textHighEmphasis = isLight
        ? AppColor.neutralDark
        : AppColor.neutralDarkDark;
    final Color textMediumEmphasis = isLight
        ? AppColor.neutralMedium
        : AppColor.neutralMediumDark;
    final Color textDisabled = isLight
        ? AppColor.neutralMedium.withValues(alpha: 0.6)
        : AppColor.neutralMediumDark.withValues(alpha: 0.6);

    return TextTheme(
      // Display styles for large headings
      displayLarge: GoogleFonts.inter(
        fontSize: 57,
        fontWeight: FontWeight.w700,
        color: textHighEmphasis,
        letterSpacing: -0.25,
        height: 1.12,
      ),
      displayMedium: GoogleFonts.inter(
        fontSize: 45,
        fontWeight: FontWeight.w700,
        color: textHighEmphasis,
        letterSpacing: 0,
        height: 1.16,
      ),
      displaySmall: GoogleFonts.inter(
        fontSize: 36,
        fontWeight: FontWeight.w600,
        color: textHighEmphasis,
        letterSpacing: 0,
        height: 1.22,
      ),

      // Headline styles for section headers
      headlineLarge: GoogleFonts.inter(
        fontSize: 32,
        fontWeight: FontWeight.w600,
        color: textHighEmphasis,
        letterSpacing: 0,
        height: 1.25,
      ),
      headlineMedium: GoogleFonts.inter(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        color: textHighEmphasis,
        letterSpacing: 0,
        height: 1.29,
      ),
      headlineSmall: GoogleFonts.inter(
        fontSize: 24,
        fontWeight: FontWeight.w500,
        color: textHighEmphasis,
        letterSpacing: 0,
        height: 1.33,
      ),

      // Title styles for cards and dialogs
      titleLarge: GoogleFonts.inter(
        fontSize: 22,
        fontWeight: FontWeight.w500,
        color: textHighEmphasis,
        letterSpacing: 0,
        height: 1.27,
      ),
      titleMedium: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: textHighEmphasis,
        letterSpacing: 0.15,
        height: 1.50,
      ),
      titleSmall: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: textHighEmphasis,
        letterSpacing: 0.1,
        height: 1.43,
      ),

      bodyLarge: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: textHighEmphasis,
        letterSpacing: 0.5,
        height: 1.50,
      ),
      bodyMedium: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: textHighEmphasis,
        letterSpacing: 0.25,
        height: 1.43,
      ),
      bodySmall: GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: textMediumEmphasis,
        letterSpacing: 0.4,
        height: 1.33,
      ),

      labelLarge: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: textHighEmphasis,
        letterSpacing: 0.1,
        height: 1.43,
      ),
      labelMedium: GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: textMediumEmphasis,
        letterSpacing: 0.5,
        height: 1.33,
      ),
      labelSmall: GoogleFonts.inter(
        fontSize: 11,
        fontWeight: FontWeight.w500,
        color: textDisabled,
        letterSpacing: 0.5,
        height: 1.45,
      ),
    );
  }

  static Color getTextColor(BuildContext context, {bool isSecondary = false}) {
    final brightness = Theme.of(context).brightness;
    if (isSecondary) {
      return brightness == Brightness.light
          ? AppColor.neutralMedium
          : AppColor.neutralMediumDark;
    }
    return brightness == Brightness.light
        ? AppColor.neutralDark
        : AppColor.neutralDarkDark;
  }

  static Color getSurfaceColor(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return brightness == Brightness.light
        ? AppColor.pureWhite
        : AppColor.surfaceDark;
  }

  static Color getBorderColor(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return brightness == Brightness.light
        ? AppColor.borderLight
        : AppColor.borderDark;
  }
}
