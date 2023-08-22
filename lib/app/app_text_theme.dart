import 'package:flutter/material.dart';
import 'package:filmku/app/app_text_styles.dart';

import 'app_colors.dart';

class AppTextTheme {
  //Simple text theme
  static TextTheme get lightTextTheme {
    return  TextTheme(
      titleLarge: AppTextStyles.titleLarge.copyWith(color: AppColors.primaryLight),
      titleMedium: AppTextStyles.titleMedium.copyWith(color: AppColors.primaryLight),
      titleSmall: AppTextStyles.titleSmall.copyWith(color: AppColors.primaryLight),
      bodyLarge: AppTextStyles.bodyLarge.copyWith(color: AppColors.secondaryLight),
      bodyMedium: AppTextStyles.bodyMedium.copyWith(color: AppColors.primaryLight),
      bodySmall: AppTextStyles.bodySmall.copyWith(color: AppColors.secondaryLight),
    );
  }

  //Dark text theme
  static TextTheme get darkTextTheme {
    return  TextTheme(
      titleLarge: AppTextStyles.titleLarge.copyWith(color: AppColors.primaryDark),
      titleMedium: AppTextStyles.titleMedium.copyWith(color: AppColors.primaryDark),
      titleSmall: AppTextStyles.titleSmall.copyWith(color: AppColors.primaryDark),
      bodyLarge: AppTextStyles.bodyLarge.copyWith(color: AppColors.secondaryDark),
      bodyMedium: AppTextStyles.bodyMedium.copyWith(color: AppColors.primaryDark),
      bodySmall: AppTextStyles.bodySmall.copyWith(color: AppColors.secondaryDark),
    );
  }
}
