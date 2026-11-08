import 'package:kyc_practice_app/core/languages/app_strings.dart';
import 'package:kyc_practice_app/features/onboarding/bloc/pages/work_permit/work_permit_bloc.dart';
import 'package:kyc_practice_app/features/onboarding/bloc/pages/work_permit/work_permit_event.dart';
import 'package:kyc_practice_app/core/constants/app_space.dart';
import 'package:kyc_practice_app/core/constants/app_sizes.dart';
import 'package:kyc_practice_app/core/widgets/background_template.dart';
import 'package:kyc_practice_app/core/widgets/button.dart';
import 'package:kyc_practice_app/core/widgets/checklist.dart';
import 'package:kyc_practice_app/core/widgets/app_back_bar.dart';
import 'package:kyc_practice_app/core/widgets/illustration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kyc_practice_app/core/utils/app_logger.dart';

class OtherDocument extends StatefulWidget {
  const OtherDocument({super.key});

  @override
  State<OtherDocument> createState() => _OtherDocumentState();
}

class _OtherDocumentState extends State<OtherDocument> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const AppBackBar(),
      body: Stack(
        children: [
          BackgroundTemplate(
            title: AppStrings.permitTitle,
            subtitle: AppStrings.permitSubtitle,
            footer: Button(
              text: AppStrings.next,
              onPressed: () async {
                final XFile? photo =
                    await ImagePicker().pickImage(source: ImageSource.camera);
                if (photo == null || !context.mounted) return;
                appLog.i('Work permit photo taken: ${photo.path}');
                context.read<WorkPermitBloc>().add(WorkPermitSubmitted());
                Navigator.pop(context);
              },
              borderRadius: BorderRadius.circular(AppSizes.radiusMd),
            ),
            child: Column(
              children: [
                Illustration('assets/images/work_permit.png'),
                const Padding(
                  padding: EdgeInsets.only(top: AppSpace.s20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Checklist(
                        text: AppStrings.wellLitRoom,
                      ),
                      Checklist(
                        text: AppStrings.signaturePlainSurface,
                      ),
                      Checklist(
                        text: AppStrings.signatureNoGlare,
                      ),
                      Checklist(
                        text: AppStrings.signatureClear,
                      ),
                    ],
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
