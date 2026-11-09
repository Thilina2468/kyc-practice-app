import 'package:flutter/material.dart';
import 'package:kyc_practice_app/core/constants/app_colors.dart';
import 'package:kyc_practice_app/core/constants/app_sizes.dart';
import 'package:kyc_practice_app/core/constants/app_space.dart';
import 'package:kyc_practice_app/core/theme/app_styles.dart';

class Button extends StatelessWidget {
  final String text;
  final BorderRadiusGeometry borderRadius;
  final VoidCallback onPressed;
  final bool isTransparent;
  final bool? isDisabled;
  final Color? borderColor;
  final Color? textColor;
  final String? iconAsset;

  const Button({
    super.key,
    required this.text,
    required this.onPressed,
    required this.borderRadius,
    this.isTransparent = false,
    this.isDisabled,
    this.borderColor,
    this.textColor,
    this.iconAsset,
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
                    : borderColor ?? AppColors.primary,
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
                foregroundColor: textColor ??
                    (isTransparent ? AppColors.primary : AppColors.white),
                textStyle: AppStyles.button(context),
              ),
              child: iconAsset == null
                  ? Text(text)
                  : Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          iconAsset!,
                          width: AppSizes.iconMd,
                          height: AppSizes.iconMd,
                        ),
                        AppSpace.w8,
                        Text(text),
                      ],
                    ),
            ),
    );
  }
}
