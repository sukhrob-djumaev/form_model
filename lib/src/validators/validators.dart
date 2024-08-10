import 'package:flutter/foundation.dart';
import 'package:form_model/src/errors/form_error_key.dart';
import 'package:form_model/src/errors/predefined_form_error_type.dart';

/// A sealed class representing a form model validator.
///
/// This class serves as a base for all form model validators. It defines a common
/// interface for validators that can be used with form models to validate user input.
///
/// The type parameter [T] represents the type of value that this validator can validate.
/// It must be a non-nullable object type.
///
/// Example:
/// ```dart
/// class MyCustomValidator extends IFormModelValidator<String> {
///   @override
///   FormErrorKey? validate(String? value) {
///     // Custom validation logic here
///   }
/// }
/// ```
sealed class IFormModelValidator<T extends Object> {
  /// Creates a new instance of [IFormModelValidator].
  ///
  /// This constructor is `const` to allow for compile-time constant instances
  /// of validators.
  const IFormModelValidator();

  /// Validates the given [value] and returns a [FormErrorKey] if validation fails.
  ///
  /// This method should be implemented by subclasses to provide specific
  /// validation logic. It takes a nullable [value] of type [T] and returns
  /// a [FormErrorKey] if the validation fails, or `null` if the validation passes.
  ///
  /// Returns:
  ///   - A [FormErrorKey] instance if the validation fails.
  ///   - `null` if the validation passes or if [value] is `null`.
  ///
  /// Example implementation:
  /// ```dart
  /// @override
  /// FormErrorKey? validate(String? value) {
  ///   if (value == null || value.isEmpty) {
  ///     return const PredefinedFormErrorKey(PredefinedFormErrorType.required);
  ///   }
  ///   return null;
  /// }
  /// ```
  FormErrorKey? validate(T? value);
}

/// A validator that checks if a value is not null and not empty (for strings).
///
/// This validator implements [IFormModelValidator] and is used to ensure that a
/// required field has a value. For string values, it also checks if the string
/// is not empty.
///
/// The type parameter [T] represents the type of value that this validator can validate.
/// It must be a non-nullable object type.
///
/// Example usage:
/// ```dart
/// final requiredValidator = RequiredValidator<String>();
/// final result = requiredValidator.validate('');
/// print(result); // PredefinedFormErrorKey(PredefinedFormErrorType.required)
/// ```
final class RequiredValidator<T extends Object>
    implements IFormModelValidator<T> {
  /// Creates a new instance of [RequiredValidator].
  ///
  /// This constructor is `const` to allow for compile-time constant instances
  /// of the validator.
  const RequiredValidator();

  /// Validates the given [value] to ensure it is not null and not empty (for strings).
  ///
  /// Returns:
  ///   - A [PredefinedFormErrorKey] with type [PredefinedFormErrorType.required]
  ///     if the value is null or an empty string.
  ///   - `null` if the validation passes.
  ///
  /// Note: For non-string types, this validator only checks for null values.
  @override
  FormErrorKey? validate(value) {
    if (value == null || (value is String && value.isEmpty)) {
      return const PredefinedFormErrorKey(PredefinedFormErrorType.required);
    }
    return null;
  }

  /// Compares this [RequiredValidator] with another object for equality.
  ///
  /// Two [RequiredValidator]s are considered equal if they have the same
  /// runtime type. This is useful for comparing validators in collections
  /// or when implementing caching strategies.
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RequiredValidator && runtimeType == other.runtimeType);

  /// Generates a hash code for this [RequiredValidator].
  ///
  /// The hash code is based on the runtime type and the type parameter [T].
  /// This ensures that validators with different type parameters have
  /// different hash codes.
  @override
  int get hashCode => runtimeType.hashCode ^ T.hashCode;
}

/// A sealed class representing a form model validator.
/// [Previous documentation for IFormModelValidator remains unchanged]

/// A validator that checks if a value is not null and not empty (for strings).
/// [Previous documentation for RequiredValidator remains unchanged]

/// A validator that checks if a string value has at least a specified minimum length.
///
/// This validator implements [IFormModelValidator] and is used to ensure that a
/// string field has a minimum number of characters.
///
/// Example usage:
/// ```dart
/// final minLengthValidator = StringMinLengthValidator(minLength: 5);
/// final result = minLengthValidator.validate('abcd');
/// print(result); // PredefinedFormErrorKey(PredefinedFormErrorType.lengthIsLessThanMin, 5)
/// ```
class StringMinLengthValidator extends IFormModelValidator<String> {
  /// The minimum length required for the string value.
  final int minLength;

  /// Creates a new instance of [StringMinLengthValidator].
  ///
  /// The [minLength] parameter specifies the minimum number of characters
  /// required for the string to be considered valid.
  const StringMinLengthValidator({required this.minLength});

  /// Validates the given [value] to ensure it has at least [minLength] characters.
  ///
  /// Returns:
  ///   - A [PredefinedFormErrorKey] with type [PredefinedFormErrorType.lengthIsLessThanMin]
  ///     if the string length is less than [minLength].
  ///   - `null` if the validation passes or if [value] is `null`.
  ///
  /// Note: This validator does not consider `null` values as invalid.
  @override
  FormErrorKey? validate(value) {
    if (value != null) {
      if (value.length < minLength) {
        return PredefinedFormErrorKey(
            PredefinedFormErrorType.lengthIsLessThanMin, minLength);
      }
    }
    return null;
  }

  /// Compares this [StringMinLengthValidator] with another object for equality.
  ///
  /// Two [StringMinLengthValidator]s are considered equal if they have the same
  /// runtime type and the same [minLength] value.
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StringMinLengthValidator &&
          runtimeType == other.runtimeType &&
          minLength == other.minLength);

  /// Generates a hash code for this [StringMinLengthValidator].
  ///
  /// The hash code is based on the [minLength] value.
  @override
  int get hashCode => minLength.hashCode;
}

/// A validator that checks if a value is not null and not empty (for strings).
/// [Previous documentation for RequiredValidator remains unchanged]

/// A validator that checks if a string value has at least a specified minimum length.
/// [Previous documentation for StringMinLengthValidator remains unchanged]

/// A validator that checks if a string value does not exceed a specified maximum length.
///
/// This validator implements [IFormModelValidator] and is used to ensure that a
/// string field does not have more than a specified number of characters.
///
/// Example usage:
/// ```dart
/// final maxLengthValidator = StringMaxLengthValidator(maxLength: 10);
/// final result = maxLengthValidator.validate('This is too long');
/// print(result); // PredefinedFormErrorKey(PredefinedFormErrorType.lengthIsMoreThanMax, 10)
/// ```
class StringMaxLengthValidator extends IFormModelValidator<String> {
  /// The maximum length allowed for the string value.
  final int maxLength;

  /// Creates a new instance of [StringMaxLengthValidator].
  ///
  /// The [maxLength] parameter specifies the maximum number of characters
  /// allowed for the string to be considered valid.
  const StringMaxLengthValidator({required this.maxLength});

  /// Validates the given [value] to ensure it does not exceed [maxLength] characters.
  ///
  /// Returns:
  ///   - A [PredefinedFormErrorKey] with type [PredefinedFormErrorType.lengthIsMoreThanMax]
  ///     if the string length is greater than [maxLength].
  ///   - `null` if the validation passes or if [value] is `null`.
  ///
  /// Note: This validator does not consider `null` values as invalid.
  @override
  FormErrorKey? validate(value) {
    if (value != null) {
      if (value.length > maxLength) {
        return PredefinedFormErrorKey(
            PredefinedFormErrorType.lengthIsMoreThanMax, maxLength);
      }
    }
    return null;
  }

  /// Compares this [StringMaxLengthValidator] with another object for equality.
  ///
  /// Two [StringMaxLengthValidator]s are considered equal if they have the same
  /// runtime type and the same [maxLength] value.
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StringMaxLengthValidator &&
          runtimeType == other.runtimeType &&
          maxLength == other.maxLength);

  /// Generates a hash code for this [StringMaxLengthValidator].
  ///
  /// The hash code is based on the [maxLength] value.
  @override
  int get hashCode => maxLength.hashCode;
}

/// A validator that allows custom validation logic for string values.
///
/// This validator implements [IFormModelValidator] and provides flexibility
/// to define custom validation rules for string inputs.
///
/// Example usage:
/// ```dart
/// final customValidator = StringCustomValidator(
///   validator: (value) => value?.contains('@') ?? false
///     ? null
///     : 'Email must contain @'
/// );
/// final result = customValidator.validate('invalid-email');
/// print(result); // CustomFormErrorKey('Email must contain @')
/// ```
class StringCustomValidator extends IFormModelValidator<String> {
  /// The custom validation function.
  ///
  /// This function takes a nullable String and returns a String if validation
  /// fails, or null if validation passes.
  final String? Function(String? value) validator;

  /// Creates a new instance of [StringCustomValidator].
  ///
  /// The [validator] parameter is a function that implements the custom
  /// validation logic.
  const StringCustomValidator({required this.validator});

  /// Validates the given [value] using the custom validation function.
  ///
  /// Returns:
  ///   - A [CustomFormErrorKey] with the error message returned by the custom
  ///     validation function if validation fails.
  ///   - `null` if the validation passes.
  @override
  FormErrorKey? validate(String? value) {
    final errorKey = validator(value);
    if (errorKey != null) return CustomFormErrorKey(errorKey);
    return null;
  }

  /// Compares this [StringCustomValidator] with another object for equality.
  ///
  /// Two [StringCustomValidator]s are considered equal if they have the same
  /// runtime type and the same validator function.
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StringCustomValidator &&
          runtimeType == other.runtimeType &&
          validator == other.validator);

  /// Generates a hash code for this [StringCustomValidator].
  ///
  /// The hash code is based on the runtime type and the validator function.
  @override
  int get hashCode => Object.hash(runtimeType, validator);
}

