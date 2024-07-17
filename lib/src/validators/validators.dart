import 'package:form_model/src/errors/form_error_key.dart';
import 'package:form_model/src/errors/predefined_form_error_type.dart';

sealed class IFormModelValidator<T extends Object> {
  const IFormModelValidator();
  FormErrorKey? validate(T? value);
}

final class RequiredValidator<T extends Object> implements IFormModelValidator<T> {
  const RequiredValidator();
  @override
  FormErrorKey? validate(value) {
    if (value == null) return const PredefinedFormErrorKey(PredefinedFormErrorType.required);
    return null;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is RequiredValidator && runtimeType == other.runtimeType);

  @override
  int get hashCode => runtimeType.hashCode ^ T.hashCode;
}

class StringMinLengthValidator extends IFormModelValidator<String> {
  final int minLength;

  const StringMinLengthValidator({required this.minLength});

  @override
  FormErrorKey? validate(value) {
    if (value != null) {
      if (value.length < minLength) {
        return PredefinedFormErrorKey(PredefinedFormErrorType.lengthIsLessThanMin, minLength);
      }
    }
    return null;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StringMinLengthValidator && runtimeType == other.runtimeType && minLength == other.minLength);

  @override
  int get hashCode => minLength.hashCode;
}

class StringMaxLengthValidator extends IFormModelValidator<String> {
  final int maxLength;

  const StringMaxLengthValidator({required this.maxLength});

  @override
  FormErrorKey? validate(value) {
    if (value != null) {
      if (value.length > maxLength) {
        return PredefinedFormErrorKey(PredefinedFormErrorType.lengthIsMoreThanMax, maxLength);
      }
    }
    return null;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StringMaxLengthValidator && runtimeType == other.runtimeType && maxLength == other.maxLength);

  @override
  int get hashCode => maxLength.hashCode;
}

class StringCustomValidator extends IFormModelValidator<String> {
  final String? Function(String? value) validator;

  const StringCustomValidator({required this.validator});
  @override
  FormErrorKey? validate(String? value) {
    final errorKey = validator(value);
    if (errorKey != null) return CustomFormErrorKey(errorKey);
    return null;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StringCustomValidator && runtimeType == other.runtimeType && validator == other.validator);

  @override
  int get hashCode => validator.hashCode;
}

final class StringDateTimeAgeMinValidator implements IFormModelValidator<String> {
  final int minAge;

  const StringDateTimeAgeMinValidator({required this.minAge});

  @override
  FormErrorKey? validate(String? value) {
    if (value != null) {
      final parsedDate = DateTime.tryParse(value);
      if (parsedDate != null) {
        final age = _calculateAge(parsedDate);
        if (age < minAge) {
          return PredefinedFormErrorKey(PredefinedFormErrorType.dateIsLessThanMinAge, minAge);
        }
      }
    }
    return null;
  }

  int _calculateAge(DateTime birthDate) {
    final now = DateTime.now();
    int age = now.year - birthDate.year;
    final birthMonth = birthDate.month;
    final nowMonth = now.month;
    final birthDay = birthDate.day;
    final nowDay = now.day;

    if (nowMonth < birthMonth || (nowMonth == birthMonth && nowDay < birthDay)) {
      age--;
    }

    return age;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StringDateTimeAgeMinValidator && runtimeType == other.runtimeType && minAge == other.minAge);

  @override
  int get hashCode => minAge.hashCode;
}

final class StringDateTimeAgeMaxValidator implements IFormModelValidator<String> {
  final int maxAge;

  const StringDateTimeAgeMaxValidator({required this.maxAge});

  @override
  FormErrorKey? validate(String? value) {
    if (value != null) {
      final parsedDate = DateTime.tryParse(value);
      if (parsedDate != null) {
        final age = _calculateAge(parsedDate);
        if (age > maxAge) {
          return PredefinedFormErrorKey(PredefinedFormErrorType.dateIsMoreThanMaxAge, maxAge);
        }
      }
    }
    return null;
  }

