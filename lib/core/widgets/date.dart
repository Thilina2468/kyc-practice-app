import 'package:flutter/material.dart';
import 'package:kyc_practice_app/core/constants/app_colors.dart';
import 'package:kyc_practice_app/core/constants/app_sizes.dart';
import 'package:kyc_practice_app/core/constants/app_space.dart';
import 'package:kyc_practice_app/core/theme/app_styles.dart';

class Date extends StatefulWidget {
  final String hintText;
  final String? Function(String?)? validator;

  const Date({super.key, required this.hintText, this.validator});

  @override
  State<Date> createState() => _DateState();
}

class _DateState extends State<Date> {
  final TextEditingController _controller = TextEditingController();
  final DateTime now = DateTime.now();
  final DateTime latestAllowed = DateTime(
    DateTime.now().year - 18,
    DateTime.now().month,
    DateTime.now().day,
  );
  DateTime? _pickedDate;

  Future<void> _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _pickedDate ?? DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: latestAllowed,
    );
    if (picked != null) {
      final String day = picked.day.toString().padLeft(2, '0');
      final String month = picked.month.toString().padLeft(2, '0');
      setState(() {
        _pickedDate = picked;
        _controller.text = '$day/$month/${picked.year}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: _controller,
      readOnly: true,
      onTap: _pickDate,
      decoration: InputDecoration(
        constraints: const BoxConstraints(minHeight: AppSizes.inputHeight),
        contentPadding: const EdgeInsets.all(AppSizes.inputPadding),
        filled: true,
        fillColor: AppColors.white,
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(AppSizes.radiusMd)),
          borderSide: BorderSide(color: AppColors.border),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(AppSizes.radiusMd)),
          borderSide: BorderSide(color: AppColors.borderFocused),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(AppSizes.radiusMd)),
          borderSide: BorderSide(color: AppColors.error),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(AppSizes.radiusMd)),
          borderSide: BorderSide(
              color: AppColors.error, width: AppSizes.borderWidthThick),
        ),
        labelText: widget.hintText,
        labelStyle: AppStyles.bodyLarge(context),
        suffixIcon: Padding(
          padding: const EdgeInsets.all(AppSpace.s12),
          child: Image.asset(
            'assets/images/icon_calendar.png',
            width: AppSizes.iconMd,
            height: AppSizes.iconMd,
          ),
        ),
      ),
    );
  }
}