/// A validator that checks if a date string represents an age that is at least a specified minimum.
///
/// This validator implements [IFormModelValidator] and is used to ensure that a
/// date string, when parsed to a DateTime, represents an age that is not less than
/// the specified minimum age.
///
/// Example usage:
/// ```dart
/// final ageValidator = StringDateTimeAgeMinValidator(minAge: 18);
/// final result = ageValidator.validate('2010-01-01'); // Assuming current year is 2023
/// print(result); // PredefinedFormErrorKey(PredefinedFormErrorType.dateIsLessThanMinAge, 18)
/// ```
final class StringDateTimeAgeMinValidator
    implements IFormModelValidator<String> {
  /// The minimum age required.
  final int minAge;

  /// Creates a new instance of [StringDateTimeAgeMinValidator].
  ///
  /// The [minAge] parameter specifies the minimum age required for the date to be valid.
  const StringDateTimeAgeMinValidator({required this.minAge});

  /// Validates the given [value] to ensure it represents an age not less than [minAge].
  ///
  /// Returns:
  ///   - A [PredefinedFormErrorKey] with type [PredefinedFormErrorType.dateIsLessThanMinAge]
  ///     if the calculated age is less than [minAge].
  ///   - `null` if the validation passes, the [value] is `null`, or the date is invalid.
  @override
  FormErrorKey? validate(String? value) {
    if (value != null) {
      final parsedDate = DateTime.tryParse(value);
      if (parsedDate != null) {
        final age = _calculateAge(parsedDate);
        if (age < minAge) {
          return PredefinedFormErrorKey(
              PredefinedFormErrorType.dateIsLessThanMinAge, minAge);
        }
      }
    }
    return null;
  }

  /// Calculates the age based on the given [birthDate].
  ///
  /// This is a private helper method used by the [validate] method.
  int _calculateAge(DateTime birthDate) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    var age = today.year - birthDate.year;
    if (today.month < birthDate.month ||
        (today.month == birthDate.month && today.day < birthDate.day)) {
      age--;
    }
    return age;
  }

  /// Compares this [StringDateTimeAgeMinValidator] with another object for equality.
  ///
  /// Two [StringDateTimeAgeMinValidator]s are considered equal if they have the same
  /// runtime type and the same [minAge] value.
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StringDateTimeAgeMinValidator &&
          runtimeType == other.runtimeType &&
          minAge == other.minAge);

  /// Generates a hash code for this [StringDateTimeAgeMinValidator].
  ///
  /// The hash code is based on the [minAge] value.
  @override
  int get hashCode => minAge.hashCode;
}

/// A validator that checks if a date string represents an age that is not more than a specified maximum.
///
/// This validator implements [IFormModelValidator] and is used to ensure that a
/// date string, when parsed to a DateTime, represents an age that does not exceed
/// the specified maximum age.
///
/// Example usage:
/// ```dart
/// final ageValidator = StringDateTimeAgeMaxValidator(maxAge: 65);
/// final result = ageValidator.validate('1950-01-01'); // Assuming current year is 2023
/// print(result); // PredefinedFormErrorKey(PredefinedFormErrorType.dateIsMoreThanMaxAge, 65)
/// ```
final class StringDateTimeAgeMaxValidator
    implements IFormModelValidator<String> {
  /// The maximum age allowed.
  final int maxAge;

  /// Creates a new instance of [StringDateTimeAgeMaxValidator].
  ///
  /// The [maxAge] parameter specifies the maximum age allowed for the date to be valid.
  const StringDateTimeAgeMaxValidator({required this.maxAge});

  /// Validates the given [value] to ensure it represents an age not exceeding [maxAge].
  ///
  /// Returns:
  ///   - A [PredefinedFormErrorKey] with type [PredefinedFormErrorType.dateIsMoreThanMaxAge]
  ///     if the calculated age is greater than or equal to [maxAge].
  ///   - `null` if the validation passes, the [value] is `null`, or the date is invalid.
  @override
  FormErrorKey? validate(String? value) {
    if (value != null) {
      final parsedDate = DateTime.tryParse(value);
      if (parsedDate != null) {
        final age = _calculateAge(parsedDate);
        if (age > maxAge) {
          return PredefinedFormErrorKey(
              PredefinedFormErrorType.dateIsMoreThanMaxAge, maxAge);
        }
      }
    }
    return null;
  }

  /// Calculates the age based on the given [birthDate].
  ///
  /// This is a private helper method used by the [validate] method.
  int _calculateAge(DateTime birthDate) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    var age = today.year - birthDate.year;
    if (today.month < birthDate.month ||
        (today.month == birthDate.month && today.day < birthDate.day)) {
      age--;
    }
    return age;
  }

  /// Compares this [StringDateTimeAgeMaxValidator] with another object for equality.
  ///
  /// Two [StringDateTimeAgeMaxValidator]s are considered equal if they have the same
  /// runtime type and the same [maxAge] value.
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StringDateTimeAgeMaxValidator &&
          runtimeType == other.runtimeType &&
          maxAge == other.maxAge);

  /// Generates a hash code for this [StringDateTimeAgeMaxValidator].
  ///
  /// The hash code is based on the [maxAge] value.
  @override
  int get hashCode => maxAge.hashCode;
}

/// A validator that checks if a boolean value is true, typically used for terms and conditions agreement.
///
/// This validator implements [IFormModelValidator] and is used to ensure that
/// a user has agreed to terms and conditions by checking if a boolean value is true.
///
/// Example usage:
/// ```dart
/// final agreeValidator = BoolAgreeToTermsAndConditionsValidator();
/// final result = agreeValidator.validate(false);
/// print(result); // PredefinedFormErrorKey(PredefinedFormErrorType.boolAgreeToTerms)
/// ```
final class BoolAgreeToTermsAndConditionsValidator
    implements IFormModelValidator<bool> {
  /// Creates a new instance of [BoolAgreeToTermsAndConditionsValidator].
  const BoolAgreeToTermsAndConditionsValidator();

  /// Validates the given [value] to ensure it is true.
  ///
  /// Returns:
  ///   - A [PredefinedFormErrorKey] with type [PredefinedFormErrorType.boolAgreeToTerms]
  ///     if the value is not true.
  ///   - `null` if the validation passes (i.e., the value is true).
  @override
  FormErrorKey? validate(bool? value) {
    if (value != true) {
      return const PredefinedFormErrorKey(
          PredefinedFormErrorType.boolAgreeToTerms);
    }
    return null;
  }

  /// Compares this [BoolAgreeToTermsAndConditionsValidator] with another object for equality.
  ///
  /// Two [BoolAgreeToTermsAndConditionsValidator]s are considered equal if they have the same
  /// runtime type. This is because this validator has no configurable properties.
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BoolAgreeToTermsAndConditionsValidator &&
          runtimeType == other.runtimeType);

  /// Generates a hash code for this [BoolAgreeToTermsAndConditionsValidator].
  ///
  /// The hash code is based on the runtime type of the validator.
  @override
  int get hashCode => runtimeType.hashCode;
}

/// A validator that checks if a boolean value is false.
///
/// This validator implements [IFormModelValidator] and is used to ensure that
/// a boolean value is false. This can be useful in scenarios where you want to
/// validate that a certain condition is not met or a feature is not enabled.
///
/// Example usage:
/// ```dart
/// final falseValidator = BoolFalseValidator();
/// final result = falseValidator.validate(true);
/// print(result); // PredefinedFormErrorKey(PredefinedFormErrorType.boolShouldBeFalse)
/// ```
final class BoolFalseValidator implements IFormModelValidator<bool> {
  /// Creates a new instance of [BoolFalseValidator].
  const BoolFalseValidator();

  /// Validates the given [value] to ensure it is false.
  ///
  /// Returns:
  ///   - A [PredefinedFormErrorKey] with type [PredefinedFormErrorType.boolShouldBeFalse]
  ///     if the value is not false.
  ///   - `null` if the validation passes (i.e., the value is false).
  @override
  FormErrorKey? validate(bool? value) {
    if (value != false) {
      return const PredefinedFormErrorKey(
          PredefinedFormErrorType.boolShouldBeFalse);
    }
    return null;
  }

  /// Compares this [BoolFalseValidator] with another object for equality.
  ///
  /// Two [BoolFalseValidator]s are considered equal if they have the same
  /// runtime type. This is because this validator has no configurable properties.
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BoolFalseValidator && runtimeType == other.runtimeType);

  /// Generates a hash code for this [BoolFalseValidator].
  ///
  /// The hash code is based on the runtime type of the validator.
  @override
  int get hashCode => runtimeType.hashCode;
}

/// A validator that checks if a boolean value is true.
///
/// This validator implements [IFormModelValidator] and is used to ensure that
/// a boolean value is true. This can be useful in scenarios where you want to
/// validate that a certain condition is met or a feature is enabled.
///
/// Example usage:
/// ```dart
/// final trueValidator = BoolTrueValidator();
/// final result = trueValidator.validate(false);
/// print(result); // PredefinedFormErrorKey(PredefinedFormErrorType.boolShouldBeTrue)
/// ```
final class BoolTrueValidator implements IFormModelValidator<bool> {
  /// Creates a new instance of [BoolTrueValidator].
  const BoolTrueValidator();

  /// Validates the given [value] to ensure it is true.
  ///
  /// Returns:
  ///   - A [PredefinedFormErrorKey] with type [PredefinedFormErrorType.boolShouldBeTrue]
  ///     if the value is not true.
  ///   - `null` if the validation passes (i.e., the value is true).
  @override
  FormErrorKey? validate(bool? value) {
    if (value != true) {
      return const PredefinedFormErrorKey(
          PredefinedFormErrorType.boolShouldBeTrue);
    }
    return null;
  }

  /// Compares this [BoolTrueValidator] with another object for equality.
  ///
  /// Two [BoolTrueValidator]s are considered equal if they have the same
  /// runtime type. This is because this validator has no configurable properties.
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BoolTrueValidator && runtimeType == other.runtimeType);

  /// Generates a hash code for this [BoolTrueValidator].
  ///
  /// The hash code is based on the runtime type of the validator.
  @override
  int get hashCode => runtimeType.hashCode;
}

