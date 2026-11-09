import 'package:flutter/material.dart';
import 'package:kyc_practice_app/core/constants/app_colors.dart';
import 'package:kyc_practice_app/core/constants/app_sizes.dart';

class AppStyles {
  AppStyles._();

  static TextStyle title(BuildContext context) => TextStyle(
        color: AppColors.white,
        fontSize: AppSizes.font(context, AppSizes.fontTitle),
        fontWeight: FontWeight.w600,
      );

  static TextStyle heading(BuildContext context) => TextStyle(
        color: AppColors.white,
        fontSize: AppSizes.font(context, AppSizes.fontXl),
        fontWeight: FontWeight.bold,
      );

  static TextStyle subtitle(BuildContext context) => TextStyle(
        color: AppColors.white,
        fontSize: AppSizes.font(context, AppSizes.fontMd),
        fontWeight: FontWeight.w400,
      );

  static TextStyle bodyLarge(BuildContext context) => TextStyle(
        color: AppColors.textSecondary,
        fontSize: AppSizes.font(context, AppSizes.fontMd),
      );

  static TextStyle body(BuildContext context) => TextStyle(
        color: AppColors.textSecondary,
        fontSize: AppSizes.font(context, AppSizes.fontSm),
      );

  static TextStyle caption(BuildContext context) => TextStyle(
        color: AppColors.textSecondary,
        fontSize: AppSizes.font(context, AppSizes.fontXs),
      );

  static TextStyle link(BuildContext context) => TextStyle(
        color: AppColors.link,
        fontSize: AppSizes.font(context, AppSizes.fontSm),
        decoration: TextDecoration.underline,
      );

  static TextStyle button(BuildContext context) =>
      (Theme.of(context).textTheme.labelLarge ?? const TextStyle()).copyWith(
        fontSize: AppSizes.font(context, AppSizes.fontMd),
      );
}