  int _calculateAge(DateTime birthDate) {
    final now = DateTime.now();
    int age = now.year - birthDate.year;
    final birthMonth = birthDate.month;
    final nowMonth = now.month;
    final birthDay = birthDate.day;
    final nowDay = now.day;

    if (nowMonth < birthMonth || (nowMonth == birthMonth && nowDay < birthDay)) {
      age--;
    }

    return age;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StringDateTimeAgeMaxValidator && runtimeType == other.runtimeType && maxAge == other.maxAge);

  @override
  int get hashCode => maxAge.hashCode;
}

final class BoolAgreeToTermsAndConditionsValidator implements IFormModelValidator<bool> {
  const BoolAgreeToTermsAndConditionsValidator();

  @override
  FormErrorKey? validate(bool? value) {
    if (value != true) {
      return const PredefinedFormErrorKey(PredefinedFormErrorType.boolAgreeToTerms);
    }
    return null;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is BoolAgreeToTermsAndConditionsValidator && runtimeType == other.runtimeType);

  @override
  int get hashCode => runtimeType.hashCode;
}

final class BoolFalseValidator implements IFormModelValidator<bool> {
  const BoolFalseValidator();

  @override
  FormErrorKey? validate(bool? value) {
    if (value != false) {
      return const PredefinedFormErrorKey(PredefinedFormErrorType.boolShouldBeFalse);
    }
    return null;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is BoolFalseValidator && runtimeType == other.runtimeType);

  @override
  int get hashCode => runtimeType.hashCode;
}

final class BoolTrueValidator implements IFormModelValidator<bool> {
  const BoolTrueValidator();

  @override
  FormErrorKey? validate(bool? value) {
    if (value != true) {
      return const PredefinedFormErrorKey(PredefinedFormErrorType.boolShouldBeTrue);
    }
    return null;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is BoolTrueValidator && runtimeType == other.runtimeType);

  @override
  int get hashCode => runtimeType.hashCode;
}

final class StringCreditCardValidator implements IFormModelValidator<String> {
  const StringCreditCardValidator();

  @override
  FormErrorKey? validate(String? value) {
    if (value != null) {
      if (!_luhnCheck(value)) {
        return const PredefinedFormErrorKey(PredefinedFormErrorType.intIsNotValidCreditCard);
      }
    }
    return null;
  }

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

  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is StringCreditCardValidator && runtimeType == other.runtimeType);

  @override
  int get hashCode => runtimeType.hashCode;
}

final class CustomEqualValidator<T extends Object> implements IFormModelValidator<T> {
  final T equalValue;

  const CustomEqualValidator({required this.equalValue});

  @override
  FormErrorKey? validate(T? value) {
    if (value != null) {
      if (value != equalValue) {
        return PredefinedFormErrorKey(PredefinedFormErrorType.isNotEqualTo, equalValue);
      }
    }
    return null;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CustomEqualValidator && runtimeType == other.runtimeType && equalValue == other.equalValue);

  @override
  int get hashCode => equalValue.hashCode;
}

final class StringCustomPatternValidator implements IFormModelValidator<String> {
  final RegExp pattern;

  const StringCustomPatternValidator({required this.pattern});

  @override
  FormErrorKey? validate(String? value) {
    if (value != null) {
      if (!pattern.hasMatch(value)) {
        return PredefinedFormErrorKey(PredefinedFormErrorType.didNotMatchPattern, pattern);
      }
    }
    return null;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StringCustomPatternValidator &&
          runtimeType == other.runtimeType &&
          pattern.pattern == other.pattern.pattern);

  @override
  int get hashCode => pattern.pattern.hashCode;
}

final class DateTimeValidator implements IFormModelValidator<String> {
  const DateTimeValidator();

  @override
  FormErrorKey? validate(String? value) {
    if (value != null) {
      final parsedDate = DateTime.tryParse(value);
      if (parsedDate == null) {
        return const PredefinedFormErrorKey(PredefinedFormErrorType.isNotValidDateTime);
      }
    }
    return null;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is DateTimeValidator && runtimeType == other.runtimeType);