/// A validator that checks if a string represents a valid credit card number.
///
/// This validator implements [IFormModelValidator] and uses the Luhn algorithm
/// to validate credit card numbers. It can be used to ensure that a given string
/// is a potentially valid credit card number.
///
/// Example usage:
/// ```dart
/// final ccValidator = StringCreditCardValidator();
/// final result = ccValidator.validate('1234567890123456');
/// print(result); // PredefinedFormErrorKey(PredefinedFormErrorType.intIsNotValidCreditCard)
/// ```
final class StringCreditCardValidator implements IFormModelValidator<String> {
  /// Creates a new instance of [StringCreditCardValidator].
  const StringCreditCardValidator();

  /// Validates the given [value] to ensure it's a valid credit card number.
  ///
  /// This method uses the Luhn algorithm to check the validity of the credit card number.
  ///
  /// Returns:
  ///   - A [PredefinedFormErrorKey] with type [PredefinedFormErrorType.intIsNotValidCreditCard]
  ///     if the value is not a valid credit card number.
  ///   - `null` if the validation passes or if [value] is `null`.
  @override
  FormErrorKey? validate(String? value) {
    if (value != null) {
      if (!_luhnCheck(value)) {
        return const PredefinedFormErrorKey(
            PredefinedFormErrorType.intIsNotValidCreditCard);
      }
    }
    return null;
  }

  /// Performs the Luhn algorithm check on the given number.
  ///
  /// This is a private helper method used by the [validate] method.
  bool _luhnCheck(String number) {
    int sum = 0;
    bool alternate = false;
    for (int i = number.length - 1; i >= 0; i--) {
      int n = int.parse(number[i]);
      if (alternate) {
        n *= 2;
        if (n > 9) {
          n -= 9;
        }
      }
      sum += n;
      alternate = !alternate;
    }
    return sum % 10 == 0;
  }

  /// Compares this [StringCreditCardValidator] with another object for equality.
  ///
  /// Two [StringCreditCardValidator]s are considered equal if they have the same
  /// runtime type. This is because this validator has no configurable properties.
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StringCreditCardValidator && runtimeType == other.runtimeType);

  /// Generates a hash code for this [StringCreditCardValidator].
  ///
  /// The hash code is based on the runtime type of the validator.
  @override
  int get hashCode => runtimeType.hashCode;
}

/// A generic validator that checks if a value is equal to a specified value.
///
/// This validator implements [IFormModelValidator] and can be used with any type
/// that extends Object. It compares the input value with a specified value for equality.
///
/// Example usage:
/// ```dart
/// final equalValidator = CustomEqualValidator<int>(equalValue: 42);
/// final result = equalValidator.validate(41);
/// print(result); // PredefinedFormErrorKey(PredefinedFormErrorType.isNotEqualTo, 42)
/// ```
final class CustomEqualValidator<T extends Object>
    implements IFormModelValidator<T> {
  /// The value to which the input should be equal.
  final T equalValue;

  /// Creates a new instance of [CustomEqualValidator].
  ///
  /// The [equalValue] parameter specifies the value to which the input should be equal.
  const CustomEqualValidator({required this.equalValue});

  /// Validates the given [value] to ensure it's equal to [equalValue].
  ///
  /// Returns:
  ///   - A [PredefinedFormErrorKey] with type [PredefinedFormErrorType.isNotEqualTo]
  ///     if the value is not equal to [equalValue].
  ///   - `null` if the validation passes or if [value] is `null`.
  @override
  FormErrorKey? validate(T? value) {
    if (value != null) {
      if (value != equalValue) {
        return PredefinedFormErrorKey(
            PredefinedFormErrorType.isNotEqualTo, equalValue);
      }
    }
    return null;
  }

  /// Compares this [CustomEqualValidator] with another object for equality.
  ///
  /// Two [CustomEqualValidator]s are considered equal if they have the same
  /// runtime type and the same [equalValue].
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CustomEqualValidator<T> &&
          runtimeType == other.runtimeType &&
          equalValue == other.equalValue);

  /// Generates a hash code for this [CustomEqualValidator].
  ///
  /// The hash code is based on the runtime type and the [equalValue].
  @override
  int get hashCode => Object.hash(runtimeType, equalValue);
}

/// A validator that checks if a string matches a specified regular expression pattern.
///
/// This validator implements [IFormModelValidator] and is used to ensure that
/// a string value matches a custom regular expression pattern.
///
/// Example usage:
/// ```dart
/// final patternValidator = StringCustomPatternValidator(pattern: RegExp(r'^[A-Z]{3}\d{3}$'));
/// final result = patternValidator.validate('ABC123');
/// print(result); // null (validation passes)
/// print(patternValidator.validate('abc123')); // PredefinedFormErrorKey(PredefinedFormErrorType.didNotMatchPattern, ...)
/// ```
final class StringCustomPatternValidator
    implements IFormModelValidator<String> {
  /// The regular expression pattern to match against.
  final RegExp pattern;

  /// Creates a new instance of [StringCustomPatternValidator].
  ///
  /// The [pattern] parameter specifies the regular expression to use for validation.
  const StringCustomPatternValidator({required this.pattern});

  /// Validates the given [value] to ensure it matches the specified [pattern].
  ///
  /// Returns:
  ///   - A [PredefinedFormErrorKey] with type [PredefinedFormErrorType.didNotMatchPattern]
  ///     if the value does not match the pattern.
  ///   - `null` if the validation passes or if [value] is `null`.
  @override
  FormErrorKey? validate(String? value) {
    if (value != null) {
      if (!pattern.hasMatch(value)) {
        return PredefinedFormErrorKey(
            PredefinedFormErrorType.didNotMatchPattern, pattern);
      }
    }
    return null;
  }

  /// Compares this [StringCustomPatternValidator] with another object for equality.
  ///
  /// Two [StringCustomPatternValidator]s are considered equal if they have the same
  /// runtime type and the same pattern.
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StringCustomPatternValidator &&
          runtimeType == other.runtimeType &&
          pattern.pattern == other.pattern.pattern);

  /// Generates a hash code for this [StringCustomPatternValidator].
  ///
  /// The hash code is based on the pattern's string representation.
  @override
  int get hashCode => pattern.pattern.hashCode;
}

/// A validator that checks if a string represents a valid date and time.
///
/// This validator implements [IFormModelValidator] and is used to ensure that
/// a string can be parsed into a valid DateTime object.
///
/// Example usage:
/// ```dart
/// final dateValidator = DateTimeValidator();
/// final result = dateValidator.validate('2023-05-15T14:30:00');
/// print(result); // null (validation passes)
/// print(dateValidator.validate('not a date')); // PredefinedFormErrorKey(PredefinedFormErrorType.isNotValidDateTime)
/// ```
final class DateTimeValidator implements IFormModelValidator<String> {
  /// Creates a new instance of [DateTimeValidator].
  const DateTimeValidator();

  /// Validates the given [value] to ensure it can be parsed as a valid DateTime.
  ///
  /// Returns:
  ///   - A [PredefinedFormErrorKey] with type [PredefinedFormErrorType.isNotValidDateTime]
  ///     if the value cannot be parsed as a valid DateTime.
  ///   - `null` if the validation passes or if [value] is `null`.
  @override
  FormErrorKey? validate(String? value) {
    if (value != null) {
      final parsedDate = DateTime.tryParse(value);
      if (parsedDate == null) {
        return const PredefinedFormErrorKey(
            PredefinedFormErrorType.isNotValidDateTime);
      }
    }
    return null;
  }

  /// Compares this [DateTimeValidator] with another object for equality.
  ///
  /// Two [DateTimeValidator]s are considered equal if they have the same
  /// runtime type. This is because this validator has no configurable properties.
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DateTimeValidator && runtimeType == other.runtimeType);

  /// Generates a hash code for this [DateTimeValidator].
  ///
  /// The hash code is based on the runtime type of the validator.
  @override
  int get hashCode => runtimeType.hashCode;
}

/// A validator that checks if a string represents a valid email address.
///
/// This validator implements [IFormModelValidator] and uses a regular expression
/// to validate email addresses. It checks for a basic email format but does not
/// verify the actual existence of the email address.
///
/// Example usage:
/// ```dart
/// final emailValidator = EmailValidator();
/// final result = emailValidator.validate('user@example.com');
/// print(result); // null (validation passes)
/// print(emailValidator.validate('invalid-email')); // PredefinedFormErrorKey(PredefinedFormErrorType.isNotValidEmail)
/// ```
final class EmailValidator implements IFormModelValidator<String> {
  /// Creates a new instance of [EmailValidator].
  const EmailValidator();

  /// Regular expression pattern for basic email validation.
  static final _emailRegex =
      RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

  /// Validates the given [value] to ensure it's a valid email address.
  ///
  /// Returns:
  ///   - A [PredefinedFormErrorKey] with type [PredefinedFormErrorType.isNotValidEmail]
  ///     if the value is not a valid email address.
  ///   - `null` if the validation passes or if [value] is `null`.
  @override
  FormErrorKey? validate(String? value) {
    if (value != null) {
      if (!_emailRegex.hasMatch(value)) {
        return const PredefinedFormErrorKey(
            PredefinedFormErrorType.isNotValidEmail);
      }
    }
    return null;
  }

  /// Compares this [EmailValidator] with another object for equality.
  ///
  /// Two [EmailValidator]s are considered equal if they have the same
  /// runtime type. This is because this validator has no configurable properties.
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EmailValidator && runtimeType == other.runtimeType);

  /// Generates a hash code for this [EmailValidator].
  ///
  /// The hash code is based on the runtime type of the validator.
  @override
  int get hashCode => runtimeType.hashCode;
}

/// A validator that checks if a string has an exact specified length.
///
/// This validator implements [IFormModelValidator] and is used to ensure that
/// a string value has exactly the specified number of characters.
///
/// Example usage:
/// ```dart
/// final lengthValidator = EqualLengthValidator(length: 5);
/// final result = lengthValidator.validate('12345');
/// print(result); // null (validation passes)
/// print(lengthValidator.validate('1234')); // PredefinedFormErrorKey(PredefinedFormErrorType.lengthIsNotEqual, 5)
/// ```
final class EqualLengthValidator implements IFormModelValidator<String> {
  /// The exact length the string should have.
  ///
  /// If null, the validator will always pass.
  final int? length;

