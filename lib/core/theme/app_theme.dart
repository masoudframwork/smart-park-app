// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'app_color.dart';
// import 'app_text_theme.dart';

// class AppTheme {
//   AppTheme._();
//   static ThemeData lightTheme = ThemeData(
//     brightness: Brightness.light,
//     colorScheme: ColorScheme(
//       brightness: Brightness.light,
//       primary: AppColor.primaryBlue,
//       onPrimary: AppColor.pureWhite,
//       primaryContainer: AppColor.lightBlue,
//       onPrimaryContainer: AppColor.neutralDark,
//       secondary: AppColor.infoBlue,
//       onSecondary: AppColor.pureWhite,
//       secondaryContainer: AppColor.infoBlue.withValues(alpha: 0.1),
//       onSecondaryContainer: AppColor.neutralDark,
//       tertiary: AppColor.successGreen,
//       onTertiary: AppColor.pureWhite,
//       tertiaryContainer: AppColor.successGreen.withValues(alpha: 0.1),
//       onTertiaryContainer: AppColor.neutralDark,
//       error: AppColor.errorRed,
//       onError: AppColor.pureWhite,
//       errorContainer: AppColor.errorRed.withValues(alpha: 0.1),
//       onErrorContainer: AppColor.neutralDark,
//       surface: AppColor.pureWhite,
//       onSurface: AppColor.neutralDark,
//       onSurfaceVariant: AppColor.neutralMedium,
//       outline: AppColor.borderLight,
//       outlineVariant: AppColor.borderLight.withValues(alpha: 0.5),
//       shadow: AppColor.shadowLight,
//       scrim: AppColor.neutralDark.withValues(alpha: 0.5),
//       inverseSurface: AppColor.neutralDark,
//       onInverseSurface: AppColor.pureWhite,
//       inversePrimary: AppColor.lightBlue,
//       surfaceTint: AppColor.primaryBlue,
//     ),
//     scaffoldBackgroundColor: AppColor.pureWhite,
//     cardColor: AppColor.pureWhite,
//     dividerColor: AppColor.borderLight,
//     appBarTheme: AppBarTheme(
//       backgroundColor: AppColor.pureWhite,
//       foregroundColor: AppColor.neutralDark,
//       elevation: 0,
//       shadowColor: AppColor.shadowLight,
//       surfaceTintColor: Colors.transparent,
//       titleTextStyle: GoogleFonts.inter(
//         fontSize: 18,
//         fontWeight: FontWeight.w600,
//         color: AppColor.neutralDark,
//         letterSpacing: -0.02,
//       ),
//       iconTheme: const IconThemeData(color: AppColor.neutralDark, size: 24),
//       actionsIconTheme: const IconThemeData(
//         color: AppColor.neutralDark,
//         size: 24,
//       ),
//     ),

//     cardTheme: CardThemeData(
//       color: AppColor.pureWhite,
//       elevation: 2,
//       shadowColor: AppColor.shadowLight,
//       surfaceTintColor: Colors.transparent,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//     ),

//     bottomNavigationBarTheme: BottomNavigationBarThemeData(
//       backgroundColor: AppColor.pureWhite,
//       selectedItemColor: AppColor.primaryBlue,
//       unselectedItemColor: AppColor.neutralMedium,
//       elevation: 8,
//       type: BottomNavigationBarType.fixed,
//       selectedLabelStyle: GoogleFonts.inter(
//         fontSize: 12,
//         fontWeight: FontWeight.w500,
//         letterSpacing: 0.4,
//       ),
//       unselectedLabelStyle: GoogleFonts.inter(
//         fontSize: 12,
//         fontWeight: FontWeight.w400,
//         letterSpacing: 0.4,
//       ),
//     ),

//     floatingActionButtonTheme: const FloatingActionButtonThemeData(
//       backgroundColor: AppColor.primaryBlue,
//       foregroundColor: AppColor.pureWhite,
//       elevation: 4,
//       focusElevation: 6,
//       hoverElevation: 6,
//       highlightElevation: 8,
//       shape: CircleBorder(),
//     ),

//     elevatedButtonTheme: ElevatedButtonThemeData(
//       style: ElevatedButton.styleFrom(
//         foregroundColor: AppColor.pureWhite,
//         backgroundColor: AppColor.primaryBlue,
//         disabledForegroundColor: AppColor.neutralMedium,
//         disabledBackgroundColor: AppColor.neutralLight,
//         elevation: 2,
//         shadowColor: AppColor.shadowLight,
//         padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//         textStyle: GoogleFonts.inter(
//           fontSize: 14,
//           fontWeight: FontWeight.w500,
//           letterSpacing: 0.1,
//         ),
//       ),
//     ),

//     outlinedButtonTheme: OutlinedButtonThemeData(
//       style: OutlinedButton.styleFrom(
//         foregroundColor: AppColor.primaryBlue,
//         disabledForegroundColor: AppColor.neutralMedium,
//         padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
//         side: const BorderSide(color: AppColor.primaryBlue, width: 1),
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//         textStyle: GoogleFonts.inter(
//           fontSize: 14,
//           fontWeight: FontWeight.w500,
//           letterSpacing: 0.1,
//         ),
//       ),
//     ),

