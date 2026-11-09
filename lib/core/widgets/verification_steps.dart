import 'package:kyc_practice_app/core/languages/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:kyc_practice_app/core/constants/app_space.dart';
import 'package:kyc_practice_app/core/constants/app_colors.dart';
import 'package:kyc_practice_app/core/constants/app_sizes.dart';
import 'package:kyc_practice_app/core/theme/app_styles.dart';

class VerificationTile extends StatelessWidget {
  final String iconAsset;
  final String heading;
  final String description;
  final bool isComplete;
  final bool isLocked;
  final VoidCallback onTap;

  const VerificationTile({
    super.key,
    required this.heading,
    required this.description,
    required this.iconAsset,
    required this.isComplete,
    required this.onTap,
    this.isLocked = false,
  });

  bool get isActive => !isComplete && !isLocked;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isActive ? onTap : null,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: AppSpace.s16),
        padding: const EdgeInsets.all(AppSpace.s4),
        decoration: BoxDecoration(
          color: isLocked ? AppColors.surfaceMuted : AppColors.white,
          borderRadius: BorderRadius.circular(AppSizes.radiusMd),
          border: Border.all(color: AppColors.border),
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppSpace.s8),
          child: Stack(
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(AppSpace.s12),
                    decoration: BoxDecoration(
                      color: AppColors.textMuted.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      iconAsset,
                      width: AppSizes.iconSm,
                      height: AppSizes.iconSm,
                      color: isLocked ? AppColors.textMuted : null,
                    ),
                  ),
                  AppSpace.w16,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          heading,
                          style: AppStyles.bodyLarge(context).copyWith(
                            fontWeight: FontWeight.bold,
                            color: isLocked
                                ? AppColors.textSecondary
                                : AppColors.textPrimary,
                          ),
                        ),
                        AppSpace.h4,
                        Text(
                          description,
                          style: AppStyles.body(context).copyWith(
                            color: isLocked
                                ? AppColors.textMuted
                                : AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  AppSpace.w16,
                  const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: AppColors.textSecondary,
                    size: AppSizes.iconXs,
                  ),
                ],
              ),
              if (isComplete)
                Positioned(
                  top: -4,
                  right: 0,
                  child: Text(
                    AppStrings.completed,
                    style: AppStyles.caption(context),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