  /// Creates a new instance of [EqualLengthValidator].
  ///
  /// The [length] parameter specifies the exact length the string should have.
  /// If [length] is null, the validator will always pass.
  const EqualLengthValidator({this.length});

  /// Validates the given [value] to ensure it has exactly [length] characters.
  ///
  /// Returns:
  ///   - A [PredefinedFormErrorKey] with type [PredefinedFormErrorType.lengthIsNotEqual]
  ///     if the value's length is not equal to [length].
  ///   - `null` if the validation passes, if [value] is `null`, or if [length] is `null`.
  @override
  FormErrorKey? validate(String? value) {
    if (value != null) {
      if (length != null) {
        if (value.length != length!) {
          return PredefinedFormErrorKey(
              PredefinedFormErrorType.lengthIsNotEqual, length);
        }
      }
    }
    return null;
  }

  /// Compares this [EqualLengthValidator] with another object for equality.
  ///
  /// Two [EqualLengthValidator]s are considered equal if they have the same
  /// runtime type and the same [length] value.
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EqualLengthValidator &&
          runtimeType == other.runtimeType &&
          length == other.length);

  /// Generates a hash code for this [EqualLengthValidator].
  ///
  /// The hash code is based on the [length] value.
  @override
  int get hashCode => length.hashCode;
}

/// A validator that checks if a string represents a valid IPv4 address.
///
/// This validator implements [IFormModelValidator] and uses a regular expression
/// to validate IPv4 addresses. It also checks for leading zeros in octets, which
/// are not allowed in standard IPv4 notation.
///
/// Example usage:
/// ```dart
/// final ipValidator = IpAddressValidator();
/// final result = ipValidator.validate('192.168.0.1');
/// print(result); // null (validation passes)
/// print(ipValidator.validate('256.1.2.3')); // PredefinedFormErrorKey(PredefinedFormErrorType.isNotValidIpAddress)
/// ```
final class IpAddressValidator implements IFormModelValidator<String> {
  /// Creates a new instance of [IpAddressValidator].
  const IpAddressValidator();

  /// Regular expression pattern for IPv4 address validation.
  static final _ipv4Pattern = RegExp(
      r'^(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)(\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)){3}$');

  /// Validates the given [value] to ensure it's a valid IPv4 address.
  ///
  /// Returns:
  ///   - A [PredefinedFormErrorKey] with type [PredefinedFormErrorType.isNotValidIpAddress]
  ///     if the value is not a valid IPv4 address or contains octets with leading zeros.
  ///   - `null` if the validation passes or if [value] is `null`.
  @override
  FormErrorKey? validate(String? value) {
    if (value != null) {
      if (!_ipv4Pattern.hasMatch(value)) {
        return const PredefinedFormErrorKey(
            PredefinedFormErrorType.isNotValidIpAddress);
      }

      // Additional check for leading zeros
      final octets = value.split('.');
      for (final octet in octets) {
        if (octet.length > 1 && octet.startsWith('0')) {
          return const PredefinedFormErrorKey(
              PredefinedFormErrorType.isNotValidIpAddress);
        }
      }
    }
    return null;
  }

  /// Compares this [IpAddressValidator] with another object for equality.
  ///
  /// Two [IpAddressValidator]s are considered equal if they have the same
  /// runtime type. This is because this validator has no configurable properties.
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IpAddressValidator && runtimeType == other.runtimeType;

  /// Generates a hash code for this [IpAddressValidator].
  ///
  /// The hash code is based on the runtime type of the validator.
  @override
  int get hashCode => runtimeType.hashCode;
}

/// A validator that checks if a string represents a valid IPv6 address.
///
/// This validator implements [IFormModelValidator] and uses a complex regular expression
/// to validate IPv6 addresses. It supports full IPv6 addresses, compressed forms, and
/// IPv4-mapped IPv6 addresses.
///
/// Example usage:
/// ```dart
/// final ipv6Validator = Ipv6AddressValidator();
/// final result = ipv6Validator.validate('2001:0db8:85a3:0000:0000:8a2e:0370:7334');
/// print(result); // null (validation passes)
/// print(ipv6Validator.validate('2001:0db8:85a3:0000:0000:8a2e:0370:xxxxx')); // PredefinedFormErrorKey(PredefinedFormErrorType.isNotValidIpv6Address)
/// ```
final class Ipv6AddressValidator implements IFormModelValidator<String> {
  /// Creates a new instance of [Ipv6AddressValidator].
  const Ipv6AddressValidator();

  /// Complex regular expression pattern for IPv6 address validation.
  ///
  /// This pattern supports:
  /// - Full IPv6 addresses
  /// - Compressed forms (with ::)
  /// - IPv4-mapped IPv6 addresses
  static final _ipv6Pattern = RegExp(
    r'^('
    r'([0-9a-fA-F]{1,4}:){7,7}[0-9a-fA-F]{1,4}|' // 1:2:3:4:5:6:7:8
    r'([0-9a-fA-F]{1,4}:){1,7}:|' // 1::                              1:2:3:4:5:6:7::
    r'([0-9a-fA-F]{1,4}:){1,6}:[0-9a-fA-F]{1,4}|' // 1::8             1:2:3:4:5:6::8  1:2:3:4:5:6::8
    r'([0-9a-fA-F]{1,4}:){1,5}(:[0-9a-fA-F]{1,4}){1,2}|' // 1::7:8           1:2:3:4:5::7:8  1:2:3:4:5::8
    r'([0-9a-fA-F]{1,4}:){1,4}(:[0-9a-fA-F]{1,4}){1,3}|' // 1::6:7:8         1:2:3:4::6:7:8  1:2:3:4::8
    r'([0-9a-fA-F]{1,4}:){1,3}(:[0-9a-fA-F]{1,4}){1,4}|' // 1::5:6:7:8       1:2:3::5:6:7:8  1:2:3::8
    r'([0-9a-fA-F]{1,4}:){1,2}(:[0-9a-fA-F]{1,4}){1,5}|' // 1::4:5:6:7:8     1:2::4:5:6:7:8  1:2::8
    r'[0-9a-fA-F]{1,4}:((:[0-9a-fA-F]{1,4}){1,6})|' // 1::3:4:5:6:7:8   1::3:4:5:6:7:8  1::8
    r':((:[0-9a-fA-F]{1,4}){1,7}|:)|' // ::2:3:4:5:6:7:8  ::2:3:4:5:6:7:8 ::8       ::
    r'fe80:(:[0-9a-fA-F]{0,4}){0,4}%[0-9a-zA-Z]{1,}|' // fe80::7:8%eth0   fe80::7:8%1     (link-local IPv6 addresses with zone index)
    r'::(ffff(:0{1,4}){0,1}:){0,1}'
    r'((25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])\.){3,3}'
    r'(25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])|' // ::255.255.255.255   ::ffff:255.255.255.255  ::ffff:0:255.255.255.255 (IPv4-mapped IPv6 addresses and IPv4-translated addresses)
    r'([0-9a-fA-F]{1,4}:){1,4}:'
    r'((25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])\.){3,3}'
    r'(25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])' // 2001:db8:3:4::192.0.2.33  64:ff9b::192.0.2.33 (IPv4-Embedded IPv6 Address)
    r')$',
  );

  /// Validates the given [value] to ensure it's a valid IPv6 address.
  ///
  /// Returns:
  ///   - A [PredefinedFormErrorKey] with type [PredefinedFormErrorType.isNotValidIpv6Address]
  ///     if the value is not a valid IPv6 address.
  ///   - `null` if the validation passes or if [value] is `null`.
  @override
  FormErrorKey? validate(String? value) {
    if (value != null) {
      if (!_ipv6Pattern.hasMatch(value)) {
        return const PredefinedFormErrorKey(
            PredefinedFormErrorType.isNotValidIpv6Address);
      }
    }
    return null;
  }

  /// Compares this [Ipv6AddressValidator] with another object for equality.
  ///
  /// Two [Ipv6AddressValidator]s are considered equal if they have the same
  /// runtime type. This is because this validator has no configurable properties.
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Ipv6AddressValidator && runtimeType == other.runtimeType;

  /// Generates a hash code for this [Ipv6AddressValidator].
  ///
  /// The hash code is based on the runtime type of the validator.
  @override
  int get hashCode => runtimeType.hashCode;
}

/// A validator that checks if a string representation of a number is greater than or equal to a specified minimum value.
///
/// This validator implements [IFormModelValidator] and is used to ensure that
/// a string, when parsed as a number, is not less than a specified minimum value.
///
/// Example usage:
/// ```dart
/// final minValidator = StringNumMinValidator(min: 10);
/// final result = minValidator.validate('15');
/// print(result); // null (validation passes)
/// print(minValidator.validate('5')); // PredefinedFormErrorKey(PredefinedFormErrorType.numIsLessThanMin, 10)
/// ```
final class StringNumMinValidator implements IFormModelValidator<String> {
  /// The minimum value that the parsed number should be.
  final num min;

  /// Creates a new instance of [StringNumMinValidator].
  ///
  /// The [min] parameter specifies the minimum value that the parsed number should be.
  const StringNumMinValidator({required this.min});

  /// Validates the given [value] to ensure it's not less than [min] when parsed as a number.
  ///
  /// Returns:
  ///   - A [PredefinedFormErrorKey] with type [PredefinedFormErrorType.numIsLessThanMin]
  ///     if the parsed value is less than [min].
  ///   - `null` if the validation passes, if [value] is `null`, or if [value] cannot be parsed as a number.
  @override
  FormErrorKey? validate(String? value) {
    if (value != null) {
      final numValue = num.tryParse(value);
      if (numValue != null && numValue < min) {
        return PredefinedFormErrorKey(
            PredefinedFormErrorType.numIsLessThanMin, min);
      }
    }
    return null;
  }