  @override
  int get hashCode => runtimeType.hashCode;
}

final class EmailValidator implements IFormModelValidator<String> {
  const EmailValidator();

  @override
  FormErrorKey? validate(String? value) {
    if (value != null) {
      if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(value)) {
        return const PredefinedFormErrorKey(PredefinedFormErrorType.isNotValidEmail);
      }
    }
    return null;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is EmailValidator && runtimeType == other.runtimeType);

  @override
  int get hashCode => runtimeType.hashCode;
}

final class EqualLengthValidator implements IFormModelValidator<String> {
  final int? length;

  const EqualLengthValidator({this.length});

  @override
  FormErrorKey? validate(String? value) {
    if (value != null) {
      if (length != null) {
        if (value.length != length!) {
          return PredefinedFormErrorKey(PredefinedFormErrorType.lengthIsNotEqual, length);
        }
      }
    }
    return null;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EqualLengthValidator && runtimeType == other.runtimeType && length == other.length);

  @override
  int get hashCode => length.hashCode;
}

final class IpAddressValidator implements IFormModelValidator<String> {
  const IpAddressValidator();

  @override
  FormErrorKey? validate(String? value) {
    if (value != null) {
      final ipv4Pattern = RegExp(
          r'^([01]?\d\d?|2[0-4]\d|25[0-5])\.([01]?\d\d?|2[0-4]\d|25[0-5])\.([01]?\d\d?|2[0-4]\d|25[0-5])\.([01]?\d\d?|2[0-4]\d|25[0-5])$');
      if (!ipv4Pattern.hasMatch(value)) {
        return const PredefinedFormErrorKey(PredefinedFormErrorType.isNotValidIpAddress);
      }
    }

    return null;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is IpAddressValidator && runtimeType == other.runtimeType);

  @override
  int get hashCode => runtimeType.hashCode;
}

final class Ipv6AddressValidator implements IFormModelValidator<String> {
  const Ipv6AddressValidator();

  @override
  FormErrorKey? validate(String? value) {
    if (value != null) {
      final ipv6Pattern = RegExp(
          r'^(([0-9a-fA-F]{1,4}:){7}([0-9a-fA-F]{1,4}|:))|(([0-9a-fA-F]{1,4}:){6}(:[0-9a-fA-F]{1,4}|((25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)(\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){3}))|(([0-9a-fA-F]{1,4}:){5}(:[0-9a-fA-F]{1,4}|(:[0-9a-fA-F]{1,4}){2})|(([0-9a-fA-F]{1,4}:){4}(:[0-9a-fA-F]{1,4}|(:[0-9a-fA-F]{1,4}){3}))|(([0-9a-fA-F]{1,4}:){3}(:[0-9a-fA-F]{1,4}|(:[0-9a-fA-F]{1,4}){4}))|(([0-9a-fA-F]{1,4}:){2}(:[0-9a-fA-F]{1,4}|(:[0-9a-fA-F]{1,4}){5}))|([0-9a-fA-F]{1,4}:((:[0-9a-fA-F]{1,4}){6}))|(:((:[0-9a-fA-F]{1,4}){7}|:))))$');
      if (!ipv6Pattern.hasMatch(value)) {
        return const PredefinedFormErrorKey(PredefinedFormErrorType.isNotValidIpv6Address);
      }
    }
    return null;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is Ipv6AddressValidator && runtimeType == other.runtimeType);

  @override
  int get hashCode => runtimeType.hashCode;
}

final class StringNumMinValidator implements IFormModelValidator<String> {
  final num min;

  const StringNumMinValidator({required this.min});

  @override
  FormErrorKey? validate(String? value) {
    if (value != null) {
      final numValue = num.tryParse(value);
      if (numValue != null && numValue < min) {
        return PredefinedFormErrorKey(PredefinedFormErrorType.numIsLessThanMin, min);
      }
    }
    return null;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StringNumMinValidator && runtimeType == other.runtimeType && min == other.min);

