import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyles {
  //Merri Weather Font Family
  static const String merriWeatherFontFamily = 'MerriWeather';

  //Mulish Font Family
  static const String mulishFontFamily = 'Mulish';

  //Headings
  static TextStyle titleLarge = TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeight.w700,
      fontFamily: mulishFontFamily,
      letterSpacing: 0.4);

  static TextStyle titleMedium = TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w900,
      fontFamily: merriWeatherFontFamily,
      letterSpacing: 0.32);
  static  TextStyle titleSmall = TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w700,
      fontFamily: mulishFontFamily,
      letterSpacing: 0.28);

  //Body
  static const TextStyle bodyLarge = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w900,
      fontFamily: merriWeatherFontFamily,
      letterSpacing: 0.02);
  static  TextStyle bodyMedium = TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      fontFamily: mulishFontFamily,
      letterSpacing: 0.24);

  static TextStyle bodySmall = TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      fontFamily: mulishFontFamily,
      letterSpacing: 0.24);
}
