import 'package:kyc_practice_app/core/languages/app_strings.dart';

class Validators {
  Validators._();

  static String? required(String? value, String message) {
    if (value == null || value.trim().isEmpty) {
      return message;
    }
    return null;
  }

  static String? age(String? value, String message) {
    if (value == null || value.trim().isEmpty) {
      return message;
    }

    final parts = value.split('/');

    final day = int.tryParse(parts[0]);
    final month = int.tryParse(parts[1]);
    final year = int.tryParse(parts[2]);

    final birthDate = DateTime(year!, month!, day!);
    final now = DateTime.now();
    final age = now.year - birthDate.year;

    if (age < 18 ||
        (age == 18 && now.month < birthDate.month) ||
        (age == 18 &&
            now.month == birthDate.month &&
            now.day < birthDate.day)) {
      return AppStrings.mustBe18;
    }

    return null;
  }
}
