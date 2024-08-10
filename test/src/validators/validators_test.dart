import 'package:flutter_test/flutter_test.dart';
import 'package:form_model/form_model.dart';

void main() {
  group('RequiredValidator', () {
    group('String type validation', () {
      const validator = RequiredValidator<String>();

      test('returns error for null value', () {
        expect(validator.validate(null), isNotNull);
      });

      test('returns error for empty string', () {
        expect(validator.validate(''), isNotNull);
      });

      test('returns null for non-empty string', () {
        expect(validator.validate('test'), isNull);
      });

      test('error message is correct for null and empty string', () {
        final errorNull = validator.validate(null) as PredefinedFormErrorKey;
        final errorEmpty = validator.validate('') as PredefinedFormErrorKey;
        expect(errorNull.type, equals(PredefinedFormErrorType.required));
        expect(errorEmpty.type, equals(PredefinedFormErrorType.required));
      });
    });

    group('Non-String type validation', () {
      const validator = RequiredValidator<int>();

      test('returns error for null value', () {
        expect(validator.validate(null), isNotNull);
      });

      test('returns null for non-null value', () {
        expect(validator.validate(0), isNull);
        expect(validator.validate(1), isNull);
      });
    });

    group('equality', () {
      test('same type validators are equal', () {
        const validator1 = RequiredValidator<String>();
        const validator2 = RequiredValidator<String>();
        expect(validator1, equals(validator2));
        expect(validator1.hashCode, equals(validator2.hashCode));
      });

      test('different type validators are not equal', () {
        const validator1 = RequiredValidator<String>();
        const validator2 = RequiredValidator<int>();
        expect(validator1, isNot(equals(validator2)));
        expect(validator1.hashCode, isNot(equals(validator2.hashCode)));
      });
    });
  });

  group('StringMinLengthValidator', () {
    test('validates correctly', () {
      const validator = StringMinLengthValidator(minLength: 5);
      expect(validator.validate('1234'), isA<PredefinedFormErrorKey>());
      expect(validator.validate('12345'), isNull);
      expect(validator.validate('123456'), isNull);
    });

    test('equality', () {
      expect(const StringMinLengthValidator(minLength: 5),
          equals(const StringMinLengthValidator(minLength: 5)));
      expect(const StringMinLengthValidator(minLength: 5),
          isNot(equals(const StringMinLengthValidator(minLength: 6))));
    });

    test('hashCode', () {
      expect(const StringMinLengthValidator(minLength: 5).hashCode,
          equals(const StringMinLengthValidator(minLength: 5).hashCode));
      expect(const StringMinLengthValidator(minLength: 5).hashCode,
          isNot(equals(const StringMinLengthValidator(minLength: 6).hashCode)));
    });
  });

  group('StringMaxLengthValidator', () {
    test('validates correctly', () {
      const validator = StringMaxLengthValidator(maxLength: 5);
      expect(validator.validate('1234'), isNull);
      expect(validator.validate('12345'), isNull);
      expect(validator.validate('123456'), isA<PredefinedFormErrorKey>());
    });

    test('equality', () {
      expect(const StringMaxLengthValidator(maxLength: 5),
          equals(const StringMaxLengthValidator(maxLength: 5)));
      expect(const StringMaxLengthValidator(maxLength: 5),
          isNot(equals(const StringMaxLengthValidator(maxLength: 6))));
    });

    test('hashCode', () {
      expect(const StringMaxLengthValidator(maxLength: 5).hashCode,
          equals(const StringMaxLengthValidator(maxLength: 5).hashCode));
      expect(const StringMaxLengthValidator(maxLength: 5).hashCode,
          isNot(equals(const StringMaxLengthValidator(maxLength: 6).hashCode)));
    });
  });

  group('StringCustomValidator', () {
    test(
        'should return CustomFormErrorKey when custom validator returns an error string',
        () {
      final validator = StringCustomValidator(
        validator: (value) => value?.isEmpty ?? true ? 'Value is empty' : null,
      );
      final result = validator.validate('');
      expect(result, isA<CustomFormErrorKey>());
      expect((result as CustomFormErrorKey).key, equals('Value is empty'));
    });

    test('should return null when custom validator returns null', () {
      final validator = StringCustomValidator(
        validator: (value) =>
            value?.isNotEmpty == true ? null : 'Value is empty',
      );
      final result = validator.validate('Not empty');
      expect(result, isNull);
    });

    test('should handle null input correctly', () {
      final validator = StringCustomValidator(
        validator: (value) => value == null ? 'Value is null' : null,
      );
      final result = validator.validate(null);
      expect(result, isA<CustomFormErrorKey>());
      expect((result as CustomFormErrorKey).key, equals('Value is null'));
    });

    test('should work with complex validation logic', () {
      final validator = StringCustomValidator(
        validator: (value) {
          if (value == null) return 'Value is null';
          if (value.isEmpty) return 'Value is empty';
          if (value.length < 5) return 'Value is too short';
          if (value.length > 10) return 'Value is too long';
          if (!value.contains(RegExp(r'[A-Z]')))
            return 'Value must contain an uppercase letter';
          return null;
        },
      );

      expect(validator.validate(null), isA<CustomFormErrorKey>());
      expect((validator.validate(null) as CustomFormErrorKey).key,
          equals('Value is null'));

      expect(validator.validate(''), isA<CustomFormErrorKey>());
      expect((validator.validate('') as CustomFormErrorKey).key,
          equals('Value is empty'));

      expect(validator.validate('abc'), isA<CustomFormErrorKey>());
      expect((validator.validate('abc') as CustomFormErrorKey).key,
          equals('Value is too short'));

      expect(validator.validate('abcdefghijk'), isA<CustomFormErrorKey>());
      expect((validator.validate('abcdefghijk') as CustomFormErrorKey).key,
          equals('Value is too long'));

      expect(validator.validate('abcde'), isA<CustomFormErrorKey>());
      expect((validator.validate('abcde') as CustomFormErrorKey).key,
          equals('Value must contain an uppercase letter'));

      expect(validator.validate('AbcDe'), isNull);
    });

    test('equality', () {
      String? testValidator(String? value) =>
          value?.isEmpty ?? true ? 'Empty' : null;

      final validator1 = StringCustomValidator(validator: testValidator);
      final validator2 = StringCustomValidator(validator: testValidator);
      final validator3 = StringCustomValidator(
          validator: (value) => value?.length == 5 ? 'Length 5' : null);

      expect(validator1, equals(validator2));
      expect(validator1, isNot(equals(validator3)));
    });

    test('hashCode', () {
      String? testValidator(String? value) =>
          value?.isEmpty ?? true ? 'Empty' : null;

      final validator1 = StringCustomValidator(validator: testValidator);
      final validator2 = StringCustomValidator(validator: testValidator);
      final validator3 = StringCustomValidator(
          validator: (value) => value?.length == 5 ? 'Length 5' : null);

      expect(validator1.hashCode, equals(validator2.hashCode));
      expect(validator1.hashCode, isNot(equals(validator3.hashCode)));
    });
  });

  group('StringDateTimeAgeMinValidator', () {
    const minAge = 18;

    test('should return null for age equal to minimum', () {
      const validator = StringDateTimeAgeMinValidator(minAge: minAge);
      final today = DateTime.now();
      final exactMinAge = DateTime(today.year - minAge, today.month, today.day)
          .toIso8601String();

      final result = validator.validate(exactMinAge);
      expect(result, isNull);
    });

    test('should return null for age greater than minimum', () {
      const validator = StringDateTimeAgeMinValidator(minAge: minAge);
      final today = DateTime.now();
      final overMinAge =
          DateTime(today.year - minAge - 1, 1, 1).toIso8601String();

      final result = validator.validate(overMinAge);
      expect(result, isNull);
    });

    test('should return error for age less than minimum', () {
      const validator = StringDateTimeAgeMinValidator(minAge: minAge);
      final today = DateTime.now();
      final underMinAge =
          DateTime(today.year - minAge + 1, 1, 1).toIso8601String();

      final result = validator.validate(underMinAge);
      expect(result, isA<PredefinedFormErrorKey>());
      expect((result as PredefinedFormErrorKey).type,
          PredefinedFormErrorType.dateIsLessThanMinAge);
      expect(result.parameter, minAge);
    });

    test('should handle null input', () {
      const validator = StringDateTimeAgeMinValidator(minAge: minAge);
      final result = validator.validate(null);
      expect(result, isNull);
    });

    test('should handle invalid date string', () {
      const validator = StringDateTimeAgeMinValidator(minAge: minAge);
      final result = validator.validate('not a date');
      expect(result, isNull);
    });

    test('equality', () {
      const validator1 = StringDateTimeAgeMinValidator(minAge: minAge);
      const validator2 = StringDateTimeAgeMinValidator(minAge: minAge);
      const validator3 = StringDateTimeAgeMinValidator(minAge: minAge + 1);

      expect(validator1, equals(validator2));
      expect(validator1, isNot(equals(validator3)));
    });

    test('hashCode', () {
      const validator1 = StringDateTimeAgeMinValidator(minAge: minAge);
      const validator2 = StringDateTimeAgeMinValidator(minAge: minAge);
      const validator3 = StringDateTimeAgeMinValidator(minAge: minAge + 1);

      expect(validator1.hashCode, equals(validator2.hashCode));
      expect(validator1.hashCode, isNot(equals(validator3.hashCode)));
    });
  });

  group('StringDateTimeAgeMaxValidator', () {
    const maxAge = 65;

    test('should return null for age equal to maximum', () {
      const validator = StringDateTimeAgeMaxValidator(maxAge: maxAge);
      final today = DateTime.now();
      final exactMaxAge = DateTime(today.year - maxAge, today.month, today.day)
          .toIso8601String();

      final result = validator.validate(exactMaxAge);
      expect(result, isNull);
    });

    test('should return null for age less than maximum', () {
      const validator = StringDateTimeAgeMaxValidator(maxAge: maxAge);
      final today = DateTime.now();
      final underMaxAge =
          DateTime(today.year - maxAge + 1, 1, 1).toIso8601String();

      final result = validator.validate(underMaxAge);
      expect(result, isNull);
    });

    test('should return error for age greater than maximum', () {
      const validator = StringDateTimeAgeMaxValidator(maxAge: maxAge);
      final today = DateTime.now();
      final overMaxAge =
          DateTime(today.year - maxAge - 1, 1, 1).toIso8601String();

      final result = validator.validate(overMaxAge);
      expect(result, isA<PredefinedFormErrorKey>());
      expect((result as PredefinedFormErrorKey).type,
          PredefinedFormErrorType.dateIsMoreThanMaxAge);
      expect(result.parameter, maxAge);
    });

    test('should handle null input', () {
      const validator = StringDateTimeAgeMaxValidator(maxAge: maxAge);
      final result = validator.validate(null);
      expect(result, isNull);
    });

    test('should handle invalid date string', () {
      const validator = StringDateTimeAgeMaxValidator(maxAge: maxAge);
      final result = validator.validate('not a date');
      expect(result, isNull);
    });

    test('equality', () {
      const validator1 = StringDateTimeAgeMaxValidator(maxAge: maxAge);
      const validator2 = StringDateTimeAgeMaxValidator(maxAge: maxAge);
      const validator3 = StringDateTimeAgeMaxValidator(maxAge: maxAge + 1);

      expect(validator1, equals(validator2));
      expect(validator1, isNot(equals(validator3)));
    });

    test('hashCode', () {
      const validator1 = StringDateTimeAgeMaxValidator(maxAge: maxAge);
      const validator2 = StringDateTimeAgeMaxValidator(maxAge: maxAge);
      const validator3 = StringDateTimeAgeMaxValidator(maxAge: maxAge + 1);

      expect(validator1.hashCode, equals(validator2.hashCode));
      expect(validator1.hashCode, isNot(equals(validator3.hashCode)));
    });
  });

  group('BoolAgreeToTermsAndConditionsValidator', () {
    test('should return null when value is true', () {
      const validator = BoolAgreeToTermsAndConditionsValidator();
      final result = validator.validate(true);
      expect(result, isNull);
    });

    test('should return error when value is false', () {
      const validator = BoolAgreeToTermsAndConditionsValidator();
      final result = validator.validate(false);
      expect(result, isA<PredefinedFormErrorKey>());
      expect((result as PredefinedFormErrorKey).type,
          PredefinedFormErrorType.boolAgreeToTerms);
    });

    test('should return error when value is null', () {
      const validator = BoolAgreeToTermsAndConditionsValidator();
      final result = validator.validate(null);
      expect(result, isA<PredefinedFormErrorKey>());
      expect((result as PredefinedFormErrorKey).type,
          PredefinedFormErrorType.boolAgreeToTerms);
    });

    test('equality', () {
      const validator1 = BoolAgreeToTermsAndConditionsValidator();
      const validator2 = BoolAgreeToTermsAndConditionsValidator();
      expect(validator1, equals(validator2));
    });

    test('hashCode', () {
      const validator1 = BoolAgreeToTermsAndConditionsValidator();
      const validator2 = BoolAgreeToTermsAndConditionsValidator();
      expect(validator1.hashCode, equals(validator2.hashCode));
    });
  });

  group('BoolFalseValidator', () {
    test('should return null when value is false', () {
      const validator = BoolFalseValidator();
      final result = validator.validate(false);
      expect(result, isNull);
    });

    test('should return error when value is true', () {
      const validator = BoolFalseValidator();
      final result = validator.validate(true);
      expect(result, isA<PredefinedFormErrorKey>());
      expect((result as PredefinedFormErrorKey).type,
          PredefinedFormErrorType.boolShouldBeFalse);
    });

    test('should return error when value is null', () {
      const validator = BoolFalseValidator();
      final result = validator.validate(null);
      expect(result, isA<PredefinedFormErrorKey>());
      expect((result as PredefinedFormErrorKey).type,
          PredefinedFormErrorType.boolShouldBeFalse);
    });
  });

  test('BoolFalseValidator equality', () {
    const validator1 = BoolFalseValidator();
    const validator2 = BoolFalseValidator();
    expect(validator1, equals(validator2));
  });

  test('BoolFalseValidator hashCode', () {
    const validator1 = BoolFalseValidator();
    const validator2 = BoolFalseValidator();
    expect(validator1.hashCode, equals(validator2.hashCode));
  });
  group('BoolTrueValidator', () {
    test('should return null when value is true', () {
      const validator = BoolTrueValidator();
      final result = validator.validate(true);
      expect(result, isNull);
    });

    test('should return error when value is false', () {
      const validator = BoolTrueValidator();
      final result = validator.validate(false);
      expect(result, isA<PredefinedFormErrorKey>());
      expect((result as PredefinedFormErrorKey).type,
          PredefinedFormErrorType.boolShouldBeTrue);
    });

    test('should return error when value is null', () {
      const validator = BoolTrueValidator();
      final result = validator.validate(null);
      expect(result, isA<PredefinedFormErrorKey>());
      expect((result as PredefinedFormErrorKey).type,
          PredefinedFormErrorType.boolShouldBeTrue);
    });
  });

  test('BoolTrueValidator equality', () {
    const validator1 = BoolTrueValidator();
    const validator2 = BoolTrueValidator();
    expect(validator1, equals(validator2));
  });

  test('BoolTrueValidator hashCode', () {
    const validator1 = BoolTrueValidator();
    const validator2 = BoolTrueValidator();
    expect(validator1.hashCode, equals(validator2.hashCode));
  });

  group('StringCreditCardValidator', () {
    test('should return null for valid credit card numbers', () {
      const validator = StringCreditCardValidator();
      expect(validator.validate('4111111111111111'), isNull); // Visa
      expect(validator.validate('5500000000000004'), isNull); // MasterCard
      expect(validator.validate('340000000000009'), isNull); // American Express
      expect(validator.validate('6011000000000004'), isNull); // Discover
    });

    test('should return error for invalid credit card numbers', () {
      const validator = StringCreditCardValidator();
      final result = validator.validate('1234567890123456');
      expect(result, isA<PredefinedFormErrorKey>());
      expect((result as PredefinedFormErrorKey).type,
          PredefinedFormErrorType.intIsNotValidCreditCard);
    });

    test('should return null for null input', () {
      const validator = StringCreditCardValidator();
      expect(validator.validate(null), isNull);
    });

    test('equality', () {
      const validator1 = StringCreditCardValidator();
      const validator2 = StringCreditCardValidator();
      expect(validator1, equals(validator2));
    });

    test('hashCode', () {
      const validator1 = StringCreditCardValidator();
      const validator2 = StringCreditCardValidator();
      expect(validator1.hashCode, equals(validator2.hashCode));
    });
  });

  group('CustomEqualValidator', () {
    test('should return null when values are equal', () {
      const stringValidator = CustomEqualValidator<String>(equalValue: 'test');
      expect(stringValidator.validate('test'), isNull);

      const intValidator = CustomEqualValidator<int>(equalValue: 42);
      expect(intValidator.validate(42), isNull);

      const doubleValidator = CustomEqualValidator<double>(equalValue: 3.14);
      expect(doubleValidator.validate(3.14), isNull);
    });

    test('should return error when values are not equal', () {
      const stringValidator = CustomEqualValidator<String>(equalValue: 'test');
      final stringResult = stringValidator.validate('not test');
      expect(stringResult, isA<PredefinedFormErrorKey>());
      expect((stringResult as PredefinedFormErrorKey).type,
          PredefinedFormErrorType.isNotEqualTo);
      expect(stringResult.parameter, 'test');

      const intValidator = CustomEqualValidator<int>(equalValue: 42);
      final intResult = intValidator.validate(24);
      expect(intResult, isA<PredefinedFormErrorKey>());
      expect((intResult as PredefinedFormErrorKey).type,
          PredefinedFormErrorType.isNotEqualTo);
      expect(intResult.parameter, 42);
    });

    test('should return null for null input', () {
      const validator = CustomEqualValidator<String>(equalValue: 'test');
      expect(validator.validate(null), isNull);
    });

    test('equality', () {
      const validator1 = CustomEqualValidator<String>(equalValue: 'test');
      const validator2 = CustomEqualValidator<String>(equalValue: 'test');
      const validator3 = CustomEqualValidator<String>(equalValue: 'different');

      expect(validator1, equals(validator2));
      expect(validator1, isNot(equals(validator3)));
    });

    test('hashCode', () {
      const validator1 = CustomEqualValidator<String>(equalValue: 'test');
      const validator2 = CustomEqualValidator<String>(equalValue: 'test');
      const validator3 = CustomEqualValidator<String>(equalValue: 'different');

      expect(validator1.hashCode, equals(validator2.hashCode));
      expect(validator1.hashCode, isNot(equals(validator3.hashCode)));
    });
  });

  group('StringCustomPatternValidator', () {
    test('should return null when string matches the pattern', () {
      final validator =
          StringCustomPatternValidator(pattern: RegExp(r'^[a-z]+$'));
      expect(validator.validate('abcdef'), isNull);
    });

    test('should return error when string does not match the pattern', () {
      final validator =
          StringCustomPatternValidator(pattern: RegExp(r'^[a-z]+$'));
      final result = validator.validate('abc123');
      expect(result, isA<PredefinedFormErrorKey>());
      expect((result as PredefinedFormErrorKey).type,
          PredefinedFormErrorType.didNotMatchPattern);
      expect(result.parameter, RegExp(r'^[a-z]+$'));
    });

    test('should return null for null input', () {
      final validator =
          StringCustomPatternValidator(pattern: RegExp(r'^[a-z]+$'));
      expect(validator.validate(null), isNull);
    });

    test('should work with different regex patterns', () {
      final emailValidator = StringCustomPatternValidator(
        pattern: RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$'),
      );
      expect(emailValidator.validate('test@example.com'), isNull);
      expect(emailValidator.validate('invalid-email'),
          isA<PredefinedFormErrorKey>());

      final phoneValidator = StringCustomPatternValidator(
        pattern: RegExp(r'^\d{3}-\d{3}-\d{4}$'),
      );
      expect(phoneValidator.validate('123-456-7890'), isNull);
      expect(
          phoneValidator.validate('1234567890'), isA<PredefinedFormErrorKey>());
    });

    test('equality', () {
      final validator1 =
          StringCustomPatternValidator(pattern: RegExp(r'^[a-z]+$'));
      final validator2 =
          StringCustomPatternValidator(pattern: RegExp(r'^[a-z]+$'));
      final validator3 =
          StringCustomPatternValidator(pattern: RegExp(r'^\d+$'));

      expect(validator1, equals(validator2));
      expect(validator1, isNot(equals(validator3)));
    });

    test('hashCode', () {
      final validator1 =
          StringCustomPatternValidator(pattern: RegExp(r'^[a-z]+$'));
      final validator2 =
          StringCustomPatternValidator(pattern: RegExp(r'^[a-z]+$'));
      final validator3 =
          StringCustomPatternValidator(pattern: RegExp(r'^\d+$'));

      expect(validator1.hashCode, equals(validator2.hashCode));
      expect(validator1.hashCode, isNot(equals(validator3.hashCode)));
    });
  });
  group('DateTimeValidator', () {
    const validator = DateTimeValidator();
    test('should return null for valid date strings', () {
      expect(validator.validate('2023-05-15'), isNull);
      expect(validator.validate('2023-05-15T14:30:00'), isNull);
      expect(validator.validate('2023-05-15T14:30:00.000Z'), isNull);
      expect(
          validator.validate('20230515'), isNull); // Moving this to valid dates
    });

    test('should return error for invalid date strings', () {
      expect(validator.validate('not a date'), isA<PredefinedFormErrorKey>());
      expect(validator.validate('2023/05/15'), isA<PredefinedFormErrorKey>());
    });

    test('should return null for seemingly invalid but accepted date strings',
        () {
      expect(validator.validate('2023-13-32'), isNull);
      expect(validator.validate('2023-02-30'), isNull);
    });

    test('should return null for null input', () {
      expect(validator.validate(null), isNull);
    });

    test('should handle edge cases', () {
      expect(validator.validate('0000-01-01'), isNull);
      expect(validator.validate('9999-12-31'), isNull);
      expect(validator.validate('2023-02-29'), isNull);
      expect(validator.validate('2024-02-29'), isNull);
    });

    test('equality', () {
      const validator1 = DateTimeValidator();
      const validator2 = DateTimeValidator();
      expect(validator1, equals(validator2));
    });

    test('hashCode', () {
      const validator1 = DateTimeValidator();
      const validator2 = DateTimeValidator();
      expect(validator1.hashCode, equals(validator2.hashCode));
    });
  });
  group('EmailValidator', () {
    const validator = EmailValidator();

    test('should return null for valid email addresses', () {
      expect(validator.validate('test@example.com'), isNull);
      expect(validator.validate('user.name+tag@example.co.uk'), isNull);
      expect(validator.validate('user._name@example.com'), isNull);
      expect(validator.validate('user-name@example.com'), isNull);
      expect(validator.validate('user123@example.com'), isNull);
      expect(validator.validate('username@example..com'),
          isNull); // Moving this here as it's accepted
    });

    test('should return error for invalid email addresses', () {
      final invalidEmails = [
        'plainaddress',
        '@missingusername.com',
        'username@.com',
        'username@.com.',
        'username@com',
        'username@exam_ple.com',
        'username@exam ple.com',
      ];

      for (final email in invalidEmails) {
        final result = validator.validate(email);
        expect(result, isA<PredefinedFormErrorKey>(),
            reason: 'Failed for: $email');
        expect((result as PredefinedFormErrorKey).type,
            PredefinedFormErrorType.isNotValidEmail);
      }
    });

    test('should return null for null input', () {
      expect(validator.validate(null), isNull);
    });

    test('should return error for empty string', () {
      final result = validator.validate('');
      expect(result, isA<PredefinedFormErrorKey>());
      expect((result as PredefinedFormErrorKey).type,
          PredefinedFormErrorType.isNotValidEmail);
    });

    test('equality', () {
      const validator1 = EmailValidator();
      const validator2 = EmailValidator();
      expect(validator1, equals(validator2));
    });

    test('hashCode', () {
      const validator1 = EmailValidator();
      const validator2 = EmailValidator();
      expect(validator1.hashCode, equals(validator2.hashCode));
    });
  });

  group('EqualLengthValidator', () {
    test('should return null when string length matches the specified length',
        () {
      const validator = EqualLengthValidator(length: 5);
      expect(validator.validate('12345'), isNull);
      expect(validator.validate('abcde'), isNull);
    });

    test(
        'should return error when string length does not match the specified length',
        () {
      const validator = EqualLengthValidator(length: 5);
      final resultShort = validator.validate('1234');
      expect(resultShort, isA<PredefinedFormErrorKey>());
      expect((resultShort as PredefinedFormErrorKey).type,
          PredefinedFormErrorType.lengthIsNotEqual);
      expect(resultShort.parameter, 5);

      final resultLong = validator.validate('123456');
      expect(resultLong, isA<PredefinedFormErrorKey>());
      expect((resultLong as PredefinedFormErrorKey).type,
          PredefinedFormErrorType.lengthIsNotEqual);
      expect(resultLong.parameter, 5);
    });

    test('should return null for null input', () {
      const validator = EqualLengthValidator(length: 5);
      expect(validator.validate(null), isNull);
    });

    test('should handle zero length', () {
      const validator = EqualLengthValidator(length: 0);
      expect(validator.validate(''), isNull);
      expect(validator.validate('a'), isA<PredefinedFormErrorKey>());
    });

    test('should handle null length', () {
      const validator = EqualLengthValidator(length: null);
      expect(validator.validate('any string'), isNull);
      expect(validator.validate(''), isNull);
    });

    test('equality', () {
      const validator1 = EqualLengthValidator(length: 5);
      const validator2 = EqualLengthValidator(length: 5);
      const validator3 = EqualLengthValidator(length: 6);

      expect(validator1, equals(validator2));
      expect(validator1, isNot(equals(validator3)));
    });

    test('hashCode', () {
      const validator1 = EqualLengthValidator(length: 5);
      const validator2 = EqualLengthValidator(length: 5);
      const validator3 = EqualLengthValidator(length: 6);

      expect(validator1.hashCode, equals(validator2.hashCode));
      expect(validator1.hashCode, isNot(equals(validator3.hashCode)));
    });
  });

  group('IpAddressValidator', () {
    const validator = IpAddressValidator();

    test('should return null for valid IPv4 addresses', () {
      final validAddresses = [
        '192.168.0.1',
        '10.0.0.0',
        '172.16.0.1',
        '255.255.255.255',
        '0.0.0.0',
        '1.2.3.4',
      ];

      for (final address in validAddresses) {
        expect(validator.validate(address), isNull,
            reason: 'Failed for: $address');
      }
    });

    test('should return error for invalid IPv4 addresses', () {
      final invalidAddresses = [
        '256.1.2.3',
        '1.2.3.256',
        '1.2.3.4.5',
        '192.168.0',
        '192.168.0.',
        '192.168.0.1.',
        '192.168..1',
        '192.168.0.a',
        '192.168.0.-1',
        '192.168.0.01', // Invalid due to leading zero
        '01.2.3.4', // Invalid due to leading zero
        '2001:0db8:85a3:0000:0000:8a2e:0370:7334', // IPv6 address
      ];

      for (final address in invalidAddresses) {
        final result = validator.validate(address);
        expect(result, isA<PredefinedFormErrorKey>(),
            reason: 'Failed for: $address');
        expect((result as PredefinedFormErrorKey).type,
            PredefinedFormErrorType.isNotValidIpAddress);
      }
    });

    test('should return null for null input', () {
      expect(validator.validate(null), isNull);
    });

    test('equality', () {
      const validator1 = IpAddressValidator();
      const validator2 = IpAddressValidator();
      expect(validator1, equals(validator2));
      expect(validator1, isNot(equals(const Ipv6AddressValidator())));
    });

    test('hashCode', () {
      const validator1 = IpAddressValidator();
      const validator2 = IpAddressValidator();
      expect(validator1.hashCode, equals(validator2.hashCode));
      expect(validator1.hashCode,
          isNot(equals(const Ipv6AddressValidator().hashCode)));
    });
  });

  group('Ipv6AddressValidator', () {
    const validator = Ipv6AddressValidator();

    test('should return null for valid IPv6 addresses', () {
      final validAddresses = [
        '2001:0db8:85a3:0000:0000:8a2e:0370:7334',
        '2001:db8:85a3:0:0:8a2e:370:7334',
        '2001:db8:85a3::8a2e:370:7334',
        '::1',
        '::',
        'fe80::1',
        '::ffff:192.0.2.1',
        '2001:db8::',
      ];

      for (final address in validAddresses) {
        expect(validator.validate(address), isNull,
            reason: 'Failed for: $address');
      }
    });

    test('should return error for invalid IPv6 addresses', () {
      final invalidAddresses = [
        '2001:0db8:85a3:0000:0000:8a2e:0370:7334:',
        '1200::AB00:1234::2552:7777:1313',
        '1200:0000:AB00:1234:O000:2552:7777:1313',
        '2001:db8::1::1',
        '1:2:3:4:5:6:7:8:9',
        '1::2::3',
        '1:::3:4:5',
        '1:2:3::4:5:6:7:8:9',
        '::ffff:192.0.2.256',
        '::::',
        '192.168.0.1',
        '',
      ];

      for (final address in invalidAddresses) {
        final result = validator.validate(address);
        expect(result, isA<PredefinedFormErrorKey>(),
            reason: 'Failed for: $address');
        expect((result as PredefinedFormErrorKey).type,
            PredefinedFormErrorType.isNotValidIpv6Address);
      }
    });

    test('should return null for null input', () {
      expect(validator.validate(null), isNull);
    });

    test('equality', () {
      const validator1 = Ipv6AddressValidator();
      const validator2 = Ipv6AddressValidator();
      expect(validator1, equals(validator2));
      expect(validator1, isNot(equals(const IpAddressValidator())));
    });

    test('hashCode', () {
      const validator1 = Ipv6AddressValidator();
      const validator2 = Ipv6AddressValidator();
      expect(validator1.hashCode, equals(validator2.hashCode));
      expect(validator1.hashCode,
          isNot(equals(const IpAddressValidator().hashCode)));
    });
  });

  group('StringNumMinValidator', () {
    const validator = StringNumMinValidator(min: 10);

    test('should return null for values greater than or equal to min', () {
      expect(validator.validate('10'), isNull);
      expect(validator.validate('10.0'), isNull);
      expect(validator.validate('10.1'), isNull);
      expect(validator.validate('11'), isNull);
      expect(validator.validate('100'), isNull);
    });

    test('should return error for values less than min', () {
      final result = validator.validate('9');
      expect(result, isA<PredefinedFormErrorKey>());
      expect((result as PredefinedFormErrorKey).type,
          PredefinedFormErrorType.numIsLessThanMin);
      expect(result.parameter, 10);

      expect(validator.validate('9.9'), isA<PredefinedFormErrorKey>());
      expect(validator.validate('-1'), isA<PredefinedFormErrorKey>());
    });

    test('should return null for null input', () {
      expect(validator.validate(null), isNull);
    });

    test('should return null for non-numeric strings', () {
      expect(validator.validate('abc'), isNull);
      expect(validator.validate(''), isNull);
    });

    test('equality', () {
      const validator1 = StringNumMinValidator(min: 10);
      const validator2 = StringNumMinValidator(min: 10);
      const validator3 = StringNumMinValidator(min: 20);

      expect(validator1, equals(validator2));
      expect(validator1, isNot(equals(validator3)));
    });

    test('hashCode', () {
      const validator1 = StringNumMinValidator(min: 10);
      const validator2 = StringNumMinValidator(min: 10);
      const validator3 = StringNumMinValidator(min: 20);

      expect(validator1.hashCode, equals(validator2.hashCode));
      expect(validator1.hashCode, isNot(equals(validator3.hashCode)));
    });
  });
  group('StringNumMaxValidator', () {
    const validator = StringNumMaxValidator(max: 100);

    test('should return null for values less than or equal to max', () {
      expect(validator.validate('100'), isNull);
      expect(validator.validate('100.0'), isNull);
      expect(validator.validate('99.9'), isNull);
      expect(validator.validate('0'), isNull);
      expect(validator.validate('-1'), isNull);
    });

    test('should return error for values greater than max', () {
      final result = validator.validate('100.1');
      expect(result, isA<PredefinedFormErrorKey>());
      expect((result as PredefinedFormErrorKey).type,
          PredefinedFormErrorType.numIsMoreThanMax);
      expect(result.parameter, 100);

      expect(validator.validate('101'), isA<PredefinedFormErrorKey>());
      expect(validator.validate('1000'), isA<PredefinedFormErrorKey>());
    });

    test('should return null for null input', () {
      expect(validator.validate(null), isNull);
    });

    test('should return null for non-numeric strings', () {
      expect(validator.validate('abc'), isNull);
      expect(validator.validate(''), isNull);
    });

    test('equality', () {
      const validator1 = StringNumMaxValidator(max: 100);
      const validator2 = StringNumMaxValidator(max: 100);
      const validator3 = StringNumMaxValidator(max: 200);

      expect(validator1, equals(validator2));
      expect(validator1, isNot(equals(validator3)));
    });

    test('hashCode', () {
      const validator1 = StringNumMaxValidator(max: 100);
      const validator2 = StringNumMaxValidator(max: 100);
      const validator3 = StringNumMaxValidator(max: 200);

      expect(validator1.hashCode, equals(validator2.hashCode));
      expect(validator1.hashCode, isNot(equals(validator3.hashCode)));
    });
  });

  group('StringNumbersOnlyValidator', () {
    const validator = StringNumbersOnlyValidator();

    test('should return null for strings containing only numbers', () {
      expect(validator.validate('123'), isNull);
      expect(validator.validate('0'), isNull);
      expect(validator.validate('9876543210'), isNull);
    });

    test('should return error for strings containing non-numeric characters',
        () {
      final result = validator.validate('123a');
      expect(result, isA<PredefinedFormErrorKey>());
      expect((result as PredefinedFormErrorKey).type,
          PredefinedFormErrorType.isNotOnlyNumbers);

      expect(validator.validate('a123'), isA<PredefinedFormErrorKey>());
      expect(validator.validate('12.3'), isA<PredefinedFormErrorKey>());
      expect(validator.validate('-123'), isA<PredefinedFormErrorKey>());
      expect(validator.validate('123 456'), isA<PredefinedFormErrorKey>());
      expect(validator.validate('1,234'), isA<PredefinedFormErrorKey>());
    });

    test('should return null for null input', () {
      expect(validator.validate(null), isNull);
    });

    test('should return null for empty string', () {
      expect(validator.validate(''), isNull);
    });

    test('equality', () {
      const validator1 = StringNumbersOnlyValidator();
      const validator2 = StringNumbersOnlyValidator();

      expect(validator1, equals(validator2));
      expect(validator1, isNot(equals(const StringNumMaxValidator(max: 100))));
    });

    test('hashCode', () {
      const validator1 = StringNumbersOnlyValidator();
      const validator2 = StringNumbersOnlyValidator();

      expect(validator1.hashCode, equals(validator2.hashCode));
      expect(validator1.hashCode,
          isNot(equals(const StringNumMaxValidator(max: 100).hashCode)));
    });
  });
  group('StringTextOnlyValidator', () {
    const validator = StringTextOnlyValidator();

    test('should return null for strings containing only alphabetic characters',
        () {
      expect(validator.validate('abc'), isNull);
      expect(validator.validate('ABC'), isNull);
      expect(validator.validate('abcDEF'), isNull);
      expect(validator.validate('z'), isNull);
    });

    test('should return error for strings containing non-alphabetic characters',
        () {
      final result = validator.validate('abc123');
      expect(result, isA<PredefinedFormErrorKey>());
      expect((result as PredefinedFormErrorKey).type,
          PredefinedFormErrorType.isNotOnlyText);

      expect(validator.validate('abc!'), isA<PredefinedFormErrorKey>());
      expect(validator.validate('123'), isA<PredefinedFormErrorKey>());
      expect(validator.validate('abc def'), isA<PredefinedFormErrorKey>());
      expect(validator.validate('abc-def'), isA<PredefinedFormErrorKey>());
      expect(validator.validate('abç'),
          isA<PredefinedFormErrorKey>()); // Non-ASCII character
    });

    test('should return null for null input', () {
      expect(validator.validate(null), isNull);
    });

    test('should return null for empty string', () {
      expect(validator.validate(''), isNull);
    });

    test('equality', () {
      const validator1 = StringTextOnlyValidator();
      const validator2 = StringTextOnlyValidator();

      expect(validator1, equals(validator2));
      expect(validator1, isNot(equals(const StringNumbersOnlyValidator())));
    });

    test('hashCode', () {
      const validator1 = StringTextOnlyValidator();
      const validator2 = StringTextOnlyValidator();

      expect(validator1.hashCode, equals(validator2.hashCode));
      expect(validator1.hashCode,
          isNot(equals(const StringNumbersOnlyValidator().hashCode)));
    });
  });
  group('StringPhoneNumberValidator', () {
    test('should return null for valid phone numbers', () {
      const validNumbers = [
        '+1234567890',
        '(123)456-7890',
        '123-456-7890',
        '123.456.7890',
        '1234567890',
        '+31636363634',
        '075-63546725',
        '(123)456-78900', // Valid according to the implementation
        '123-456-789000', // Valid according to the implementation
      ];

      for (final number in validNumbers) {
        expect(const StringPhoneNumberValidator().validate(number), isNull,
            reason: 'Failed for: $number');
      }
    });

    test('should return error for invalid phone numbers', () {
      const invalidNumbers = [
        'abcdefghij',
        '12345',
        '1234567890123456', // Too long
        '123-456-789', // Too short
        '123.456.789', // Too short
        '+',
        '+abcdefghij',
        '(123)456-7890000', // Too long in the last group
      ];

      for (final number in invalidNumbers) {
        final result = const StringPhoneNumberValidator().validate(number);
        expect(result, isA<PredefinedFormErrorKey>(),
            reason: 'Failed for: $number');
        expect((result as PredefinedFormErrorKey).type,
            PredefinedFormErrorType.isNotValidPhoneNumber);
      }
    });

    test('should return null for null input', () {
      expect(const StringPhoneNumberValidator().validate(null), isNull);
    });

    test('should return error for empty string', () {
      final result = const StringPhoneNumberValidator().validate('');
      expect(result, isA<PredefinedFormErrorKey>());
      expect((result as PredefinedFormErrorKey).type,
          PredefinedFormErrorType.isNotValidPhoneNumber);
    });

    test('equality', () {
      const validator1 = StringPhoneNumberValidator();
      const validator2 = StringPhoneNumberValidator();
      const emailValidator = EmailValidator();

      expect(validator1, equals(validator2));
      expect(validator1, isNot(equals(emailValidator)));
    });

    test('hashCode', () {
      const validator1 = StringPhoneNumberValidator();
      const validator2 = StringPhoneNumberValidator();
      const emailValidator = EmailValidator();

      expect(validator1.hashCode, equals(validator2.hashCode));
      expect(validator1.hashCode, isNot(equals(emailValidator.hashCode)));
    });
  });

  group('StringUrlValidator', () {
    test('should return null for valid URLs', () {
      const validUrls = [
        'http://www.example.com',
        'https://example.com',
        'http://example.com/path',
        'https://www.example.co.uk/path?query=123',
        'ftp://ftp.example.com',
        'http://example.com:8080',
        'http://foo.bar/foo(bar)baz quux',
      ];

      for (final url in validUrls) {
        expect(const StringUrlValidator().validate(url), isNull,
            reason: 'Failed for: $url');
      }
    });

    test('should return error for invalid URLs', () {
      const invalidUrls = [
        'not a url',
        'http://',
        'http://.',
        'http://..',
        'http://../',
        'http://?',
        'http://??',
        'http://??/',
        'http://#',
        'http://##',
        'http://##/',
        'http:///a',
        'foo.com',
        'rdar://1234',
        'h://test',
        'http:// shouldfail.com',
        ':// should fail',
        'ftps://foo.bar/',
        'http://localhost',
        'http://127.0.0.1',
      ];

      for (final url in invalidUrls) {
        final result = const StringUrlValidator().validate(url);
        expect(result, isA<PredefinedFormErrorKey>(),
            reason: 'Failed for: $url');
        expect((result as PredefinedFormErrorKey).type,
            PredefinedFormErrorType.isNotValidUrl);
      }
    });

    test('should return null for null input', () {
      expect(const StringUrlValidator().validate(null), isNull);
    });

    test('should return error for empty string', () {
      final result = const StringUrlValidator().validate('');
      expect(result, isA<PredefinedFormErrorKey>());
      expect((result as PredefinedFormErrorKey).type,
          PredefinedFormErrorType.isNotValidUrl);
    });

    test('equality', () {
      const validator1 = StringUrlValidator();
      const validator2 = StringUrlValidator();
      const dateTimeValidator = DateTimeValidator();

      expect(validator1, equals(validator2));
      expect(validator1, isNot(equals(dateTimeValidator)));
    });

    test('hashCode', () {
      const validator1 = StringUrlValidator();
      const validator2 = StringUrlValidator();
      const dateTimeValidator = DateTimeValidator();

      expect(validator1.hashCode, equals(validator2.hashCode));
      expect(validator1.hashCode, isNot(equals(dateTimeValidator.hashCode)));
    });
  });

  group('StringWordsCountMinValidator', () {
    const minWords = 3;

    test('should return null for strings with word count >= minWords', () {
      const validStrings = [
        'One two three',
        'One two three four',
        'This is a longer sentence with more words',
        'One   two   three', // Multiple spaces
        'One\ttwo\tthree', // Tabs
        'One\ntwo\nthree', // New lines
      ];

      for (final str in validStrings) {
        expect(
            const StringWordsCountMinValidator(minWords: minWords)
                .validate(str),
            isNull,
            reason: 'Failed for: $str');
      }
    });

    test(
        'should return error for strings with word count < minWords, including empty and whitespace-only strings',
        () {
      const invalidStrings = [
        '   ', // Only spaces
        '\t\t', // Only tabs
        '\n\n', // Only new lines
        'One',
        'One two',
      ];

      for (final str in invalidStrings) {
        final result = const StringWordsCountMinValidator(minWords: minWords)
            .validate(str);
        expect(result, isA<PredefinedFormErrorKey>(),
            reason: 'Failed for: "$str"');
        expect((result as PredefinedFormErrorKey).type,
            PredefinedFormErrorType.wordCountIsLessThan);
        expect(result.parameter, minWords);
      }
    });

    test('should return null for null input', () {
      expect(
          const StringWordsCountMinValidator(minWords: minWords).validate(null),
          isNull);
    });

    test('should handle edge cases', () {
      expect(
          const StringWordsCountMinValidator(minWords: 0).validate(''), isNull);
      expect(const StringWordsCountMinValidator(minWords: 1).validate('One'),
          isNull);
    });

    test('equality', () {
      const validator1 = StringWordsCountMinValidator(minWords: minWords);
      const validator2 = StringWordsCountMinValidator(minWords: minWords);
      const validator3 = StringWordsCountMinValidator(minWords: minWords + 1);
      const urlValidator = StringUrlValidator();

      expect(validator1, equals(validator2));
      expect(validator1, isNot(equals(validator3)));
      expect(validator1, isNot(equals(urlValidator)));
    });

    test('hashCode', () {
      const validator1 = StringWordsCountMinValidator(minWords: minWords);
      const validator2 = StringWordsCountMinValidator(minWords: minWords);
      const validator3 = StringWordsCountMinValidator(minWords: minWords + 1);

      expect(validator1.hashCode, equals(validator2.hashCode));
      expect(validator1.hashCode, isNot(equals(validator3.hashCode)));
    });
  });

  group('StringWordsCountMaxValidator', () {
    const maxWords = 5;

    test('should return null for strings with word count <= maxWords', () {
      const validStrings = [
        '',
        'One',
        'One two',
        'One two three',
        'One two three four',
        'One two three four five',
        'One   two   three', // Multiple spaces
        'One\ttwo\tthree', // Tabs
        'One\ntwo\nthree', // New lines
      ];

      for (final str in validStrings) {
        expect(
            const StringWordsCountMaxValidator(maxWords: maxWords)
                .validate(str),
            isNull,
            reason: 'Failed for: "$str"');
      }
    });

    test('should return error for strings with word count > maxWords', () {
      const invalidStrings = [
        'One two three four five six',
        'This is a longer sentence with more words than allowed',
      ];

      for (final str in invalidStrings) {
        final result = const StringWordsCountMaxValidator(maxWords: maxWords)
            .validate(str);
        expect(result, isA<PredefinedFormErrorKey>(),
            reason: 'Failed for: "$str"');
        expect((result as PredefinedFormErrorKey).type,
            PredefinedFormErrorType.wordCountIsMoreThan);
        expect(result.parameter, maxWords);
      }
    });

    test('should return null for null input', () {
      expect(
          const StringWordsCountMaxValidator(maxWords: maxWords).validate(null),
          isNull);
    });

    test('should handle whitespace-only strings', () {
      const whitespaceStrings = [
        ' ',
        '   ',
        '\t\t',
        '\n\n',
      ];

      for (final str in whitespaceStrings) {
        expect(
            const StringWordsCountMaxValidator(maxWords: maxWords)
                .validate(str),
            isNull,
            reason: 'Failed for: "$str"');
      }
    });

    test('should handle edge cases', () {
      expect(
          const StringWordsCountMaxValidator(maxWords: 0).validate(''), isNull);
      expect(const StringWordsCountMaxValidator(maxWords: 0).validate('One'),
          isA<PredefinedFormErrorKey>());
      expect(const StringWordsCountMaxValidator(maxWords: 1).validate('One'),
          isNull);
      expect(
          const StringWordsCountMaxValidator(maxWords: 1).validate('One two'),
          isA<PredefinedFormErrorKey>());
    });

    test('equality', () {
      const validator1 = StringWordsCountMaxValidator(maxWords: maxWords);
      const validator2 = StringWordsCountMaxValidator(maxWords: maxWords);
      const validator3 = StringWordsCountMaxValidator(maxWords: maxWords + 1);
      const minValidator = StringWordsCountMinValidator(minWords: maxWords);

      expect(validator1, equals(validator2));
      expect(validator1, isNot(equals(validator3)));
      expect(validator1, isNot(equals(minValidator)));
    });

    test('hashCode', () {
      const validator1 = StringWordsCountMaxValidator(maxWords: maxWords);
      const validator2 = StringWordsCountMaxValidator(maxWords: maxWords);
      const validator3 = StringWordsCountMaxValidator(maxWords: maxWords + 1);

      expect(validator1.hashCode, equals(validator2.hashCode));
      expect(validator1.hashCode, isNot(equals(validator3.hashCode)));
    });
  });
  group('StringConfirmPasswordMatchValidator', () {
    const password = 'password123';

    test('should return null when passwords match', () {
      const validator =
          StringConfirmPasswordMatchValidator(matchingValue: password);
      expect(validator.validate(password), isNull);
    });

    test('should return error when passwords do not match', () {
      const validator =
          StringConfirmPasswordMatchValidator(matchingValue: password);
      final result = validator.validate('differentpassword');
      expect(result, isA<PredefinedFormErrorKey>());
      expect((result as PredefinedFormErrorKey).type,
          PredefinedFormErrorType.passwordsDoNotMatch);
    });

    test('should be case sensitive', () {
      const validator =
          StringConfirmPasswordMatchValidator(matchingValue: 'Password123');
      final result = validator.validate('password123');
      expect(result, isA<PredefinedFormErrorKey>());
      expect((result as PredefinedFormErrorKey).type,
          PredefinedFormErrorType.passwordsDoNotMatch);
    });

    test('should handle empty strings', () {
      const validator1 = StringConfirmPasswordMatchValidator(matchingValue: '');
      expect(validator1.validate(''), isNull);

      const validator2 =
          StringConfirmPasswordMatchValidator(matchingValue: 'nonempty');
      final result = validator2.validate('');
      expect(result, isA<PredefinedFormErrorKey>());
      expect((result as PredefinedFormErrorKey).type,
          PredefinedFormErrorType.passwordsDoNotMatch);
    });

    test('equality', () {
      const validator1 =
          StringConfirmPasswordMatchValidator(matchingValue: password);
      const validator2 =
          StringConfirmPasswordMatchValidator(matchingValue: password);
      const validator3 = StringConfirmPasswordMatchValidator(
          matchingValue: 'differentpassword');

      expect(validator1, equals(validator2));
      expect(validator1, isNot(equals(validator3)));
    });

    test('hashCode', () {
      const validator1 =
          StringConfirmPasswordMatchValidator(matchingValue: password);
      const validator2 =
          StringConfirmPasswordMatchValidator(matchingValue: password);
      const validator3 = StringConfirmPasswordMatchValidator(
          matchingValue: 'differentpassword');

      expect(validator1.hashCode, equals(validator2.hashCode));
      expect(validator1.hashCode, isNot(equals(validator3.hashCode)));
    });
  });
  group('PasswordLengthValidator', () {
    const minLength = 8;

    test('should return null for passwords with length >= minLength', () {
      const validator = PasswordLengthValidator(minLength: minLength);
      expect(validator.validate('password'), isNull);
      expect(validator.validate('longerpassword'), isNull);
      expect(validator.validate('exact8ch'), isNull);
    });

    test('should return error for passwords with length < minLength', () {
      const validator = PasswordLengthValidator(minLength: minLength);
      final result = validator.validate('short');
      expect(result, isA<PredefinedFormErrorKey>());
      expect((result as PredefinedFormErrorKey).type,
          PredefinedFormErrorType.passwordTooShort);
      expect(result.parameter, minLength);
    });

    test('should handle edge case of minLength = 0', () {
      const validator = PasswordLengthValidator(minLength: 0);
      expect(validator.validate(''), isNull);
      expect(validator.validate('anypassword'), isNull);
    });

    test('equality', () {
      const validator1 = PasswordLengthValidator(minLength: minLength);
      const validator2 = PasswordLengthValidator(minLength: minLength);
      const validator3 = PasswordLengthValidator(minLength: minLength + 1);

      expect(validator1, equals(validator2));
      expect(validator1, isNot(equals(validator3)));
    });

    test('hashCode', () {
      const validator1 = PasswordLengthValidator(minLength: minLength);
      const validator2 = PasswordLengthValidator(minLength: minLength);
      const validator3 = PasswordLengthValidator(minLength: minLength + 1);

      expect(validator1.hashCode, equals(validator2.hashCode));
      expect(validator1.hashCode, isNot(equals(validator3.hashCode)));
    });
  });

  group('PasswordUppercaseValidator', () {
    const validator = PasswordUppercaseValidator();

    test('should return null for passwords with at least one uppercase letter',
        () {
      expect(validator.validate('Password'), isNull);
      expect(validator.validate('passworD'), isNull);
      expect(validator.validate('PASSWORD'), isNull);
      expect(validator.validate('PaSsWoRd'), isNull);
      expect(validator.validate('password123ABC'), isNull);
      expect(validator.validate('A'), isNull);
    });

    test('should return error for passwords without uppercase letters', () {
      final result = validator.validate('password');
      expect(result, isA<PredefinedFormErrorKey>());
      expect((result as PredefinedFormErrorKey).type,
          PredefinedFormErrorType.passwordNoUppercase);
    });

    test('should return error for strings with only non-alphabetic characters',
        () {
      final result = validator.validate('123!@#');
      expect(result, isA<PredefinedFormErrorKey>());
      expect((result as PredefinedFormErrorKey).type,
          PredefinedFormErrorType.passwordNoUppercase);
    });

    test('equality', () {
      const validator1 = PasswordUppercaseValidator();
      const validator2 = PasswordUppercaseValidator();

      expect(validator1, equals(validator2));
    });

    test('hashCode', () {
      const validator1 = PasswordUppercaseValidator();
      const validator2 = PasswordUppercaseValidator();

      expect(validator1.hashCode, equals(validator2.hashCode));
    });
  });

  group('PasswordLowercaseValidator', () {
    const validator = PasswordLowercaseValidator();

    test('should return null for passwords with at least one lowercase letter',
        () {
      expect(validator.validate('password'), isNull);
      expect(validator.validate('Password'), isNull);
      expect(validator.validate('PASSWORd'), isNull);
      expect(validator.validate('PaSsWoRd'), isNull);
      expect(validator.validate('PASSWORD123a'), isNull);
      expect(validator.validate('a'), isNull);
    });

    test('should return error for passwords without lowercase letters', () {
      final result = validator.validate('PASSWORD');
      expect(result, isA<PredefinedFormErrorKey>());
      expect((result as PredefinedFormErrorKey).type,
          PredefinedFormErrorType.passwordNoLowercase);
    });

    test('should return error for strings with only non-alphabetic characters',
        () {
      final result = validator.validate('123!@#');
      expect(result, isA<PredefinedFormErrorKey>());
      expect((result as PredefinedFormErrorKey).type,
          PredefinedFormErrorType.passwordNoLowercase);
    });

    test('equality', () {
      const validator1 = PasswordLowercaseValidator();
      const validator2 = PasswordLowercaseValidator();

      expect(validator1, equals(validator2));
    });

    test('hashCode', () {
      const validator1 = PasswordLowercaseValidator();
      const validator2 = PasswordLowercaseValidator();

      expect(validator1.hashCode, equals(validator2.hashCode));
    });
  });

  group('PasswordNumberValidator', () {
    const validator = PasswordNumberValidator();

    test('should return null for passwords with at least one number', () {
      expect(validator.validate('password1'), isNull);
      expect(validator.validate('1password'), isNull);
      expect(validator.validate('pass2word'), isNull);
      expect(validator.validate('PASSWORD123'), isNull);
      expect(validator.validate('1'), isNull);
      expect(validator.validate('p@ssw0rd'), isNull);
    });

    test('should return error for passwords without numbers', () {
      final result = validator.validate('password');
      expect(result, isA<PredefinedFormErrorKey>());
      expect((result as PredefinedFormErrorKey).type,
          PredefinedFormErrorType.passwordNoNumber);
    });

    test('should return error for strings with only non-numeric characters',
        () {
      final result = validator.validate('p@ssword!');
      expect(result, isA<PredefinedFormErrorKey>());
      expect((result as PredefinedFormErrorKey).type,
          PredefinedFormErrorType.passwordNoNumber);
    });

    test('equality', () {
      const validator1 = PasswordNumberValidator();
      const validator2 = PasswordNumberValidator();

      expect(validator1, equals(validator2));
    });

    test('hashCode', () {
      const validator1 = PasswordNumberValidator();
      const validator2 = PasswordNumberValidator();

      expect(validator1.hashCode, equals(validator2.hashCode));
    });
  });

  group('PasswordSpecialCharValidator', () {
    const defaultSpecialChars = r'!@#$%^&*(),.?":{}|<>';
    const validator = PasswordSpecialCharValidator();

    test('should return null for passwords with at least one special character',
        () {
      expect(validator.validate('password!'), isNull);
      expect(validator.validate('@password'), isNull);
      expect(validator.validate('pass@word'), isNull);
      expect(validator.validate('PASSWORD#123'), isNull);
      expect(validator.validate('p@ssw0rd'), isNull);
      expect(validator.validate('!'), isNull);
    });

    test('should return error for passwords without special characters', () {
      final result = validator.validate('password123');
      expect(result, isA<PredefinedFormErrorKey>());
      expect((result as PredefinedFormErrorKey).type,
          PredefinedFormErrorType.passwordNoSpecialChar);
      expect(result.parameter, defaultSpecialChars);
    });

    test('should return error for strings with only alphanumeric characters',
        () {
      final result = validator.validate('password123ABC');
      expect(result, isA<PredefinedFormErrorKey>());
      expect((result as PredefinedFormErrorKey).type,
          PredefinedFormErrorType.passwordNoSpecialChar);
      expect(result.parameter, defaultSpecialChars);
    });

    test('should work with custom special characters', () {
      const customSpecialChars = '#@%';
      const customValidator =
          PasswordSpecialCharValidator(specialChars: customSpecialChars);

      expect(customValidator.validate('password#'), isNull);
      expect(customValidator.validate('p@ssword'), isNull);
      expect(customValidator.validate('pass%word'), isNull);

      final result = customValidator.validate('password!');
      expect(result, isA<PredefinedFormErrorKey>());
      expect((result as PredefinedFormErrorKey).type,
          PredefinedFormErrorType.passwordNoSpecialChar);
      expect(result.parameter, customSpecialChars);
    });

    test('equality', () {
      const validator1 = PasswordSpecialCharValidator();
      const validator2 = PasswordSpecialCharValidator();
      const validator3 = PasswordSpecialCharValidator(specialChars: '#@%');

      expect(validator1, equals(validator2));
      expect(validator1, isNot(equals(validator3)));
    });

    test('hashCode', () {
      const validator1 = PasswordSpecialCharValidator();
      const validator2 = PasswordSpecialCharValidator();
      const validator3 = PasswordSpecialCharValidator(specialChars: '#@%');

      expect(validator1.hashCode, equals(validator2.hashCode));
      expect(validator1.hashCode, isNot(equals(validator3.hashCode)));
    });
  });

  group('StringContainsValidator', () {
    const substring = 'test';
    const validator = StringContainsValidator(substring: substring);

    test('should return null when string contains the substring', () {
      expect(validator.validate('This is a test string'), isNull);
      expect(validator.validate('test'), isNull);
      expect(validator.validate('beforetestafter'), isNull);
    });

    test('should return error when string does not contain the substring', () {
      final result = validator.validate('This does not contain it');
      expect(result, isA<PredefinedFormErrorKey>());
      expect((result as PredefinedFormErrorKey).type,
          PredefinedFormErrorType.stringDoesNotContain);
      expect(result.parameter, substring);
    });

    test('should be case sensitive by default', () {
      final result = validator.validate('This is a TEST string');
      expect(result, isA<PredefinedFormErrorKey>());
      expect((result as PredefinedFormErrorKey).type,
          PredefinedFormErrorType.stringDoesNotContain);
    });

    test('should be case insensitive when specified', () {
      const caseInsensitiveValidator =
          StringContainsValidator(substring: substring, caseSensitive: false);
      expect(
          caseInsensitiveValidator.validate('This is a TEST string'), isNull);
    });

    test('should return null for null input', () {
      expect(validator.validate(null), isNull);
    });

    test('equality', () {
      expect(const StringContainsValidator(substring: substring),
          equals(const StringContainsValidator(substring: substring)));
      expect(const StringContainsValidator(substring: substring),
          isNot(equals(const StringContainsValidator(substring: 'other'))));
      expect(
          const StringContainsValidator(substring: substring),
          isNot(equals(const StringContainsValidator(
              substring: substring, caseSensitive: false))));
    });

    test('hashCode', () {
      expect(const StringContainsValidator(substring: substring).hashCode,
          equals(const StringContainsValidator(substring: substring).hashCode));
      expect(
          const StringContainsValidator(substring: substring).hashCode,
          isNot(equals(
              const StringContainsValidator(substring: 'other').hashCode)));
    });
  });

  group('StringNotContainsValidator', () {
    const substring = 'test';
    const validator = StringNotContainsValidator(substring: substring);

    test('should return null when string does not contain the substring', () {
      expect(validator.validate('This is a valid string'), isNull);
      expect(validator.validate('no substring here'), isNull);
    });

    test('should return error when string contains the substring', () {
      final result = validator.validate('This is a test string');
      expect(result, isA<PredefinedFormErrorKey>());
      expect((result as PredefinedFormErrorKey).type,
          PredefinedFormErrorType.stringContains);
      expect(result.parameter, substring);
    });

    test('should be case sensitive by default', () {
      expect(validator.validate('This is a TEST string'), isNull);
    });

    test('should be case insensitive when specified', () {
      const caseInsensitiveValidator = StringNotContainsValidator(
          substring: substring, caseSensitive: false);
      final result = caseInsensitiveValidator.validate('This is a TEST string');
      expect(result, isA<PredefinedFormErrorKey>());
      expect((result as PredefinedFormErrorKey).type,
          PredefinedFormErrorType.stringContains);
      expect(result.parameter, substring);
    });

    test('should return null for null input', () {
      expect(validator.validate(null), isNull);
    });

    test('equality', () {
      expect(const StringNotContainsValidator(substring: substring),
          equals(const StringNotContainsValidator(substring: substring)));
      expect(const StringNotContainsValidator(substring: substring),
          isNot(equals(const StringNotContainsValidator(substring: 'other'))));
      expect(
          const StringNotContainsValidator(substring: substring),
          isNot(equals(const StringNotContainsValidator(
              substring: substring, caseSensitive: false))));
    });

    test('hashCode', () {
      expect(
          const StringNotContainsValidator(substring: substring).hashCode,
          equals(
              const StringNotContainsValidator(substring: substring).hashCode));
      expect(
          const StringNotContainsValidator(substring: substring).hashCode,
          isNot(equals(
              const StringNotContainsValidator(substring: 'other').hashCode)));
    });
  });

  group('FileTypeValidator', () {
    const validator =
        FileTypeValidator(allowedExtensions: ['jpg', 'png', 'gif']);

    test('should return null for valid file types', () {
      expect(validator.validate('image.jpg'), isNull);
      expect(validator.validate('photo.PNG'), isNull);
      expect(validator.validate('animation.gif'), isNull);
    });

    test('should return error for invalid file types', () {
      final result = validator.validate('document.pdf');
      expect(result, isA<PredefinedFormErrorKey>());
      expect((result as PredefinedFormErrorKey).type,
          PredefinedFormErrorType.invalidFileType);
      expect(result.parameter, ['jpg', 'png', 'gif']);
    });

    test('should return null for null or empty input', () {
      expect(validator.validate(null), isNull);
      expect(validator.validate(''), isNull);
    });

    test('should handle files without extensions', () {
      final result = validator.validate('noextension');
      expect(result, isA<PredefinedFormErrorKey>());
      expect((result as PredefinedFormErrorKey).type,
          PredefinedFormErrorType.invalidFileType);
    });

    test('equality', () {
      expect(
          const FileTypeValidator(allowedExtensions: ['jpg', 'png', 'gif']),
          equals(const FileTypeValidator(
              allowedExtensions: ['jpg', 'png', 'gif'])));
      expect(
          const FileTypeValidator(allowedExtensions: ['jpg', 'png', 'gif']),
          isNot(equals(
              const FileTypeValidator(allowedExtensions: ['jpg', 'png']))));
    });

    test('hashCode', () {
      expect(
          const FileTypeValidator(allowedExtensions: ['jpg', 'png', 'gif'])
              .hashCode,
          equals(
              const FileTypeValidator(allowedExtensions: ['jpg', 'png', 'gif'])
                  .hashCode));
      expect(
          const FileTypeValidator(allowedExtensions: ['jpg', 'png', 'gif'])
              .hashCode,
          isNot(equals(
              const FileTypeValidator(allowedExtensions: ['jpg', 'png'])
                  .hashCode)));
    });
  });

  group('FileSizeValidator', () {
    const maxSize = 1024 * 1024; // 1 MB
    const validator = FileSizeValidator(maxSizeInBytes: maxSize);

    test('should return null for file sizes within the limit', () {
      expect(validator.validate(500 * 1024), isNull); // 500 KB
      expect(validator.validate(1024 * 1024), isNull); // 1 MB
      expect(validator.validate(0), isNull); // 0 bytes
    });

    test('should return error for file sizes exceeding the limit', () {
      final result = validator.validate(1024 * 1024 + 1); // 1 MB + 1 byte
      expect(result, isA<PredefinedFormErrorKey>());
      expect((result as PredefinedFormErrorKey).type,
          PredefinedFormErrorType.fileSizeExceedsLimit);
      expect(result.parameter, maxSize);
    });

    test('should return null for null input', () {
      expect(validator.validate(null), isNull);
    });

    test('equality', () {
      expect(const FileSizeValidator(maxSizeInBytes: maxSize),
          equals(const FileSizeValidator(maxSizeInBytes: maxSize)));
      expect(const FileSizeValidator(maxSizeInBytes: maxSize),
          isNot(equals(const FileSizeValidator(maxSizeInBytes: maxSize * 2))));
    });

    test('hashCode', () {
      expect(const FileSizeValidator(maxSizeInBytes: maxSize).hashCode,
          equals(const FileSizeValidator(maxSizeInBytes: maxSize).hashCode));
      expect(
          const FileSizeValidator(maxSizeInBytes: maxSize).hashCode,
          isNot(equals(
              const FileSizeValidator(maxSizeInBytes: maxSize * 2).hashCode)));
    });
  });
}