//     textButtonTheme: TextButtonThemeData(
//       style: TextButton.styleFrom(
//         foregroundColor: AppColor.primaryBlue,
//         disabledForegroundColor: AppColor.neutralMedium,
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//         textStyle: GoogleFonts.inter(
//           fontSize: 14,
//           fontWeight: FontWeight.w500,
//           letterSpacing: 0.1,
//         ),
//       ),
//     ),

//     textTheme: AppTextTheme.buildTextTheme(isLight: true),

//     inputDecorationTheme: InputDecorationTheme(
//       fillColor: AppColor.neutralLight,
//       filled: true,
//       contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
//       border: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(8),
//         borderSide: const BorderSide(color: AppColor.borderLight, width: 1),
//       ),
//       enabledBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(8),
//         borderSide: const BorderSide(color: AppColor.borderLight, width: 1),
//       ),
//       focusedBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(8),
//         borderSide: const BorderSide(color: AppColor.primaryBlue, width: 2),
//       ),
//       errorBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(8),
//         borderSide: const BorderSide(color: AppColor.errorRed, width: 1),
//       ),
//       focusedErrorBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(8),
//         borderSide: const BorderSide(color: AppColor.errorRed, width: 2),
//       ),
//       labelStyle: GoogleFonts.inter(
//         fontSize: 14,
//         fontWeight: FontWeight.w400,
//         color: AppColor.neutralMedium,
//         letterSpacing: 0.1,
//       ),
//       hintStyle: GoogleFonts.inter(
//         fontSize: 14,
//         fontWeight: FontWeight.w400,
//         color: AppColor.neutralMedium,
//         letterSpacing: 0.1,
//       ),
//       errorStyle: GoogleFonts.inter(
//         fontSize: 12,
//         fontWeight: FontWeight.w400,
//         color: AppColor.errorRed,
//         letterSpacing: 0.4,
//       ),
//     ),

//     switchTheme: SwitchThemeData(
//       thumbColor: WidgetStateProperty.resolveWith((states) {
//         if (states.contains(WidgetState.selected)) return AppColor.primaryBlue;
//         return AppColor.neutralMedium;
//       }),
//       trackColor: WidgetStateProperty.resolveWith((states) {
//         if (states.contains(WidgetState.selected)) {
//           return AppColor.primaryBlue.withValues(alpha: 0.3);
//         }
//         return AppColor.neutralLight;
//       }),
//     ),

//     checkboxTheme: CheckboxThemeData(
//       fillColor: WidgetStateProperty.resolveWith((states) {
//         if (states.contains(WidgetState.selected)) return AppColor.primaryBlue;
//         return Colors.transparent;
//       }),
//       checkColor: WidgetStateProperty.all(AppColor.pureWhite),
//       side: const BorderSide(color: AppColor.borderLight, width: 1),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
//     ),

//     radioTheme: RadioThemeData(
//       fillColor: WidgetStateProperty.resolveWith((states) {
//         if (states.contains(WidgetState.selected)) return AppColor.primaryBlue;
//         return AppColor.neutralMedium;
//       }),
//     ),

//     progressIndicatorTheme: const ProgressIndicatorThemeData(
//       color: AppColor.primaryBlue,
//       linearTrackColor: AppColor.neutralLight,
//       circularTrackColor: AppColor.neutralLight,
//     ),

//     sliderTheme: SliderThemeData(
//       activeTrackColor: AppColor.primaryBlue,
//       thumbColor: AppColor.primaryBlue,
//       overlayColor: AppColor.primaryBlue.withValues(alpha: 0.2),
//       inactiveTrackColor: AppColor.neutralLight,
//       valueIndicatorColor: AppColor.primaryBlue,
//       valueIndicatorTextStyle: GoogleFonts.inter(
//         fontSize: 12,
//         fontWeight: FontWeight.w500,
//         color: AppColor.pureWhite,
//       ),
//     ),

//     tabBarTheme: TabBarThemeData(
//       labelColor: AppColor.primaryBlue,
//       unselectedLabelColor: AppColor.neutralMedium,
//       indicatorColor: AppColor.primaryBlue,
//       indicatorSize: TabBarIndicatorSize.label,
//       labelStyle: GoogleFonts.inter(
//         fontSize: 14,
//         fontWeight: FontWeight.w600,
//         letterSpacing: 0.1,
//       ),
//       unselectedLabelStyle: GoogleFonts.inter(
//         fontSize: 14,
//         fontWeight: FontWeight.w400,
//         letterSpacing: 0.1,
//       ),
//     ),

//     tooltipTheme: TooltipThemeData(
//       decoration: BoxDecoration(
//         color: AppColor.neutralDark.withValues(alpha: 0.9),
//         borderRadius: BorderRadius.circular(8),
//       ),
//       textStyle: GoogleFonts.inter(
//         fontSize: 12,
//         fontWeight: FontWeight.w400,
//         color: AppColor.pureWhite,
//       ),
//       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//     ),

