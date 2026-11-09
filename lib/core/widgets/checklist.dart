import 'package:flutter/material.dart';
import 'package:kyc_practice_app/core/constants/app_space.dart';
import 'package:kyc_practice_app/core/constants/app_colors.dart';
import 'package:kyc_practice_app/core/constants/app_sizes.dart';
import 'package:kyc_practice_app/core/constants/icon_constants.dart';
import 'package:kyc_practice_app/core/theme/app_styles.dart';

class Checklist extends StatelessWidget {
  final String text;
  final Image? image;

  const Checklist({super.key, required this.text, this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(bottom: AppSpace.s16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            image ??
                Image.asset(
                  IconConstants.iconCheckmark,
                  height: AppSizes.iconMd,
                  width: AppSizes.iconMd,
                ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: AppSpace.s16),
                child: Text(
                  text,
                  style: AppStyles.bodyLarge(context)
                      .copyWith(color: AppColors.textPrimary),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