  /// Compares this [StringNumMinValidator] with another object for equality.
  ///
  /// Two [StringNumMinValidator]s are considered equal if they have the same
  /// runtime type and the same [min] value.
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StringNumMinValidator &&
          runtimeType == other.runtimeType &&
          min == other.min);

  /// Generates a hash code for this [StringNumMinValidator].
  ///
  /// The hash code is based on the [min] value.
  @override
  int get hashCode => min.hashCode;
}

/// A validator that checks if a string representation of a number is less than or equal to a specified maximum value.
///
/// This validator implements [IFormModelValidator] and is used to ensure that
/// a string, when parsed as a number, does not exceed a specified maximum value.
///
/// Example usage:
/// ```dart
/// final maxValidator = StringNumMaxValidator(max: 100);
/// final result = maxValidator.validate('75');
/// print(result); // null (validation passes)
/// print(maxValidator.validate('150')); // PredefinedFormErrorKey(PredefinedFormErrorType.numIsMoreThanMax, 100)
/// ```
final class StringNumMaxValidator implements IFormModelValidator<String> {
  /// The maximum value that the parsed number should not exceed.
  final num max;

  /// Creates a new instance of [StringNumMaxValidator].
  ///
  /// The [max] parameter specifies the maximum value that the parsed number should not exceed.
  const StringNumMaxValidator({required this.max});

  /// Validates the given [value] to ensure it's not greater than [max] when parsed as a number.
  ///
  /// Returns:
  ///   - A [PredefinedFormErrorKey] with type [PredefinedFormErrorType.numIsMoreThanMax]
  ///     if the parsed value is greater than [max].
  ///   - `null` if the validation passes, if [value] is `null`, or if [value] cannot be parsed as a number.
  @override
  FormErrorKey? validate(String? value) {
    if (value != null) {
      final numValue = num.tryParse(value);
      if (numValue != null && numValue > max) {
        return PredefinedFormErrorKey(
            PredefinedFormErrorType.numIsMoreThanMax, max);
      }
    }
    return null;
  }

  /// Compares this [StringNumMaxValidator] with another object for equality.
  ///
  /// Two [StringNumMaxValidator]s are considered equal if they have the same
  /// runtime type and the same [max] value.
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StringNumMaxValidator &&
          runtimeType == other.runtimeType &&
          max == other.max);

  /// Generates a hash code for this [StringNumMaxValidator].
  ///
  /// The hash code is based on the [max] value.
  @override
  int get hashCode => max.hashCode;
}

/// A validator that checks if a string contains only numeric characters.
///
/// This validator implements [IFormModelValidator] and is used to ensure that
/// a string consists solely of digits (0-9), without any other characters.
///
/// Example usage:
/// ```dart
/// final numbersOnlyValidator = StringNumbersOnlyValidator();
/// final result = numbersOnlyValidator.validate('12345');
/// print(result); // null (validation passes)
/// print(numbersOnlyValidator.validate('123a45')); // PredefinedFormErrorKey(PredefinedFormErrorType.isNotOnlyNumbers)
/// ```
final class StringNumbersOnlyValidator implements IFormModelValidator<String> {
  /// Creates a new instance of [StringNumbersOnlyValidator].
  const StringNumbersOnlyValidator();

  /// Regular expression pattern for numbers-only validation.
  static final _numbersRegex = RegExp(r'^[0-9]*$');

  /// Validates the given [value] to ensure it contains only numeric characters.
  ///
  /// Returns:
  ///   - A [PredefinedFormErrorKey] with type [PredefinedFormErrorType.isNotOnlyNumbers]
  ///     if the value contains any non-numeric characters.
  ///   - `null` if the validation passes, if [value] is `null`, or if [value] is an empty string.
  @override
  FormErrorKey? validate(String? value) {
    if (value != null) {
      if (!_numbersRegex.hasMatch(value)) {
        return const PredefinedFormErrorKey(
            PredefinedFormErrorType.isNotOnlyNumbers);
      }
    }
    return null;
  }

  /// Compares this [StringNumbersOnlyValidator] with another object for equality.
  ///
  /// Two [StringNumbersOnlyValidator]s are considered equal if they have the same
  /// runtime type. This is because this validator has no configurable properties.
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StringNumbersOnlyValidator && runtimeType == other.runtimeType);

  /// Generates a hash code for this [StringNumbersOnlyValidator].
  ///
  /// The hash code is based on the runtime type of the validator.
  @override
  int get hashCode => runtimeType.hashCode;
}

/// A validator that checks if a string represents a valid phone number format.
///
/// This validator implements [IFormModelValidator] and uses a regular expression
/// to validate phone numbers. It supports various common phone number formats,
/// including international numbers.
///
/// Example usage:
/// ```dart
/// final phoneValidator = StringPhoneNumberValidator();
/// final result = phoneValidator.validate('+1-123-456-7890');
/// print(result); // null (validation passes)
/// print(phoneValidator.validate('123')); // PredefinedFormErrorKey(PredefinedFormErrorType.isNotValidPhoneNumber)
/// ```
final class StringPhoneNumberValidator implements IFormModelValidator<String> {
  /// Creates a new instance of [StringPhoneNumberValidator].
  const StringPhoneNumberValidator();

  /// Regular expression pattern for phone number validation.
  ///
  /// This pattern supports various formats including:
  /// - International numbers (e.g., +1234567890)
  /// - Numbers with spaces, dashes, or dots (e.g., 123-456-7890)
  /// - Numbers with parentheses (e.g., (123)456-7890)
  static final _phoneNumberRegex =
      RegExp(r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$');

  /// Validates the given [value] to ensure it's a valid phone number format.
  ///
  /// Returns:
  ///   - A [PredefinedFormErrorKey] with type [PredefinedFormErrorType.isNotValidPhoneNumber]
  ///     if the value does not match the expected phone number format.
  ///   - `null` if the validation passes or if [value] is `null`.
  @override
  FormErrorKey? validate(String? value) {
    if (value != null) {
      if (!_phoneNumberRegex.hasMatch(value)) {
        return const PredefinedFormErrorKey(
            PredefinedFormErrorType.isNotValidPhoneNumber);
      }
    }
    return null;
  }

  /// Compares this [StringPhoneNumberValidator] with another object for equality.
  ///
  /// Two [StringPhoneNumberValidator]s are considered equal if they have the same
  /// runtime type. This is because this validator has no configurable properties.
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StringPhoneNumberValidator && runtimeType == other.runtimeType);

  /// Generates a hash code for this [StringPhoneNumberValidator].
  ///
  /// The hash code is based on the runtime type of the validator.
  @override
  int get hashCode => runtimeType.hashCode;
}

/// A validator that checks if a string contains only alphabetic characters.
///
/// This validator implements [IFormModelValidator] and is used to ensure that
/// a string field contains only letters (a-z and A-Z), without any numbers,
/// spaces, or special characters.
///
/// Example usage:
/// ```dart
/// final textOnlyValidator = StringTextOnlyValidator();
/// final result = textOnlyValidator.validate('OnlyText');
/// print(result); // null (validation passes)
/// print(textOnlyValidator.validate('Text123')); // PredefinedFormErrorKey(PredefinedFormErrorType.isNotOnlyText)
/// ```
final class StringTextOnlyValidator implements IFormModelValidator<String> {
  /// Creates a new instance of [StringTextOnlyValidator].
  const StringTextOnlyValidator();

  /// Regular expression pattern for text-only validation.
  ///
  /// This pattern matches strings that contain only alphabetic characters (a-z and A-Z).
  static final _textRegex = RegExp(r'^[a-zA-Z]*$');

  /// Validates the given [value] to ensure it contains only alphabetic characters.
  ///
  /// Returns:
  ///   - A [PredefinedFormErrorKey] with type [PredefinedFormErrorType.isNotOnlyText]
  ///     if the value contains any non-alphabetic characters.
  ///   - `null` if the validation passes or if [value] is `null`.
  @override
  FormErrorKey? validate(String? value) {
    if (value != null) {
      if (!_textRegex.hasMatch(value)) {
        return const PredefinedFormErrorKey(
            PredefinedFormErrorType.isNotOnlyText);
      }
    }
    return null;
  }

  /// Compares this [StringTextOnlyValidator] with another object for equality.
  ///
  /// Two [StringTextOnlyValidator]s are considered equal if they have the same
  /// runtime type. This is because this validator has no configurable properties.
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StringTextOnlyValidator && runtimeType == other.runtimeType);

  /// Generates a hash code for this [StringTextOnlyValidator].
  ///
  /// The hash code is based on the runtime type of the validator.
  @override
  int get hashCode => runtimeType.hashCode;
}

/// A validator that checks if a string represents a valid URL.
///
/// This validator implements [IFormModelValidator] and is used to ensure that
/// a string field contains a properly formatted URL. It performs several checks
/// to validate the URL structure, including scheme, authority, and host format.
///
/// Example usage:
/// ```dart
/// final urlValidator = StringUrlValidator();
/// final result = urlValidator.validate('https://www.example.com');
/// print(result); // null (validation passes)
/// print(urlValidator.validate('not a url')); // PredefinedFormErrorKey(PredefinedFormErrorType.isNotValidUrl)
/// ```
final class StringUrlValidator implements IFormModelValidator<String> {
  /// Creates a new instance of [StringUrlValidator].
  const StringUrlValidator();

  /// Validates the given [value] to ensure it's a properly formatted URL.
  ///
  /// This method performs the following checks:
  /// 1. Ensures the value is not null or empty.
  /// 2. Attempts to parse the string as a URI.
  /// 3. Checks if the URI has both a scheme and an authority.
  /// 4. Verifies that the scheme is either 'http', 'https', or 'ftp'.
  /// 5. Validates the host part of the URL using a regular expression.
  ///
  /// Returns:
  ///   - A [PredefinedFormErrorKey] with type [PredefinedFormErrorType.isNotValidUrl]
  ///     if the value is not a valid URL.
  ///   - `null` if the validation passes or if [value] is `null`.
  @override
  FormErrorKey? validate(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return const PredefinedFormErrorKey(
            PredefinedFormErrorType.isNotValidUrl);
      }

