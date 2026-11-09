import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kyc_practice_app/core/constants/app_space.dart';
import 'package:kyc_practice_app/core/constants/app_colors.dart';
import 'package:kyc_practice_app/core/constants/app_sizes.dart';
import 'package:kyc_practice_app/core/theme/app_styles.dart';

class InputField extends StatelessWidget {
  final String hintText;
  final String? iconAsset;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;

  const InputField({
    super.key,
    required this.hintText,
    this.iconAsset,
    this.validator,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: inputFormatters,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        constraints: const BoxConstraints(minHeight: AppSizes.inputHeight),
        contentPadding: const EdgeInsets.all(AppSizes.inputPadding),
        filled: true,
        fillColor: AppColors.white,
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(AppSizes.radiusMd)),
          borderSide: BorderSide(color: AppColors.error),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(AppSizes.radiusMd)),
          borderSide: BorderSide(
              color: AppColors.error, width: AppSizes.borderWidthThick),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(AppSizes.radiusMd)),
          borderSide: BorderSide(color: AppColors.border),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(AppSizes.radiusMd)),
          borderSide: BorderSide(color: AppColors.borderFocused),
        ),
        labelText: hintText,
        labelStyle: AppStyles.bodyLarge(context),
        suffixIcon: iconAsset == null
            ? null
            : Padding(
                padding: const EdgeInsets.all(AppSpace.s12),
                child: Image.asset(
                  iconAsset!,
                  width: AppSizes.iconMd,
                  height: AppSizes.iconMd,
                ),
              ),
      ),
    );
  }
}
