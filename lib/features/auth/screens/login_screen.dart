import 'package:kyc_practice_app/core/languages/app_strings.dart';
import 'package:kyc_practice_app/features/onboarding/screens/onboarding_steps.dart';
import 'package:kyc_practice_app/core/constants/app_colors.dart';
import 'package:kyc_practice_app/core/constants/app_space.dart';
import 'package:kyc_practice_app/core/constants/app_sizes.dart';
import 'package:kyc_practice_app/core/theme/app_styles.dart';
import 'package:kyc_practice_app/core/utils/validators.dart';
import 'package:kyc_practice_app/core/widgets/background_template.dart';
import 'package:kyc_practice_app/core/widgets/button.dart';
import 'package:kyc_practice_app/core/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:kyc_practice_app/features/success/screens/success_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        children: [
          BackgroundTemplate(
            title: AppStrings.login,
            subtitle: AppStrings.loginSubtitle,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  InputField(
                    hintText: AppStrings.username,
                    validator: (value) =>
                        Validators.required(value, AppStrings.usernameRequired),
                  ),
                  AppSpace.h20,
                  InputField(
                    hintText: AppStrings.password,
                    iconAsset: 'assets/images/eye_off.png',
                    validator: (value) =>
                        Validators.required(value, AppStrings.passwordRequired),
                  ),
                  AppSpace.h20,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: AppSpace.s12,
                          bottom: AppSpace.s4,
                        ),
                        child: Text(
                          AppStrings.forgotPassword,
                          style: AppStyles.body(context),
                        ),
                      ),
                    ],
                  ),
                  AppSpace.h20,
                  Button(
                    text: AppStrings.login,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SuccessScreen(),
                          ),
                        );
                      }
                    },
                    borderRadius: BorderRadius.circular(AppSizes.radiusXl),
                  ),
                  AppSpace.h20,
                  Button(
                    text: AppStrings.register,
                    isTransparent: true,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const OnboardingSteps(),
                        ),
                      );
                    },
                    borderRadius: BorderRadius.circular(AppSizes.radiusMd),
                  ),
                  AppSpace.h32,
                  const Divider(
                    color: AppColors.borderDivider,
                    thickness: AppSizes.borderWidth,
                  ),
                  AppSpace.h24,
                  Text(
                    AppStrings.killAccount,
                    style: AppStyles.bodyLarge(context).copyWith(
                      color: AppColors.textMuted.withOpacity(0.5),
                    ),
                  ),
                  AppSpace.h32,
                  SizedBox(
                    height: AppSizes.loginFooterRowHeight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(AppStrings.needHelp,
                            style: AppStyles.link(context)),
                        AppSpace.w16,
                        Text(
                          AppStrings.moreInfo,
                          style: AppStyles.link(context)
                              .copyWith(color: AppColors.textSecondary),
                        ),
                      ],
                    ),
                  ),
                  AppSpace.h48,
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: AppSpace.s16,
                    ),
                    child: Text(
                      AppStrings.termsNotice,
                      style: AppStyles.body(context),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: AppSizes.languagePillTop,
              right: AppSpace.s32,
            ),
            child: Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  height: AppSizes.languagePillHeight,
                  width: AppSizes.languagePillWidth,
                  padding: const EdgeInsets.only(
                    left: AppSizes.languagePillPaddingLeft,
                    right: AppSpace.s12,
                  ),
                  decoration: const BoxDecoration(
                    color: AppColors.surfaceCreditCard,
                    borderRadius: BorderRadius.all(
                      Radius.circular(AppSizes.radiusFull),
                    ),
                  ),
                  child: Center(
                    child: Row(
                      children: [
                        Text(AppStrings.english,
                            style: AppStyles.body(context)),
                        AppSpace.w8,
                        const Icon(
                          Icons.keyboard_arrow_down,
                          color: AppColors.textSecondary,
                          size: AppSizes.iconSm,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
