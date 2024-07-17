import 'package:form_model/src/enums/error_code.dart';
import 'package:form_model/src/model/form_model_error.dart';
import 'package:form_model/src/model/form_model_validator/form_model_validator.dart';

/// A final class that implements [FormModelValidator] to validate age constraints.
///
/// This validator checks if a given date string (representing a birth date) falls within
/// specified minimum and maximum age limits. If the age is out of the specified range,
/// it returns a [FormModelError] indicating the validation failure.
///
/// The class supports the following validation rules:
/// - Minimum age constraint (`minAge`)
/// - Maximum age constraint (`maxAge`)
final class AgeValidator implements FormModelValidator<String?> {
  /// The minimum allowed age.
  final int? minAge;

  /// The maximum allowed age.
  final int? maxAge;

  /// Creates an [AgeValidator] with optional [minAge] and [maxAge] constraints.
  ///
  /// - Parameters:
  ///   - minAge: The minimum age constraint. If `null`, no minimum age validation is performed.
  ///   - maxAge: The maximum age constraint. If `null`, no maximum age validation is performed.
  const AgeValidator({this.minAge, this.maxAge});

  /// Validates the given [value] to ensure it meets the age constraints.
  ///
  /// This method checks if the [value] can be parsed as a valid date. If so, it calculates
  /// the age based on the current date and compares it against the [minAge] and [maxAge]
  /// constraints. If the age is below the [minAge], a [FormModelError] with code `dateIsLessThanMinAge`
  /// is returned. If the age is above the [maxAge], a [FormModelError] with code `dateIsMoreThanMaxAge`
  /// is returned.
  ///
  /// - Parameter value: A date string representing a birth date.
  /// - Returns: A [FormModelError] if the age validation fails, otherwise `null`.
  @override
  FormModelError<String?>? validate(String? value) {
    if (value != null) {
      final parsedDate = DateTime.tryParse(value);
      if (parsedDate != null) {
        final age = _calculateAge(parsedDate);
        if (minAge != null && age < minAge!) {
          return FormModelError(
              code: ErrorCode.dateIsLessThanMinAge,
              value: value,
              parameter: minAge);
        }
        if (maxAge != null && age > maxAge!) {
          return FormModelError(
              code: ErrorCode.dateIsMoreThanMaxAge,
              value: value,
              parameter: maxAge);
        }
      }
    }
    return null;
  }

  /// Calculates the age based on the given [birthDate].
  ///
  /// This method calculates the age by subtracting the birth year from the current year.
  /// It adjusts the age if the birth date has not occurred yet in the current year.
  ///
  /// - Parameter birthDate: The birth date.
  /// - Returns: The calculated age.
  int _calculateAge(DateTime birthDate) {
    final now = DateTime.now();
    int age = now.year - birthDate.year;
    final birthMonth = birthDate.month;
    final nowMonth = now.month;
    final birthDay = birthDate.day;
    final nowDay = now.day;

    // Check if the birthday hasn't occurred yet this year
    if (nowMonth < birthMonth ||
        (nowMonth == birthMonth && nowDay < birthDay)) {
      age--;
    }

    return age;
  }
}
