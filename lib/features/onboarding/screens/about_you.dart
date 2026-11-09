import 'package:kyc_practice_app/core/languages/app_strings.dart';
import 'package:flutter/services.dart';
import 'package:kyc_practice_app/features/onboarding/bloc/pages/about_you/about_you_bloc.dart';
import 'package:kyc_practice_app/features/onboarding/bloc/pages/about_you/about_you_event.dart';
import 'package:kyc_practice_app/core/constants/app_space.dart';
import 'package:kyc_practice_app/core/constants/app_sizes.dart';
import 'package:kyc_practice_app/core/theme/app_styles.dart';
import 'package:kyc_practice_app/core/utils/validators.dart';
import 'package:kyc_practice_app/core/widgets/background_template.dart';
import 'package:kyc_practice_app/core/widgets/button.dart';
import 'package:kyc_practice_app/core/widgets/date.dart';
import 'package:kyc_practice_app/core/widgets/input_field.dart';
import 'package:kyc_practice_app/core/widgets/app_back_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AboutYou extends StatefulWidget {
  const AboutYou({super.key});

  @override
  State<AboutYou> createState() => _AboutYouState();
}

class _AboutYouState extends State<AboutYou> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const AppBackBar(),
      body: Stack(
        children: [
          BackgroundTemplate(
            title: AppStrings.aboutYouTitle,
            subtitle: AppStrings.aboutYouSubtitle,
            footer: Button(
              text: AppStrings.next,
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  context.read<AboutYouBloc>().add(AboutYouSubmitted());
                  Navigator.pop(context);
                }
              },
              borderRadius: BorderRadius.circular(AppSizes.radiusMd),
            ),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  InputField(
                    hintText: AppStrings.nationalIdNumber,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[vV0-9]'))
                    ],
                    validator: (value) => Validators.required(
                        value, AppStrings.nationalIdNumberRequired),
                  ),
                  AppSpace.h20,
                  InputField(
                    hintText: AppStrings.firstName,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]'))
                    ],
                    validator: (value) => Validators.required(
                        value, AppStrings.firstNameRequired),
                  ),
                  AppSpace.h20,
                  InputField(
                    hintText: AppStrings.lastName,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]'))
                    ],
                    validator: (value) =>
                        Validators.required(value, AppStrings.lastNameRequired),
                  ),
                  AppSpace.h24,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(AppStrings.optional, style: AppStyles.body(context)),
                    ],
                  ),
                  AppSpace.h8,
                  const InputField(hintText: AppStrings.otherNames),
                  AppSpace.h20,
                  Date(
                      hintText: AppStrings.dateOfBirth,
                      validator: (value) => Validators.age(
                          value, AppStrings.dateOfBirthRequired)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
