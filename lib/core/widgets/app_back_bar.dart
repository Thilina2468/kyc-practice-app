import 'package:flutter/material.dart';
import 'package:kyc_practice_app/core/constants/app_sizes.dart';
import 'package:kyc_practice_app/core/constants/app_space.dart';
import 'package:kyc_practice_app/core/constants/icon_constants.dart';

class AppBackBar extends StatelessWidget implements PreferredSizeWidget {
  const AppBackBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      titleSpacing: AppSpace.s20,
      title: Align(
        alignment: Alignment.centerLeft,
        child: IconButton(
          icon: Image.asset(
            IconConstants.iconBackArrow,
            width: AppSizes.iconMd,
            height: AppSizes.iconMd,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
    );
  }
}
