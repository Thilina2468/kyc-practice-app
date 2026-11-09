import 'package:kyc_practice_app/core/languages/app_strings.dart';
import 'package:kyc_practice_app/core/utils/app_logger.dart';
import 'package:kyc_practice_app/features/onboarding/screens/national_id_clarification.dart';
import 'package:kyc_practice_app/core/constants/app_space.dart';
import 'package:kyc_practice_app/core/constants/app_sizes.dart';
import 'package:kyc_practice_app/core/widgets/background_template.dart';
import 'package:kyc_practice_app/core/widgets/button.dart';
import 'package:kyc_practice_app/core/widgets/checklist.dart';
import 'package:kyc_practice_app/core/widgets/app_back_bar.dart';
import 'package:kyc_practice_app/core/widgets/illustration.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class IdentityClarification extends StatefulWidget {
  const IdentityClarification({super.key});

  @override
  State<IdentityClarification> createState() => _IdentityClarificationState();
}

class _IdentityClarificationState extends State<IdentityClarification> {
  @override
  Widget build(BuildContext context) {
    final ImagePicker picker = ImagePicker();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const AppBackBar(),
      body: Stack(children: [
        BackgroundTemplate(
            title: AppStrings.selfieTitle,
            subtitle: AppStrings.selfieSubtitle,
            footer: Button(
              text: AppStrings.imReady,
              onPressed: () async {
                final XFile? photo =
                    await picker.pickImage(source: ImageSource.camera);
                if (photo == null || !context.mounted) return;
                appLog.i('Selfie taken: ${photo.path}');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NationalIdClarification(),
                  ),
                );
              },
              borderRadius: BorderRadius.circular(AppSizes.radiusMd),
            ),
            child: const Column(
              children: [
                Illustration('assets/images/selfie_guide.png'),
                Padding(
                  padding: EdgeInsets.only(top: AppSpace.s32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Checklist(
                        text: AppStrings.wellLitRoom,
                      ),
                      Checklist(
                        text: AppStrings.selfieSeeYouClearly,
                      ),
                      Checklist(
                        text: AppStrings.selfieRemoveCover,
                      ),
                      Checklist(
                        text: AppStrings.selfieLookAtCamera,
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ]),
    );
  }
}
