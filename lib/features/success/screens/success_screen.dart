import 'package:kyc_practice_app/core/languages/app_strings.dart';
import 'package:kyc_practice_app/features/auth/screens/login_screen.dart';
import 'package:kyc_practice_app/core/constants/app_space.dart';
import 'package:kyc_practice_app/core/constants/app_sizes.dart';
import 'package:kyc_practice_app/core/theme/app_styles.dart';
import 'package:kyc_practice_app/core/widgets/background_template.dart';
import 'package:kyc_practice_app/core/widgets/button.dart';
import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          BackgroundTemplate(
            footer: Button(
              text: AppStrings.letsGo,
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                  (route) => false,
                );
              },
              borderRadius: BorderRadius.circular(AppSizes.radiusLg),
            ),
          ),
          Container(
            width: double.infinity,
            height: AppSizes.successContentHeight,
            padding: const EdgeInsets.all(AppSpace.s40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/confetti.png',
                  width: AppSizes.confettiWidth,
                ),
                AppSpace.h40,
                Text(
                  AppStrings.successTitle,
                  style: AppStyles.heading(context),
                ),
                AppSpace.h20,
                Text(
                  AppStrings.successMessage,
                  textAlign: TextAlign.center,
                  style: AppStyles.subtitle(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