  @override
  int get hashCode => min.hashCode;
}

final class StringNumMaxValidator implements IFormModelValidator<String> {
  final num max;

  const StringNumMaxValidator({required this.max});

  @override
  FormErrorKey? validate(String? value) {
    if (value != null) {
      final numValue = num.tryParse(value);
      if (numValue != null && numValue > max) {
        return PredefinedFormErrorKey(PredefinedFormErrorType.numIsMoreThanMax, max);
      }
    }
    return null;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StringNumMaxValidator && runtimeType == other.runtimeType && max == other.max);

  @override
  int get hashCode => max.hashCode;
}

final class StringNumbersOnlyValidator implements IFormModelValidator<String> {
  const StringNumbersOnlyValidator();

  @override
  FormErrorKey? validate(String? value) {
    if (value != null) {
      if (!RegExp(r'^[0-9]*$').hasMatch(value)) {
        return const PredefinedFormErrorKey(PredefinedFormErrorType.isNotOnlyNumbers);
      }
    }
    return null;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is StringNumbersOnlyValidator && runtimeType == other.runtimeType);

  @override
  int get hashCode => runtimeType.hashCode;
}

final class StringPhoneNumberValidator implements IFormModelValidator<String> {
  const StringPhoneNumberValidator();

  @override
  FormErrorKey? validate(String? value) {
    if (value != null) {
      if (!RegExp(r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$').hasMatch(value)) {
        return const PredefinedFormErrorKey(PredefinedFormErrorType.isNotValidPhoneNumber);
      }
    }
    return null;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is StringPhoneNumberValidator && runtimeType == other.runtimeType);

  @override
  int get hashCode => runtimeType.hashCode;
}

final class StringTextOnlyValidator implements IFormModelValidator<String> {
  const StringTextOnlyValidator();

  @override
  FormErrorKey? validate(String? value) {
    if (value != null) {
      if (!RegExp(r'^[a-zA-Z]*$').hasMatch(value)) {
        return const PredefinedFormErrorKey(PredefinedFormErrorType.isNotOnlyText);
      }
    }
    return null;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is StringTextOnlyValidator && runtimeType == other.runtimeType);

  @override
  int get hashCode => runtimeType.hashCode;
}

final class StringUrlValidator implements IFormModelValidator<String> {
  const StringUrlValidator();

  @override
  FormErrorKey? validate(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return const PredefinedFormErrorKey(PredefinedFormErrorType.isNotValidUrl);
      }

      try {
        final uri = Uri.parse(value);
        if (!uri.hasScheme || !uri.hasAuthority) {
          return const PredefinedFormErrorKey(PredefinedFormErrorType.isNotValidUrl);
        }

        if (!['http', 'https', 'ftp'].contains(uri.scheme.toLowerCase())) {
          return const PredefinedFormErrorKey(PredefinedFormErrorType.isNotValidUrl);
        }

        final hostRegex = RegExp(r'^[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*\.[a-zA-Z]{2,}$');
        if (!hostRegex.hasMatch(uri.host)) {
          return const PredefinedFormErrorKey(PredefinedFormErrorType.isNotValidUrl);
        }
      } catch (_) {
        return const PredefinedFormErrorKey(PredefinedFormErrorType.isNotValidUrl);
      }

      return null;
    }
    return null;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is StringUrlValidator && runtimeType == other.runtimeType);

  @override
  int get hashCode => runtimeType.hashCode;
}

final class StringWordsCountMinValidator implements IFormModelValidator<String> {
  final int minWords;

  const StringWordsCountMinValidator({required this.minWords});

  @override
  FormErrorKey? validate(String? value) {
    if (value != null && value.isNotEmpty) {
      final wordCount = value.trim().split(RegExp(r'\s+')).length;

      if (wordCount < minWords) {
        return PredefinedFormErrorKey(PredefinedFormErrorType.wordCountIsLessThan, minWords);
      }
    }
    return null;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StringWordsCountMinValidator && runtimeType == other.runtimeType && minWords == other.minWords);

