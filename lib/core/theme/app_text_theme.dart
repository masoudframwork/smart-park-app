import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_color.dart';

class AppTextTheme {
  AppTextTheme._();

  // 🟢 الأزرار الرئيسية (الأخضر أو الأساسي)
  static TextStyle mainButtonTextStyle() => TextStyle(
    fontSize: 14.sp,
    color: AppColor.whiteColor,
    fontWeight: FontWeight.w600,
  );

  // 🔴 الأزرار الثانوية (مثل الأحمر أو التحذيري)
  static TextStyle secondaryButtonTextStyle() => TextStyle(
    fontSize: 14.sp,
    color: AppColor.whiteColor,
    fontWeight: FontWeight.w500,
  );

  // 🏷️ العناوين الكبيرة
  static TextStyle titleLargeTextStyle() => TextStyle(
    fontSize: 22.sp,
    color: AppColor.blackColor,
    fontWeight: FontWeight.w700,
  );

  // 🏷️ العناوين المتوسطة
  static TextStyle titleMediumTextStyle() => TextStyle(
    fontSize: 18.sp,
    color: AppColor.blackColor,
    fontWeight: FontWeight.w600,
  );

  // 🏷️ العناوين الصغيرة
  static TextStyle titleSmallTextStyle() => TextStyle(
    fontSize: 14.sp,
    color: AppColor.greyColor,
    fontWeight: FontWeight.w500,
  );

  // 💰 السعر / القيمة الرقمية
  static TextStyle numberTextStyle() => TextStyle(
    fontSize: 16.sp,
    color: AppColor.blackColor,
    fontWeight: FontWeight.w600,
  );

  // 💬 النصوص الكبيرة داخل البطاقات
  static TextStyle bodyLargeTextStyle() => TextStyle(
    fontSize: 16.sp,
    color: AppColor.blackColor,
    fontWeight: FontWeight.w500,
  );

  // 💬 النصوص المتوسطة
  static TextStyle bodyMediumTextStyle() => TextStyle(
    fontSize: 14.sp,
    color: AppColor.blackColor,
    fontWeight: FontWeight.w400,
  );

  // 💬 النصوص الصغيرة
  static TextStyle bodySmallTextStyle() => TextStyle(
    fontSize: 12.sp,
    color: AppColor.greyColor,
    fontWeight: FontWeight.w400,
  );

  // 💬 النصوص الأصغر جدًا
  static TextStyle bodyXSmallTextStyle() => TextStyle(
    fontSize: 10.sp,
    color: AppColor.greyColor,
    fontWeight: FontWeight.w400,
  );

  // ⚪ النصوص داخل الحقول أو التلميحات
  static TextStyle hintTextStyle() => TextStyle(
    fontSize: 14.sp,
    color: AppColor.greyColor,
    fontWeight: FontWeight.w400,
  );

  // 🧾 نصوص التنبيه أو الخطأ
  static TextStyle errorTextStyle() => TextStyle(
    fontSize: 12.sp,
    color: AppColor.secondaryContainerColor,
    fontWeight: FontWeight.w500,
  );

  // 🕓 نصوص الوقت / التاريخ
  static TextStyle timeTextStyle() => TextStyle(
    fontSize: 12.sp,
    color: AppColor.greyTextColor,
    fontWeight: FontWeight.w400,
  );

  // 🏷️ نصوص Tag أو Badge
  static TextStyle tagTextStyle() => TextStyle(
    fontSize: 10.sp,
    color: AppColor.whiteColor,
    fontWeight: FontWeight.w500,
  );
}
