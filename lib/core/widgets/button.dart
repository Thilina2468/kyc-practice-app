import 'package:flutter/material.dart';
import 'package:kyc_practice_app/core/constants/app_colors.dart';
import 'package:kyc_practice_app/core/constants/app_sizes.dart';
import 'package:kyc_practice_app/core/theme/app_styles.dart';

class Button extends StatelessWidget {
  final String text;
  final BorderRadiusGeometry borderRadius;
  final VoidCallback onPressed;
  final bool isTransparent;
  final bool? isDisabled;

  const Button({
    super.key,
    required this.text,
    required this.onPressed,
    required this.borderRadius,
    this.isTransparent = false,
    this.isDisabled,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: AppSizes.buttonHeight,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        color: isTransparent
            ? Colors.transparent
            : isDisabled == true
                ? AppColors.buttonDisabled
                : AppColors.primary,
        border: isTransparent
            ? Border.all(
                color: isDisabled == true
                    ? AppColors.textDisabled
                    : AppColors.primary,
                width: AppSizes.borderWidthThick,
              )
            : null,
      ),
      child: isDisabled == true
          ? Center(
              child: Text(
                text,
                style: AppStyles.button(context)
                    .copyWith(color: AppColors.textDisabled),
              ),
            )
          : ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                foregroundColor:
                    isTransparent ? AppColors.primary : AppColors.white,
                textStyle: AppStyles.button(context),
              ),
              child: Text(text),
            ),
    );
  }
}
