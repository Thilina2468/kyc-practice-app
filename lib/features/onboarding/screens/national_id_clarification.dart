import 'package:kyc_practice_app/core/languages/app_strings.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kyc_practice_app/core/utils/app_logger.dart';
import 'package:kyc_practice_app/features/onboarding/bloc/pages/identity/identity_bloc.dart';
import 'package:kyc_practice_app/features/onboarding/bloc/pages/identity/identity_event.dart';
import 'package:kyc_practice_app/core/constants/app_space.dart';
import 'package:kyc_practice_app/core/constants/app_sizes.dart';
import 'package:kyc_practice_app/core/widgets/background_template.dart';
import 'package:kyc_practice_app/core/widgets/button.dart';
import 'package:kyc_practice_app/core/widgets/checklist.dart';
import 'package:kyc_practice_app/core/widgets/app_back_bar.dart';
import 'package:kyc_practice_app/core/widgets/illustration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NationalIdClarification extends StatelessWidget {
  const NationalIdClarification({super.key});

  @override
  Widget build(BuildContext context) {
    final ImagePicker picker = ImagePicker();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const AppBackBar(),
      body: Stack(
        children: [
          BackgroundTemplate(
            title: AppStrings.idTitle,
            subtitle: AppStrings.idSubtitle,
            footer: Button(
              text: AppStrings.imReady,
              onPressed: () async {
                final XFile? photo =
                    await picker.pickImage(source: ImageSource.camera);
                if (photo == null || !context.mounted) return;
                appLog.i('National ID photo taken: ${photo.path}');
                context.read<IdentityBloc>().add(IdentitySubmitted());
                Navigator.pop(context);
                Navigator.pop(context);
              },
              borderRadius: BorderRadius.circular(AppSizes.radiusMd),
            ),
            child: Column(
              children: [
                Illustration('assets/images/id_card.png'),
                const Padding(
                  padding: EdgeInsets.only(top: AppSpace.s32),
                  child: Padding(
                    padding: EdgeInsets.only(top: AppSpace.s16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Checklist(
                          text: AppStrings.wellLitRoom,
                        ),
                        Checklist(
                          text: AppStrings.idPlainSurface,
                        ),
                        Checklist(
                          text: AppStrings.idNoGlare,
                        ),
                        Checklist(
                          text: AppStrings.idDetailsClear,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