      try {
        final uri = Uri.parse(value);
        if (!uri.hasScheme || !uri.hasAuthority) {
          return const PredefinedFormErrorKey(
              PredefinedFormErrorType.isNotValidUrl);
        }

        if (!['http', 'https', 'ftp'].contains(uri.scheme.toLowerCase())) {
          return const PredefinedFormErrorKey(
              PredefinedFormErrorType.isNotValidUrl);
        }

        final hostRegex =
            RegExp(r'^[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*\.[a-zA-Z]{2,}$');
        if (!hostRegex.hasMatch(uri.host)) {
          return const PredefinedFormErrorKey(
              PredefinedFormErrorType.isNotValidUrl);
        }
      } catch (_) {
        return const PredefinedFormErrorKey(
            PredefinedFormErrorType.isNotValidUrl);
      }

      return null;
    }
    return null;
  }

  /// Compares this [StringUrlValidator] with another object for equality.
  ///
  /// Two [StringUrlValidator]s are considered equal if they have the same
  /// runtime type. This is because this validator has no configurable properties.
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StringUrlValidator && runtimeType == other.runtimeType);

  /// Generates a hash code for this [StringUrlValidator].
  ///
  /// The hash code is based on the runtime type of the validator.
  @override
  int get hashCode => runtimeType.hashCode;
}

/// A validator that checks if a string contains at least a specified minimum number of words.
///
/// This validator implements [IFormModelValidator] and is used to ensure that
/// a string field contains at least the specified minimum number of words.
/// Words are defined as sequences of characters separated by whitespace.
///
/// Example usage:
/// ```dart
/// final wordsCountValidator = StringWordsCountMinValidator(minWords: 3);
/// final result = wordsCountValidator.validate('This is enough');
/// print(result); // null (validation passes)
/// print(wordsCountValidator.validate('Too few')); // PredefinedFormErrorKey(PredefinedFormErrorType.wordCountIsLessThan, 3)
/// ```
final class StringWordsCountMinValidator
    implements IFormModelValidator<String> {
  /// The minimum number of words required in the string.
  final int minWords;

  /// Creates a new instance of [StringWordsCountMinValidator].
  ///
  /// The [minWords] parameter specifies the minimum number of words
  /// that the string should contain to pass validation.
  const StringWordsCountMinValidator({required this.minWords});

  /// Validates the given [value] to ensure it contains at least [minWords] words.
  ///
  /// This method splits the string by whitespace and counts the resulting parts.
  /// Empty strings are considered to have zero words.
  ///
  /// Returns:
  ///   - A [PredefinedFormErrorKey] with type [PredefinedFormErrorType.wordCountIsLessThan]
  ///     if the word count is less than [minWords].
  ///   - `null` if the validation passes, if [value] is `null`, or if [value] is empty.
  @override
  FormErrorKey? validate(String? value) {
    if (value != null && value.isNotEmpty) {
      final wordCount = value.trim().split(RegExp(r'\s+')).length;

      if (wordCount < minWords) {
        return PredefinedFormErrorKey(
            PredefinedFormErrorType.wordCountIsLessThan, minWords);
      }
    }
    return null;
  }

  /// Compares this [StringWordsCountMinValidator] with another object for equality.
  ///
  /// Two [StringWordsCountMinValidator]s are considered equal if they have the same
  /// runtime type and the same [minWords] value.
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StringWordsCountMinValidator &&
          runtimeType == other.runtimeType &&
          minWords == other.minWords);

  /// Generates a hash code for this [StringWordsCountMinValidator].
  ///
  /// The hash code is based on the [minWords] value.
  @override
  int get hashCode => minWords.hashCode;
}

/// A validator that checks if a string contains no more than a specified maximum number of words.
///
/// This validator implements [IFormModelValidator] and is used to ensure that
/// a string field contains no more than the specified maximum number of words.
/// Words are defined as sequences of characters separated by whitespace.
///
/// Example usage:
/// ```dart
/// final wordsCountValidator = StringWordsCountMaxValidator(maxWords: 5);
/// final result = wordsCountValidator.validate('This is not too many words');
/// print(result); // null (validation passes)
/// print(wordsCountValidator.validate('This sentence has too many words to pass')); // PredefinedFormErrorKey(PredefinedFormErrorType.wordCountIsMoreThan, 5)
/// ```
final class StringWordsCountMaxValidator
    implements IFormModelValidator<String> {
  /// The maximum number of words allowed in the string.
  final int maxWords;

  /// Creates a new instance of [StringWordsCountMaxValidator].
  ///
  /// The [maxWords] parameter specifies the maximum number of words
  /// that the string should contain to pass validation.
  const StringWordsCountMaxValidator({required this.maxWords});

  /// Validates the given [value] to ensure it contains no more than [maxWords] words.
  ///
  /// This method splits the string by whitespace and counts the resulting parts.
  /// Empty strings are considered to have zero words and always pass validation.
  ///
  /// Returns:
  ///   - A [PredefinedFormErrorKey] with type [PredefinedFormErrorType.wordCountIsMoreThan]
  ///     if the word count is more than [maxWords].
  ///   - `null` if the validation passes, if [value] is `null`, or if [value] is empty.
  @override
  FormErrorKey? validate(String? value) {
    if (value != null && value.isNotEmpty) {
      final wordCount = value.trim().split(RegExp(r'\s+')).length;

      if (wordCount > maxWords) {
        return PredefinedFormErrorKey(
            PredefinedFormErrorType.wordCountIsMoreThan, maxWords);
      }
    }
    return null;
  }

  /// Compares this [StringWordsCountMaxValidator] with another object for equality.
  ///
  /// Two [StringWordsCountMaxValidator]s are considered equal if they have the same
  /// runtime type and the same [maxWords] value.
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StringWordsCountMaxValidator &&
          runtimeType == other.runtimeType &&
          maxWords == other.maxWords);

  /// Generates a hash code for this [StringWordsCountMaxValidator].
  ///
  /// The hash code is based on the [maxWords] value.
  @override
  int get hashCode => maxWords.hashCode;
}

/// A validator that checks if a string matches a specified password value.
///
/// This validator implements [IFormModelValidator] and is used to ensure that
/// a confirmation password field matches the original password field.
///
/// Example usage:
/// ```dart
/// final password = 'securePassword123';
/// final confirmValidator = StringConfirmPasswordMatchValidator(matchingValue: password);
/// final result = confirmValidator.validate('securePassword123');
/// print(result); // null (validation passes)
/// print(confirmValidator.validate('differentPassword')); // PredefinedFormErrorKey(PredefinedFormErrorType.passwordsDoNotMatch)
/// ```
final class StringConfirmPasswordMatchValidator
    implements IFormModelValidator<String> {
  /// The password value that the confirmation should match.
  final String? matchingValue;

  /// Creates a new instance of [StringConfirmPasswordMatchValidator].
  ///
  /// The [matchingValue] parameter specifies the password value that
  /// the confirmation password should match.
  const StringConfirmPasswordMatchValidator({this.matchingValue});

  /// Validates the given [value] to ensure it matches the [matchingValue].
  ///
  /// This method performs a simple string equality check between [value] and [matchingValue].
  ///
  /// Returns:
  ///   - A [PredefinedFormErrorKey] with type [PredefinedFormErrorType.passwordsDoNotMatch]
  ///     if [value] does not match [matchingValue].
  ///   - `null` if the validation passes, if [value] is `null`, or if [matchingValue] is `null`.
  @override
  FormErrorKey? validate(String? value) {
    if (value != null && matchingValue != null && value != matchingValue) {
      return const PredefinedFormErrorKey(
          PredefinedFormErrorType.passwordsDoNotMatch);
    }
    return null;
  }

  /// Compares this [StringConfirmPasswordMatchValidator] with another object for equality.
  ///
  /// Two [StringConfirmPasswordMatchValidator]s are considered equal if they have the same
  /// runtime type and the same [matchingValue].
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StringConfirmPasswordMatchValidator &&
          runtimeType == other.runtimeType &&
          matchingValue == other.matchingValue);

  /// Generates a hash code for this [StringConfirmPasswordMatchValidator].
  ///
  /// The hash code is based on the [matchingValue].
  @override
  int get hashCode => matchingValue.hashCode;
}

/// A validator that checks if a password meets a minimum length requirement.
///
/// This validator implements [IFormModelValidator] and is used to ensure that
/// a password string is at least a specified minimum number of characters long.
///
/// Example usage:
/// ```dart
/// final lengthValidator = PasswordLengthValidator(minLength: 8);
/// final result = lengthValidator.validate('securePass');
/// print(result); // null (validation passes)
/// print(lengthValidator.validate('short')); // PredefinedFormErrorKey(PredefinedFormErrorType.passwordTooShort, 8)
/// ```
class PasswordLengthValidator implements IFormModelValidator<String> {
  /// The minimum length required for the password.
  final int minLength;

  /// Creates a new instance of [PasswordLengthValidator].
  ///
  /// The [minLength] parameter specifies the minimum number of characters
  /// that the password should contain to pass validation.
  const PasswordLengthValidator({required this.minLength});

  /// Validates the given [value] to ensure it is at least [minLength] characters long.
  ///
  /// This method checks the length of the provided password string.
  ///
  /// Returns:
  ///   - A [PredefinedFormErrorKey] with type [PredefinedFormErrorType.passwordTooShort]
  ///     if the password length is less than [minLength].
  ///   - `null` if the validation passes or if [value] is `null`.
  @override
  FormErrorKey? validate(String? value) {
    if (value == null || value.length < minLength) {
      return PredefinedFormErrorKey(
          PredefinedFormErrorType.passwordTooShort, minLength);
    }
    return null;
  }

