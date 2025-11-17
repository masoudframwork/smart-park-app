import 'package:flutter/material.dart';
import 'app_color.dart';

class AppTextTheme {
  AppTextTheme._();

  // 🟢 الأزرار الرئيسية (الأخضر أو الأساسي)
  static TextStyle mainButtonTextStyle() => TextStyle(
        fontSize: 16,
        color: AppColor.whiteColor,
        fontWeight: FontWeight.w600,
        fontFamily: 'IBM Plex Sans Arabic',
      );

  // 🔴 الأزرار الثانوية (مثل الأحمر أو التحذيري)
  static TextStyle secondaryButtonTextStyle() => TextStyle(
        fontSize: 16,
        color: AppColor.whiteColor,
        fontWeight: FontWeight.w600,
        fontFamily: 'IBM Plex Sans Arabic',
      );
//الاجمالي
  static TextStyle descriptionTextStyle() => TextStyle(
        fontSize: 18,
        color: AppColor.blackTextColor,
        fontWeight: FontWeight.w700,
        fontFamily: 'IBM Plex Sans Arabic',
      );

  // 🏷️ العناوين الكبيرة
  static TextStyle titleLargeTextStyle() => TextStyle(
        fontSize: 26,
        color: AppColor.blackColor,
        fontWeight: FontWeight.w700,
        fontFamily: 'IBM Plex Sans Arabic',
      );



  // 🏷️ العناوين المتوسطة
  static TextStyle titleMediumTextStyle() => TextStyle(
        fontSize: 16,
        color: AppColor.blackColor,
        fontWeight: FontWeight.w400,
        fontFamily: 'IBM Plex Sans Arabic',
      );

  static TextStyle titleMSTextStyle() => TextStyle(
    fontSize: 20,
    color: AppColor.blackColor,
    fontWeight: FontWeight.w600,
    fontFamily: 'IBM Plex Sans Arabic',
  );





  // 🏷️ العناوين الصغيرة
  static TextStyle titleSmallTextStyle() => TextStyle(
        fontSize: 14,
        color: AppColor.greyColor,
        fontWeight: FontWeight.w400,
        fontFamily: 'IBM Plex Sans Arabic',
      );
  // onboarding screen
  static TextStyle introTitleTextStyle() => TextStyle(
        fontSize: 50,
        color: AppColor.introTextColor,
        fontWeight: FontWeight.w700,
        fontFamily: 'IBM Plex Sans Arabic',
      );

  // 💰 السعر / القيمة الرقمية
  static TextStyle numberLargeTextStyle() => TextStyle(
        fontSize: 25,
        color: AppColor.blackNumberSmallColor,
        fontWeight: FontWeight.w700,
        fontFamily: 'IBM Plex Sans Arabic',
      );
  // ارقام صغيره
  static TextStyle numberSmallTextStyle() => TextStyle(
        fontSize: 14,
        color: AppColor.blackNumberSmallColor,
        fontWeight: FontWeight.w400,
        fontFamily: 'IBM Plex Sans Arabic',
      );

  // 🕓الاشارات + -  نصوص الوقت / التاريخ
  static TextStyle timeTextStyle() => TextStyle(
        fontSize: 14,
        color: AppColor.blackColor,
        fontWeight: FontWeight.w700,
        fontFamily: 'IBM Plex Sans Arabic',
      );

  // 💬 النصوص الكبيرة داخل البطاقات
  static TextStyle bodyLargeTextStyle() => TextStyle(
        fontSize: 26,
        color: AppColor.blackColor,
        fontWeight: FontWeight.w700,
        fontFamily: 'IBM Plex Sans Arabic',
      );

  // 💬 النصوص المتوسطة
  static TextStyle bodyMediumTextStyle() => TextStyle(
        fontSize: 14,
        color: AppColor.blackColor,
        fontWeight: FontWeight.w400,
        fontFamily: 'IBM Plex Sans Arabic',
      );
  static TextStyle font18SimiBoldBlack() => TextStyle(
        fontSize: 18,
        color: AppColor.blackColor,
        fontWeight: FontWeight.w600,
        fontFamily: 'IBM Plex Sans Arabic',
      );
  ////////////////////////////////////////////////////////////////////////
  // 💬 النصوص الصغيرة
  static TextStyle bodySmallTextStyle() => TextStyle(
        fontSize: 12,
        color: AppColor.greyColor,
        
        fontWeight: FontWeight.w400,
        fontFamily: 'IBM Plex Sans Arabic',
      );
  //
  // 💬 النصوص الأصغر جدًا
  static TextStyle bodyXSmallTextStyle() => TextStyle(
        fontSize: 13,
        color: AppColor.primaryTextSmallColor,
        fontWeight: FontWeight.w400,
        fontFamily: 'IBM Plex Sans Arabic',
      );
  //
  // // ⚪ النصوص داخل الحقول أو التلميحات
  // static TextStyle hintTextStyle() => TextStyle(
  //   fontSize: 14,
  //   color: AppColor.greyColor,
  //   fontWeight: FontWeight.w400,
  // );
  //
  // // 🧾 نصوص التنبيه أو الخطأ
  // static TextStyle errorTextStyle() => TextStyle(
  //   fontSize: 12,
  //   color: AppColor.secondaryContainerColor,
  //   fontWeight: FontWeight.w500,
  // );
  //
  // // 🕓 نصوص الوقت / التاريخ
  // static TextStyle timeTextStyle() => TextStyle(
  //   fontSize: 12,
  //   color: AppColor.greyTextColor,
  //   fontWeight: FontWeight.w400,
  // );
  //
  // // 🏷️ نصوص Tag أو Badge
  // static TextStyle tagTextStyle() => TextStyle(
  //   fontSize: 10,
  //   color: AppColor.whiteColor,
  //   fontWeight: FontWeight.w500,
  // );
}