//     snackBarTheme: SnackBarThemeData(
//       backgroundColor: AppColor.neutralDark,
//       contentTextStyle: GoogleFonts.inter(
//         fontSize: 14,
//         fontWeight: FontWeight.w400,
//         color: AppColor.pureWhite,
//       ),
//       actionTextColor: AppColor.lightBlue,
//       behavior: SnackBarBehavior.floating,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//       elevation: 4,
//     ),

//     dialogTheme: DialogThemeData(
//       backgroundColor: AppColor.pureWhite,
//       elevation: 8,
//       shadowColor: AppColor.shadowLight,
//       surfaceTintColor: Colors.transparent,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//       titleTextStyle: GoogleFonts.inter(
//         fontSize: 18,
//         fontWeight: FontWeight.w600,
//         color: AppColor.neutralDark,
//         letterSpacing: -0.02,
//       ),
//       contentTextStyle: GoogleFonts.inter(
//         fontSize: 14,
//         fontWeight: FontWeight.w400,
//         color: AppColor.neutralDark,
//         letterSpacing: 0.25,
//       ),
//     ),

//     bottomSheetTheme: const BottomSheetThemeData(
//       backgroundColor: AppColor.pureWhite,
//       elevation: 8,
//       modalElevation: 16,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
//       ),
//     ),
//   );

//   static ThemeData darkTheme = ThemeData(
//     brightness: Brightness.dark,
//     colorScheme: ColorScheme(
//       brightness: Brightness.dark,
//       primary: AppColor.primaryBlueDark,
//       onPrimary: AppColor.darkBase,
//       primaryContainer: AppColor.lightBlueDark,
//       onPrimaryContainer: AppColor.pureWhite,
//       secondary: AppColor.infoBlue,
//       onSecondary: AppColor.pureWhite,
//       secondaryContainer: AppColor.infoBlue.withValues(alpha: 0.2),
//       onSecondaryContainer: AppColor.pureWhite,
//       tertiary: AppColor.successGreen,
//       onTertiary: AppColor.pureWhite,
//       tertiaryContainer: AppColor.successGreen.withValues(alpha: 0.2),
//       onTertiaryContainer: AppColor.pureWhite,
//       error: AppColor.errorRed,
//       onError: AppColor.pureWhite,
//       errorContainer: AppColor.errorRed.withValues(alpha: 0.2),
//       onErrorContainer: AppColor.pureWhite,
//       surface: AppColor.darkBase,
//       onSurface: AppColor.neutralDarkDark,
//       onSurfaceVariant: AppColor.neutralMediumDark,
//       outline: AppColor.borderDark,
//       outlineVariant: AppColor.borderDark.withValues(alpha: 0.5),
//       shadow: AppColor.shadowDark,
//       scrim: AppColor.neutralDark.withValues(alpha: 0.7),
//       inverseSurface: AppColor.pureWhite,
//       onInverseSurface: AppColor.neutralDark,
//       inversePrimary: AppColor.primaryBlue,
//       surfaceTint: primaryBlueDark,
//     ),
//     scaffoldBackgroundColor: AppColor.darkBase,
//     cardColor: AppColor.surfaceDark,
//     dividerColor: AppColor.borderDark,
//     appBarTheme: AppBarTheme(
//       backgroundColor: AppColor.darkBase,
//       foregroundColor: AppColor.neutralDarkDark,
//       elevation: 0,
//       shadowColor: AppColor.shadowDark,
//       surfaceTintColor: Colors.transparent,
//       titleTextStyle: GoogleFonts.inter(
//         fontSize: 18,
//         fontWeight: FontWeight.w600,
//         color: AppColor.neutralDarkDark,
//         letterSpacing: -0.02,
//       ),
//       iconTheme: const IconThemeData(color: AppColor.neutralDarkDark, size: 24),
//       actionsIconTheme: const IconThemeData(
//         color: AppColor.neutralDarkDark,
//         size: 24,
//       ),
//     ),
//     cardTheme: CardThemeData(
//       color: AppColor.surfaceDark,
//       elevation: 2,
//       shadowColor: AppColor.shadowDark,
//       surfaceTintColor: Colors.transparent,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//     ),
//     elevatedButtonTheme: ElevatedButtonThemeData(
//       style: ElevatedButton.styleFrom(
//         foregroundColor: AppColor.darkBase,
//         backgroundColor: primaryBlueDark,
//         disabledForegroundColor: AppColor.neutralMediumDark,
//         disabledBackgroundColor: AppColor.neutralLightDark,
//         elevation: 2,
//         shadowColor: AppColor.shadowDark,
//         padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//         textStyle: GoogleFonts.inter(
//           fontSize: 14,
//           fontWeight: FontWeight.w500,
//           letterSpacing: 0.1,
//         ),
//       ),
//     ),
//     textTheme: AppTextTheme.buildTextTheme(isLight: false),
//   );

//   static get primaryBlueDark => null;
// }