  /// Compares this [PasswordLengthValidator] with another object for equality.
  ///
  /// Two [PasswordLengthValidator]s are considered equal if they have the same
  /// runtime type and the same [minLength] value.
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PasswordLengthValidator &&
          runtimeType == other.runtimeType &&
          minLength == other.minLength;

  /// Generates a hash code for this [PasswordLengthValidator].
  ///
  /// The hash code is based on the [minLength] value.
  @override
  int get hashCode => minLength.hashCode;
}

/// A validator that checks if a password contains at least one uppercase letter.
///
/// This validator implements [IFormModelValidator] and is used to ensure that
/// a password string contains at least one uppercase alphabetic character.
///
/// Example usage:
/// ```dart
/// final uppercaseValidator = PasswordUppercaseValidator();
/// final result = uppercaseValidator.validate('Password123');
/// print(result); // null (validation passes)
/// print(uppercaseValidator.validate('password123')); // PredefinedFormErrorKey(PredefinedFormErrorType.passwordNoUppercase)
/// ```
class PasswordUppercaseValidator implements IFormModelValidator<String> {
  /// Creates a new instance of [PasswordUppercaseValidator].
  const PasswordUppercaseValidator();

  /// Regular expression pattern for matching uppercase letters.
  static final _upperCaseRegex = RegExp(r'[A-Z]');

  /// Validates the given [value] to ensure it contains at least one uppercase letter.
  ///
  /// This method uses a regular expression to check for the presence of uppercase letters.
  ///
  /// Returns:
  ///   - A [PredefinedFormErrorKey] with type [PredefinedFormErrorType.passwordNoUppercase]
  ///     if the password does not contain an uppercase letter.
  ///   - `null` if the validation passes or if [value] is `null`.
  @override
  FormErrorKey? validate(String? value) {
    if (value == null || !value.contains(_upperCaseRegex)) {
      return const PredefinedFormErrorKey(
          PredefinedFormErrorType.passwordNoUppercase);
    }
    return null;
  }

  /// Compares this [PasswordUppercaseValidator] with another object for equality.
  ///
  /// Two [PasswordUppercaseValidator]s are considered equal if they have the same
  /// runtime type. This is because this validator has no configurable properties.
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PasswordUppercaseValidator && runtimeType == other.runtimeType;

  /// Generates a hash code for this [PasswordUppercaseValidator].
  ///
  /// The hash code is based on the runtime type of the validator.
  @override
  int get hashCode => runtimeType.hashCode;
}

/// A validator that checks if a password contains at least one lowercase letter.
///
/// This validator implements [IFormModelValidator] and is used to ensure that
/// a password string contains at least one lowercase alphabetic character.
///
/// Example usage:
/// ```dart
/// final lowercaseValidator = PasswordLowercaseValidator();
/// final result = lowercaseValidator.validate('PASSWORd123');
/// print(result); // null (validation passes)
/// print(lowercaseValidator.validate('PASSWORD123')); // PredefinedFormErrorKey(PredefinedFormErrorType.passwordNoLowercase)
/// ```
class PasswordLowercaseValidator implements IFormModelValidator<String> {
  /// Creates a new instance of [PasswordLowercaseValidator].
  const PasswordLowercaseValidator();

  /// Regular expression pattern for matching lowercase letters.
  static final _lowerCaseRegex = RegExp(r'[a-z]');

  /// Validates the given [value] to ensure it contains at least one lowercase letter.
  ///
  /// This method uses a regular expression to check for the presence of lowercase letters.
  ///
  /// Returns:
  ///   - A [PredefinedFormErrorKey] with type [PredefinedFormErrorType.passwordNoLowercase]
  ///     if the password does not contain a lowercase letter.
  ///   - `null` if the validation passes or if [value] is `null`.
  @override
  FormErrorKey? validate(String? value) {
    if (value == null || !value.contains(_lowerCaseRegex)) {
      return const PredefinedFormErrorKey(
          PredefinedFormErrorType.passwordNoLowercase);
    }
    return null;
  }

  /// Compares this [PasswordLowercaseValidator] with another object for equality.
  ///
  /// Two [PasswordLowercaseValidator]s are considered equal if they have the same
  /// runtime type. This is because this validator has no configurable properties.
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PasswordLowercaseValidator && runtimeType == other.runtimeType;

  /// Generates a hash code for this [PasswordLowercaseValidator].
  ///
  /// The hash code is based on the runtime type of the validator.
  @override
  int get hashCode => runtimeType.hashCode;
}

/// A validator that checks if a password contains at least one numeric digit.
///
/// This validator implements [IFormModelValidator] and is used to ensure that
/// a password string contains at least one number (0-9).
///
/// Example usage:
/// ```dart
/// final numberValidator = PasswordNumberValidator();
/// final result = numberValidator.validate('Password123');
/// print(result); // null (validation passes)
/// print(numberValidator.validate('PasswordABC')); // PredefinedFormErrorKey(PredefinedFormErrorType.passwordNoNumber)
/// ```
class PasswordNumberValidator implements IFormModelValidator<String> {
  /// Creates a new instance of [PasswordNumberValidator].
  const PasswordNumberValidator();

  /// Regular expression pattern for matching numeric digits.
  static final _numbersRegex = RegExp(r'[0-9]');

  /// Validates the given [value] to ensure it contains at least one numeric digit.
  ///
  /// This method uses a regular expression to check for the presence of numbers.
  ///
  /// Returns:
  ///   - A [PredefinedFormErrorKey] with type [PredefinedFormErrorType.passwordNoNumber]
  ///     if the password does not contain a numeric digit.
  ///   - `null` if the validation passes or if [value] is `null`.
  @override
  FormErrorKey? validate(String? value) {
    if (value == null || !value.contains(_numbersRegex)) {
      return const PredefinedFormErrorKey(
          PredefinedFormErrorType.passwordNoNumber);
    }
    return null;
  }

  /// Compares this [PasswordNumberValidator] with another object for equality.
  ///
  /// Two [PasswordNumberValidator]s are considered equal if they have the same
  /// runtime type. This is because this validator has no configurable properties.
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PasswordNumberValidator && runtimeType == other.runtimeType;

  /// Generates a hash code for this [PasswordNumberValidator].
  ///
  /// The hash code is based on the runtime type of the validator.
  @override
  int get hashCode => runtimeType.hashCode;
}

/// A validator that checks if a password contains at least one special character.
///
/// This validator implements [IFormModelValidator] and is used to ensure that
/// a password string contains at least one special character from a specified set.
///
/// Example usage:
/// ```dart
/// final specialCharValidator = PasswordSpecialCharValidator();
/// final result = specialCharValidator.validate('Password123!');
/// print(result); // null (validation passes)
/// print(specialCharValidator.validate('Password123')); // PredefinedFormErrorKey(PredefinedFormErrorType.passwordNoSpecialChar, '!@#$%^&*(),.?":{}|<>')
/// ```
class PasswordSpecialCharValidator implements IFormModelValidator<String> {
  /// The set of special characters to check for in the password.
  final String specialChars;

  /// Creates a new instance of [PasswordSpecialCharValidator].
  ///
  /// The [specialChars] parameter specifies the set of special characters to check for.
  /// If not provided, it defaults to a common set of special characters.
  const PasswordSpecialCharValidator(
      {this.specialChars = r'!@#$%^&*(),.?":{}|<>'});

  /// Validates the given [value] to ensure it contains at least one special character.
  ///
  /// This method uses a regular expression created from [specialChars] to check
  /// for the presence of special characters.
  ///
  /// Returns:
  ///   - A [PredefinedFormErrorKey] with type [PredefinedFormErrorType.passwordNoSpecialChar]
  ///     if the password does not contain a special character from [specialChars].
  ///   - `null` if the validation passes or if [value] is `null`.
  @override
  FormErrorKey? validate(String? value) {
    if (value == null || !value.contains(RegExp('[$specialChars]'))) {
      return PredefinedFormErrorKey(
          PredefinedFormErrorType.passwordNoSpecialChar, specialChars);
    }
    return null;
  }

  /// Compares this [PasswordSpecialCharValidator] with another object for equality.
  ///
  /// Two [PasswordSpecialCharValidator]s are considered equal if they have the same
  /// runtime type and the same [specialChars] value.
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PasswordSpecialCharValidator &&
          runtimeType == other.runtimeType &&
          specialChars == other.specialChars;

  /// Generates a hash code for this [PasswordSpecialCharValidator].
  ///
  /// The hash code is based on the [specialChars] value.
  @override
  int get hashCode => specialChars.hashCode;
}

/// A validator that checks if a string contains a specified substring.
///
/// This validator implements [IFormModelValidator] and is used to ensure that
/// a string contains a particular substring. It can perform case-sensitive or
/// case-insensitive matching.
///
/// Example usage:
/// ```dart
/// final containsValidator = StringContainsValidator(substring: '@example.com');
/// final result = containsValidator.validate('user@example.com');
/// print(result); // null (validation passes)
/// print(containsValidator.validate('user@other.com')); // PredefinedFormErrorKey(PredefinedFormErrorType.stringDoesNotContain, '@example.com')
/// ```
class StringContainsValidator extends IFormModelValidator<String> {
  /// The substring that should be present in the validated string.
  final String substring;

  /// Whether the substring matching should be case-sensitive.
  final bool caseSensitive;

  /// Creates a new instance of [StringContainsValidator].
  ///
  /// The [substring] parameter specifies the string that should be present.
  /// The [caseSensitive] parameter determines if the matching is case-sensitive.
  /// By default, matching is case-sensitive.
  const StringContainsValidator({
    required this.substring,
    this.caseSensitive = true,
  });

  /// Validates the given [value] to ensure it contains [substring].
  ///
  /// This method checks for the presence of [substring] in [value],
  /// respecting the [caseSensitive] setting.
  ///
  /// Returns:
  ///   - A [PredefinedFormErrorKey] with type [PredefinedFormErrorType.stringDoesNotContain]
  ///     if [value] does not contain [substring].
  ///   - `null` if the validation passes or if [value] is `null`.
  @override
  FormErrorKey? validate(String? value) {
    if (value == null) return null;

    bool contains = caseSensitive
        ? value.contains(substring)
        : value.toLowerCase().contains(substring.toLowerCase());

    if (!contains) {
      return PredefinedFormErrorKey(
          PredefinedFormErrorType.stringDoesNotContain, substring);
    }
    return null;
  }

