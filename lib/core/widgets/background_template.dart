import 'package:flutter/material.dart';
import 'package:kyc_practice_app/core/constants/app_space.dart';
import 'package:kyc_practice_app/core/constants/app_colors.dart';
import 'package:kyc_practice_app/core/constants/app_sizes.dart';
import 'package:kyc_practice_app/core/theme/app_styles.dart';
import 'package:kyc_practice_app/core/widgets/footer.dart';

class BackgroundTemplate extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final double? cardHeight;
  final Widget? child;
  final Widget? footer;

  const BackgroundTemplate({
    super.key,
    this.title,
    this.subtitle,
    this.cardHeight,
    this.footer,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.sizeOf(context).height;

    final bool hasHeader = title != null || subtitle != null;
    final bool fillCard = cardHeight != null || hasHeader;

    return Stack(children: [
      Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.gradientTop,
              AppColors.gradientBottom,
            ],
            stops: [0, AppSizes.gradientEnd],
          ),
        ),
      ),
      Positioned(
        top: AppSizes.ringOneTop,
        right: AppSizes.ringOneRight,
        child: Container(
          width: AppSizes.ringSize,
          height: AppSizes.ringSize,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.ring,
              width: AppSizes.ringWidth,
            ),
          ),
        ),
      ),
      Positioned(
        top: AppSizes.ringTwoTop,
        right: AppSizes.ringTwoRight,
        child: Container(
          width: AppSizes.ringSize,
          height: AppSizes.ringSize,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.ring,
              width: AppSizes.ringWidth,
            ),
          ),
        ),
      ),
      Positioned.fill(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (title != null || subtitle != null)
              Padding(
                padding: EdgeInsets.only(
                  top: screenHeight * AppSizes.titleTopFraction,
                  left: AppSpace.s32,
                  right: AppSpace.s32,
                  bottom: AppSpace.s24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (title != null)
                      Text(title!, style: AppStyles.title(context)),
                    AppSpace.h8,
                    if (subtitle != null)
                      Text(subtitle!, style: AppStyles.subtitle(context)),
                  ],
                ),
              ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  height: cardHeight ?? (hasHeader ? double.infinity : null),
                  decoration: const BoxDecoration(
                    color: AppColors.surfacePrimary,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(AppSizes.radiusLg),
                      topRight: Radius.circular(AppSizes.radiusLg),
                    ),
                  ),
                  child: Column(
                    mainAxisSize:
                        fillCard ? MainAxisSize.max : MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      if (child != null)
                        Flexible(
                          fit: fillCard ? FlexFit.tight : FlexFit.loose,
                          child: SingleChildScrollView(
                            padding: EdgeInsets.fromLTRB(
                              AppSpace.s32,
                              AppSpace.s32,
                              AppSpace.s32,
                              footer == null ? AppSpace.s32 : AppSpace.s16,
                            ),
                            child: child,
                          ),
                        ),
                      if (footer != null) Footer(child: footer!),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}
