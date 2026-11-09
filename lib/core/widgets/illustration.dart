import 'package:flutter/material.dart';
import 'package:kyc_practice_app/core/constants/app_sizes.dart';

class Illustration extends StatelessWidget {
  final String asset;

  const Illustration(this.asset, {super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.sizeOf(context).height;

    return Image.asset(
      asset,
      height: screenHeight * AppSizes.illustrationHeightFraction,
      fit: BoxFit.contain,
    );
  }
}
