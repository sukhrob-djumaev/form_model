import 'package:flutter_test/flutter_test.dart';
import 'package:form_model/form_model.dart';

void main() {
  group('Validators', () {
    group('RequiredValidator', () {
      test('returns error when value is null', () {
        final validator = RequiredValidator<String>();
        expect(validator.validate(null), isA<PredefinedFormErrorKey>());
      });

      test('returns null when value is not null', () {
        final validator = RequiredValidator<String>();
        expect(validator.validate('test'), isNull);
      });
    });

    group('StringMinLengthValidator', () {
      test('returns error when string is shorter than minLength', () {
        final validator = StringMinLengthValidator(minLength: 5);
        expect(validator.validate('test'), isA<PredefinedFormErrorKey>());
      });

      test('returns null when string is longer than or equal to minLength', () {
        final validator = StringMinLengthValidator(minLength: 5);
        expect(validator.validate('test12'), isNull);
      });
    });

    group('StringMaxLengthValidator', () {
      test('returns error when string is longer than maxLength', () {
        final validator = StringMaxLengthValidator(maxLength: 5);
        expect(validator.validate('test123'), isA<PredefinedFormErrorKey>());
      });

      test('returns null when string is shorter than or equal to maxLength', () {
        final validator = StringMaxLengthValidator(maxLength: 5);
        expect(validator.validate('test'), isNull);
      });
    });

    group('StringCustomValidator', () {
      test('returns error when custom validation fails', () {
        final validator = StringCustomValidator(
          validator: (value) => value?.isEmpty ?? true ? 'Error' : null,
        );
        expect(validator.validate(''), isA<CustomFormErrorKey>());
      });

      test('returns null when custom validation passes', () {
        final validator = StringCustomValidator(
          validator: (value) => value?.isNotEmpty ?? false ? null : 'Error',
        );
        expect(validator.validate('test'), isNull);
      });
    });

    group('StringDateTimeAgeMinValidator', () {
      test('returns error when age is less than minimum', () {
        final validator = StringDateTimeAgeMinValidator(minAge: 18);
        final today = DateTime.now();
        final underageDate = DateTime(today.year - 17, today.month, today.day).toIso8601String();
        expect(validator.validate(underageDate), isA<PredefinedFormErrorKey>());
      });

      test('returns null when age is equal to or greater than minimum', () {
        final validator = StringDateTimeAgeMinValidator(minAge: 18);
        final today = DateTime.now();
        final validDate = DateTime(today.year - 18, today.month, today.day).toIso8601String();
        expect(validator.validate(validDate), isNull);
      });
    });

    group('StringDateTimeAgeMaxValidator', () {
      test('returns error when age is greater than maximum', () {
        final validator = StringDateTimeAgeMaxValidator(maxAge: 65);
        final today = DateTime.now();
        final overageDate = DateTime(today.year - 66, today.month, today.day).toIso8601String();
        expect(validator.validate(overageDate), isA<PredefinedFormErrorKey>());
      });

      test('returns null when age is equal to or less than maximum', () {
        final validator = StringDateTimeAgeMaxValidator(maxAge: 65);
        final today = DateTime.now();
        final validDate = DateTime(today.year - 65, today.month, today.day).toIso8601String();
        expect(validator.validate(validDate), isNull);
      });
    });

    group('BoolAgreeToTermsAndConditionsValidator', () {
      test('returns error when value is not true', () {
        final validator = BoolAgreeToTermsAndConditionsValidator();
        expect(validator.validate(false), isA<PredefinedFormErrorKey>());
        expect(validator.validate(null), isA<PredefinedFormErrorKey>());
      });

      test('returns null when value is true', () {
        final validator = BoolAgreeToTermsAndConditionsValidator();
        expect(validator.validate(true), isNull);
      });
    });

    group('BoolFalseValidator', () {
      test('returns error when value is not false', () {
        final validator = BoolFalseValidator();
        expect(validator.validate(true), isA<PredefinedFormErrorKey>());
        expect(validator.validate(null), isA<PredefinedFormErrorKey>());
      });

      test('returns null when value is false', () {
        final validator = BoolFalseValidator();
        expect(validator.validate(false), isNull);
      });
    });

    group('BoolTrueValidator', () {
      test('returns error when value is not true', () {
        final validator = BoolTrueValidator();
        expect(validator.validate(false), isA<PredefinedFormErrorKey>());
        expect(validator.validate(null), isA<PredefinedFormErrorKey>());
      });

      test('returns null when value is true', () {
        final validator = BoolTrueValidator();
        expect(validator.validate(true), isNull);
      });
    });

    group('StringCreditCardValidator', () {
      test('returns error for invalid credit card number', () {
        final validator = StringCreditCardValidator();
        expect(validator.validate('1234567890123456'), isA<PredefinedFormErrorKey>());
      });

      test('returns null for valid credit card number', () {
        final validator = StringCreditCardValidator();
        expect(validator.validate('4111111111111111'), isNull);
      });
    });

    group('CustomEqualValidator', () {
      test('returns error when value is not equal', () {
        final validator = CustomEqualValidator<String>(equalValue: 'test');
        expect(validator.validate('not test'), isA<PredefinedFormErrorKey>());
      });

      test('returns null when value is equal', () {
        final validator = CustomEqualValidator<String>(equalValue: 'test');
        expect(validator.validate('test'), isNull);
      });
    });

    group('StringCustomPatternValidator', () {
      test('returns error when pattern does not match', () {
        final validator = StringCustomPatternValidator(pattern: RegExp(r'^[a-z]+$'));
        expect(validator.validate('123'), isA<PredefinedFormErrorKey>());
      });

      test('returns null when pattern matches', () {
        final validator = StringCustomPatternValidator(pattern: RegExp(r'^[a-z]+$'));
        expect(validator.validate('abc'), isNull);
      });
    });

    group('DateTimeValidator', () {
      test('returns error for invalid date string', () {
        final validator = DateTimeValidator();
        expect(validator.validate('not a date'), isA<PredefinedFormErrorKey>());
      });

      test('returns null for valid date string', () {
        final validator = DateTimeValidator();
        expect(validator.validate('2023-05-17'), isNull);
      });
    });

    group('EmailValidator', () {
      test('returns error for invalid email', () {
        final validator = EmailValidator();
        expect(validator.validate('notanemail'), isA<PredefinedFormErrorKey>());
      });

      test('returns null for valid email', () {
        final validator = EmailValidator();
        expect(validator.validate('test@example.com'), isNull);
      });
    });

    group('EqualLengthValidator', () {
      test('returns error when length is not equal', () {
        final validator = EqualLengthValidator(length: 5);
        expect(validator.validate('test'), isA<PredefinedFormErrorKey>());
      });

      test('returns null when length is equal', () {
        final validator = EqualLengthValidator(length: 4);
        expect(validator.validate('test'), isNull);
      });
    });

    group('IpAddressValidator', () {
      test('returns error for invalid IP address', () {
        final validator = IpAddressValidator();
        expect(validator.validate('256.0.0.1'), isA<PredefinedFormErrorKey>());
      });

      test('returns null for valid IP address', () {
        final validator = IpAddressValidator();
        expect(validator.validate('192.168.0.1'), isNull);
      });
    });

    group('Ipv6AddressValidator', () {
      test('returns error for invalid IPv6 address', () {
        final validator = Ipv6AddressValidator();
        expect(validator.validate('2001:0db8:85a3:0000:0000:8a2e:0370:7334:'), isA<PredefinedFormErrorKey>());
      });

      test('returns null for valid IPv6 address', () {
        final validator = Ipv6AddressValidator();
        expect(validator.validate('2001:0db8:85a3:0000:0000:8a2e:0370:7334'), isNull);
      });
    });

    group('StringNumMinValidator', () {
      test('returns error when number is less than minimum', () {
        final validator = StringNumMinValidator(min: 5);
        expect(validator.validate('4'), isA<PredefinedFormErrorKey>());
      });

      test('returns null when number is equal to or greater than minimum', () {
        final validator = StringNumMinValidator(min: 5);
        expect(validator.validate('5'), isNull);
      });
    });

    group('StringNumMaxValidator', () {
      test('returns error when number is greater than maximum', () {
        final validator = StringNumMaxValidator(max: 5);
        expect(validator.validate('6'), isA<PredefinedFormErrorKey>());
      });

      test('returns null when number is equal to or less than maximum', () {
        final validator = StringNumMaxValidator(max: 5);
        expect(validator.validate('5'), isNull);
      });
    });

    group('StringNumbersOnlyValidator', () {
      test('returns error when string contains non-numeric characters', () {
        final validator = StringNumbersOnlyValidator();
        expect(validator.validate('123a'), isA<PredefinedFormErrorKey>());
      });

      test('returns null when string contains only numbers', () {
        final validator = StringNumbersOnlyValidator();
        expect(validator.validate('123'), isNull);
      });
    });

    group('StringPhoneNumberValidator', () {
      test('returns error for invalid phone number', () {
        final validator = StringPhoneNumberValidator();
        expect(validator.validate('123'), isA<PredefinedFormErrorKey>());
      });

      test('returns null for valid phone number', () {
        final validator = StringPhoneNumberValidator();
        expect(validator.validate('+1234567890'), isNull);
      });
    });

    group('StringTextOnlyValidator', () {
      test('returns error when string contains non-alphabetic characters', () {
        final validator = StringTextOnlyValidator();
        expect(validator.validate('abc123'), isA<PredefinedFormErrorKey>());
      });

      test('returns null when string contains only alphabetic characters', () {
        final validator = StringTextOnlyValidator();
        expect(validator.validate('abc'), isNull);
      });
    });

    group('StringUrlValidator', () {
      test('returns error for invalid URL', () {
        final validator = StringUrlValidator();
        expect(validator.validate('not a url'), isA<PredefinedFormErrorKey>());
      });

      test('returns null for valid URL', () {
        final validator = StringUrlValidator();
        expect(validator.validate('https://www.example.com'), isNull);
      });
    });

    group('StringWordsCountMinValidator', () {
      test('returns error when word count is less than minimum', () {
        final validator = StringWordsCountMinValidator(minWords: 3);
        expect(validator.validate('two words'), isA<PredefinedFormErrorKey>());
      });

      test('returns null when word count is equal to or greater than minimum', () {
        final validator = StringWordsCountMinValidator(minWords: 3);
        expect(validator.validate('three words here'), isNull);
      });
    });

    group('StringWordsCountMaxValidator', () {
      test('returns error when word count is greater than maximum', () {
        final validator = StringWordsCountMaxValidator(maxWords: 3);
        expect(validator.validate('four words are here'), isA<PredefinedFormErrorKey>());
      });

      test('returns null when word count is equal to or less than maximum', () {
        final validator = StringWordsCountMaxValidator(maxWords: 3);
        expect(validator.validate('three words here'), isNull);
      });
    });

    //   group('StringConfirmPasswordMatchValidator', () {
    //     test('returns error when passwords do not match', () {
    //       final validator = StringConfirmPasswordMatchValidator(
    //         matchingValue: () => 'password123',
    //       );
    //       expect(validator.validate('password456'), isA<PredefinedFormErrorKey>());
    //     });

    //     test('returns null when passwords match', () {
    //       final validator = StringConfirmPasswordMatchValidator(
    //         matchingValue: () => 'password123',
    //       );
    //       expect(validator.validate('password123'), isNull);
    //     });
    //   });
  });
}