  /// Compares this [StringContainsValidator] with another object for equality.
  ///
  /// Two [StringContainsValidator]s are considered equal if they have the same
  /// runtime type, [substring], and [caseSensitive] values.
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StringContainsValidator &&
          runtimeType == other.runtimeType &&
          substring == other.substring &&
          caseSensitive == other.caseSensitive;

  /// Generates a hash code for this [StringContainsValidator].
  ///
  /// The hash code is based on the [substring] and [caseSensitive] values.
  @override
  int get hashCode => substring.hashCode ^ caseSensitive.hashCode;
}

/// A validator that checks if a string does not contain a specified substring.
///
/// This validator implements [IFormModelValidator] and is used to ensure that
/// a string does not contain a particular substring. It can perform case-sensitive
/// or case-insensitive matching.
///
/// Example usage:
/// ```dart
/// final notContainsValidator = StringNotContainsValidator(substring: 'admin');
/// final result = notContainsValidator.validate('user@example.com');
/// print(result); // null (validation passes)
/// print(notContainsValidator.validate('admin@example.com')); // PredefinedFormErrorKey(PredefinedFormErrorType.stringContains, 'admin')
/// ```
class StringNotContainsValidator extends IFormModelValidator<String> {
  /// The substring that should not be present in the validated string.
  final String substring;

  /// Whether the substring matching should be case-sensitive.
  final bool caseSensitive;

  /// Creates a new instance of [StringNotContainsValidator].
  ///
  /// The [substring] parameter specifies the string that should not be present.
  /// The [caseSensitive] parameter determines if the matching is case-sensitive.
  /// By default, matching is case-sensitive.
  const StringNotContainsValidator({
    required this.substring,
    this.caseSensitive = true,
  });

  /// Validates the given [value] to ensure it does not contain [substring].
  ///
  /// This method checks for the absence of [substring] in [value],
  /// respecting the [caseSensitive] setting.
  ///
  /// Returns:
  ///   - A [PredefinedFormErrorKey] with type [PredefinedFormErrorType.stringContains]
  ///     if [value] contains [substring].
  ///   - `null` if the validation passes or if [value] is `null`.
  @override
  FormErrorKey? validate(String? value) {
    if (value == null) return null;

    bool contains = caseSensitive
        ? value.contains(substring)
        : value.toLowerCase().contains(substring.toLowerCase());

    if (contains) {
      return PredefinedFormErrorKey(
          PredefinedFormErrorType.stringContains, substring);
    }
    return null;
  }

  /// Compares this [StringNotContainsValidator] with another object for equality.
  ///
  /// Two [StringNotContainsValidator]s are considered equal if they have the same
  /// runtime type, [substring], and [caseSensitive] values.
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StringNotContainsValidator &&
          runtimeType == other.runtimeType &&
          substring == other.substring &&
          caseSensitive == other.caseSensitive;

  /// Generates a hash code for this [StringNotContainsValidator].
  ///
  /// The hash code is based on the [substring] and [caseSensitive] values.
  @override
  int get hashCode => substring.hashCode ^ caseSensitive.hashCode;
}

/// A validator that checks if a file has an allowed file extension.
///
/// This validator implements [IFormModelValidator] and is used to ensure that
/// a file name or path has an extension that is included in a list of allowed extensions.
///
/// Example usage:
/// ```dart
/// final fileTypeValidator = FileTypeValidator(allowedExtensions: ['jpg', 'png', 'gif']);
/// final result = fileTypeValidator.validate('image.jpg');
/// print(result); // null (validation passes)
/// print(fileTypeValidator.validate('document.pdf')); // PredefinedFormErrorKey(PredefinedFormErrorType.invalidFileType, ['jpg', 'png', 'gif'])
/// ```
class FileTypeValidator extends IFormModelValidator<String> {
  /// The list of allowed file extensions.
  final List<String> allowedExtensions;

  /// Creates a new instance of [FileTypeValidator].
  ///
  /// The [allowedExtensions] parameter specifies the list of allowed file extensions.
  /// Extensions should be provided without the leading dot (e.g., 'jpg' not '.jpg').
  const FileTypeValidator({required this.allowedExtensions});

  /// Validates the given [value] to ensure it has an allowed file extension.
  ///
  /// This method extracts the file extension from the input string and checks
  /// if it's in the list of [allowedExtensions]. The check is case-insensitive.
  ///
  /// Returns:
  ///   - A [PredefinedFormErrorKey] with type [PredefinedFormErrorType.invalidFileType]
  ///     if the file extension is not in the list of allowed extensions.
  ///   - `null` if the validation passes, if [value] is `null`, or if [value] is empty.
  @override
  FormErrorKey? validate(String? value) {
    if (value == null || value.isEmpty) return null;

    final extension = value.split('.').last.toLowerCase();
    if (!allowedExtensions.contains(extension)) {
      return PredefinedFormErrorKey(
          PredefinedFormErrorType.invalidFileType, allowedExtensions);
    }
    return null;
  }

  /// Compares this [FileTypeValidator] with another object for equality.
  ///
  /// Two [FileTypeValidator]s are considered equal if they have the same
  /// runtime type and the same [allowedExtensions] list.
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FileTypeValidator &&
          runtimeType == other.runtimeType &&
          listEquals(allowedExtensions, other.allowedExtensions);

  /// Generates a hash code for this [FileTypeValidator].
  ///
  /// The hash code is based on the [allowedExtensions] list.
  @override
  int get hashCode => Object.hashAll(allowedExtensions);
}

/// A validator that checks if a file size is within an allowed maximum limit.
///
/// This validator implements [IFormModelValidator] and is used to ensure that
/// a file size (represented as an integer number of bytes) does not exceed
/// a specified maximum size.
///
/// Example usage:
/// ```dart
/// final fileSizeValidator = FileSizeValidator(maxSizeInBytes: 1024 * 1024); // 1 MB
/// final result = fileSizeValidator.validate(500000); // 500 KB
/// print(result); // null (validation passes)
/// print(fileSizeValidator.validate(1500000)); // PredefinedFormErrorKey(PredefinedFormErrorType.fileSizeExceedsLimit, 1048576)
/// ```
class FileSizeValidator extends IFormModelValidator<int> {
  /// The maximum allowed file size in bytes.
  final int maxSizeInBytes;

  /// Creates a new instance of [FileSizeValidator].
  ///
  /// The [maxSizeInBytes] parameter specifies the maximum allowed file size in bytes.
  const FileSizeValidator({required this.maxSizeInBytes});

  /// Validates the given [value] to ensure it does not exceed [maxSizeInBytes].
  ///
  /// This method compares the input value (representing file size in bytes)
  /// against the maximum allowed size.
  ///
  /// Returns:
  ///   - A [PredefinedFormErrorKey] with type [PredefinedFormErrorType.fileSizeExceedsLimit]
  ///     if the file size exceeds the maximum allowed size.
  ///   - `null` if the validation passes or if [value] is `null`.
  @override
  FormErrorKey? validate(int? value) {
    if (value == null) return null;

    if (value > maxSizeInBytes) {
      return PredefinedFormErrorKey(
          PredefinedFormErrorType.fileSizeExceedsLimit, maxSizeInBytes);
    }
    return null;
  }

  /// Compares this [FileSizeValidator] with another object for equality.
  ///
  /// Two [FileSizeValidator]s are considered equal if they have the same
  /// runtime type and the same [maxSizeInBytes] value.
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FileSizeValidator &&
          runtimeType == other.runtimeType &&
          maxSizeInBytes == other.maxSizeInBytes;

  /// Generates a hash code for this [FileSizeValidator].
  ///
  /// The hash code is based on the [maxSizeInBytes] value.
  @override
  int get hashCode => maxSizeInBytes.hashCode;
}

/// A validator that allows for custom validation logic.
///
/// This validator implements [IFormModelValidator] and provides flexibility
/// to define custom validation rules for any type of input. It's particularly
/// useful for complex validation scenarios that aren't covered by the standard
/// validators.
///
/// The type parameter `T` represents the type of the form field's value,
/// allowing for type-safe implementations for various data types.
///
/// Example usage:
/// ```dart
/// final ageValidator = CustomValidator<int>(
///   validator: (value) {
///     if (value != null && value < 18) {
///       return 'You must be at least 18 years old';
///     }
///     return null;
///   },
/// );
/// ```
class CustomValidator<T extends Object> implements IFormModelValidator<T> {
  /// The custom validation function.
  ///
  /// This function takes a nullable value of type `T` and returns a String
  /// if validation fails, or null if validation passes.
  final String? Function(T? value) validator;

  /// Creates a new instance of [CustomValidator].
  ///
  /// The [validator] parameter is a function that implements the custom
  /// validation logic. It should return a String with an error message
  /// if validation fails, or null if validation passes.
  const CustomValidator({required this.validator});

  /// Validates the given [value] using the custom validation function.
  ///
  /// This method calls the provided [validator] function and wraps any
  /// returned error message in a [CustomFormErrorKey].
  ///
  /// Returns:
  ///   - A [CustomFormErrorKey] with the error message if validation fails.
  ///   - `null` if the validation passes.
  @override
  FormErrorKey? validate(T? value) {
    final errorMessage = validator(value);
    if (errorMessage != null) {
      return CustomFormErrorKey(errorMessage);
    }
    return null;
  }

  /// Compares this [CustomValidator] with another object for equality.
  ///
  /// Two [CustomValidator]s are considered equal if they have the same
  /// runtime type and the same validator function.
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CustomValidator<T> &&
          runtimeType == other.runtimeType &&
          validator == other.validator);

  /// Generates a hash code for this [CustomValidator].
  ///
  /// The hash code is based on the runtime type and the validator function.
  @override
  int get hashCode => Object.hash(runtimeType, validator);
}