  @override
  int get hashCode => minWords.hashCode;
}

final class StringWordsCountMaxValidator implements IFormModelValidator<String> {
  final int maxWords;

  const StringWordsCountMaxValidator({required this.maxWords});

  @override
  FormErrorKey? validate(String? value) {
    if (value != null && value.isNotEmpty) {
      final wordCount = value.trim().split(RegExp(r'\s+')).length;

      if (wordCount > maxWords) {
        return PredefinedFormErrorKey(PredefinedFormErrorType.wordCountIsMoreThan, maxWords);
      }
    }
    return null;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StringWordsCountMaxValidator && runtimeType == other.runtimeType && maxWords == other.maxWords);

  @override
  int get hashCode => maxWords.hashCode;
}

final class StringConfirmPasswordMatchValidator implements IFormModelValidator<String> {
  final String? matchingValue;

  const StringConfirmPasswordMatchValidator({this.matchingValue});

  @override
  FormErrorKey? validate(String? value) {
    if (value != null && matchingValue != null && value != matchingValue) {
      return const PredefinedFormErrorKey(PredefinedFormErrorType.passwordsDoNotMatch);
    }
    return null;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StringConfirmPasswordMatchValidator &&
          runtimeType == other.runtimeType &&
          matchingValue == other.matchingValue);

  @override
  int get hashCode => matchingValue.hashCode;
}

class PasswordLengthValidator implements IFormModelValidator<String> {
  final int minLength;

  const PasswordLengthValidator({required this.minLength});

  @override
  FormErrorKey? validate(String? value) {
    if (value == null || value.length < minLength) {
      return PredefinedFormErrorKey(PredefinedFormErrorType.passwordTooShort, minLength);
    }
    return null;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PasswordLengthValidator && runtimeType == other.runtimeType && minLength == other.minLength;

  @override
  int get hashCode => minLength.hashCode;
}

class PasswordUppercaseValidator implements IFormModelValidator<String> {
  const PasswordUppercaseValidator();

  @override
  FormErrorKey? validate(String? value) {
    if (value == null || !value.contains(RegExp(r'[A-Z]'))) {
      return const PredefinedFormErrorKey(PredefinedFormErrorType.passwordNoUppercase);
    }
    return null;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is PasswordUppercaseValidator && runtimeType == other.runtimeType;

  @override
  int get hashCode => runtimeType.hashCode;
}

class PasswordLowercaseValidator implements IFormModelValidator<String> {
  const PasswordLowercaseValidator();

  @override
  FormErrorKey? validate(String? value) {
    if (value == null || !value.contains(RegExp(r'[a-z]'))) {
      return const PredefinedFormErrorKey(PredefinedFormErrorType.passwordNoLowercase);
    }
    return null;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is PasswordLowercaseValidator && runtimeType == other.runtimeType;

  @override
  int get hashCode => runtimeType.hashCode;
}

class PasswordNumberValidator implements IFormModelValidator<String> {
  const PasswordNumberValidator();

  @override
  FormErrorKey? validate(String? value) {
    if (value == null || !value.contains(RegExp(r'[0-9]'))) {
      return const PredefinedFormErrorKey(PredefinedFormErrorType.passwordNoNumber);
    }
    return null;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is PasswordNumberValidator && runtimeType == other.runtimeType;

  @override
  int get hashCode => runtimeType.hashCode;
}

class PasswordSpecialCharValidator implements IFormModelValidator<String> {
  final String specialChars;

  const PasswordSpecialCharValidator({this.specialChars = r'!@#$%^&*(),.?":{}|<>'});

  @override
  FormErrorKey? validate(String? value) {
    if (value == null || !value.contains(RegExp('[$specialChars]'))) {
      return PredefinedFormErrorKey(PredefinedFormErrorType.passwordNoSpecialChar, specialChars);
    }
    return null;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PasswordSpecialCharValidator && runtimeType == other.runtimeType && specialChars == other.specialChars;

  @override
  int get hashCode => specialChars.hashCode;
}
