import 'package:flutter_test/flutter_test.dart';
import 'package:form_model/form_model.dart';

void main() {
  group('Comprehensive Form Model and Validators Integration Tests', () {
    late FormModel<String> usernameModel;
    late FormModel<String> emailModel;
    late FormModel<String> passwordModel;
    late FormModel<String> confirmPasswordModel;
    late FormModel<String> birthDateModel;
    late FormModel<String> phoneModel;

    setUp(() {
      usernameModel = FormModel<String>(
        validators: [
          const RequiredValidator<String>(),
          const StringMinLengthValidator(minLength: 3),
          const StringMaxLengthValidator(maxLength: 20),
          StringCustomPatternValidator(pattern: RegExp(r'^[a-zA-Z0-9_]+$')),
        ],
      );

      emailModel = const FormModel<String>(
        validators: [
          RequiredValidator<String>(),
          EmailValidator(),
        ],
      );

      passwordModel = const FormModel<String>(
        validators: [
          RequiredValidator<String>(),
          StringMinLengthValidator(minLength: 8),
          PasswordUppercaseValidator(),
          PasswordLowercaseValidator(),
          PasswordNumberValidator(),
          PasswordSpecialCharValidator(),
        ],
      );

      confirmPasswordModel = const FormModel<String>(
        validators: [
          RequiredValidator<String>(),
          StringConfirmPasswordMatchValidator(matchingValue: null),
        ],
      );

      birthDateModel = const FormModel<String>(
        validators: [
          RequiredValidator<String>(),
          StringDateTimeAgeMinValidator(minAge: 18),
        ],
      );

      phoneModel = const FormModel<String>(
        validators: [
          StringPhoneNumberValidator(),
        ],
      );
    });

    test('Initial state of all form models', () {
      for (var model in [usernameModel, emailModel, passwordModel, confirmPasswordModel, birthDateModel, phoneModel]) {
        expect(model.isValid, isTrue);
        expect(model.isDirty, isFalse);
        expect(model.error, isNull);
        expect(model.errorsList, isEmpty);
      }
    });

    test('Username validation', () {
      var model = usernameModel.setValue('a').validate();
      expect(model.isValid, isFalse);
      expect((model.error as PredefinedFormErrorKey).type, PredefinedFormErrorType.lengthIsLessThanMin);

      model = usernameModel.setValue('username@123').validate();
      expect(model.isValid, isFalse);
      expect(model.error, isA<PredefinedFormErrorKey>());

      model = usernameModel.setValue('valid_username123').validate();
      expect(model.isValid, isTrue);
    });

    test('Email validation', () {
      var model = emailModel.setValue('invalid_email').validate();
      expect(model.isValid, isFalse);
      expect((model.error as PredefinedFormErrorKey).type, PredefinedFormErrorType.isNotValidEmail);

      model = emailModel.setValue('valid@email.com').validate();
      expect(model.isValid, isTrue);
    });

    test('Password validation', () {
      var model = passwordModel.setValue('weak').validate();
      expect(model.isValid, isFalse);
      expect(model.errorsList.length, 4);

      model = passwordModel.setValue('StrongPass1!').validate();
      expect(model.isValid, isTrue);
    });

    test('Confirm password validation', () {
      passwordModel = passwordModel.setValue('StrongPass1!');
      confirmPasswordModel = confirmPasswordModel.replaceValidator(
        predicate: (validator) => validator is StringConfirmPasswordMatchValidator,
        newValidator: StringConfirmPasswordMatchValidator(matchingValue: passwordModel.value),
      );

      var model = confirmPasswordModel.setValue('DifferentPass1!').validate();
      expect(model.isValid, isFalse);
      expect((model.error as PredefinedFormErrorKey).type, PredefinedFormErrorType.passwordsDoNotMatch);

      model = confirmPasswordModel.setValue('StrongPass1!').validate();
      expect(model.isValid, isTrue);
    });

    test('Birth date validation', () {
      final now = DateTime.now();
      final eighteenYearsAgo = DateTime(now.year - 18, now.month, now.day);
      final seventeenYearsAgo = DateTime(now.year - 17, now.month, now.day);

      var model = birthDateModel.setValue(seventeenYearsAgo.toIso8601String()).validate();
      expect(model.isValid, isFalse);
      expect((model.error as PredefinedFormErrorKey).type, PredefinedFormErrorType.dateIsLessThanMinAge);

      model = birthDateModel.setValue(eighteenYearsAgo.toIso8601String()).validate();
      expect(model.isValid, isTrue);

      model = birthDateModel.setValue(DateTime(1990, 1, 1).toIso8601String()).validate();
      expect(model.isValid, isTrue);
    });

    test('Phone validation', () {
      var model = phoneModel.setValue('').validate();
      expect(model.isValid, isFalse);
      expect((model.error as PredefinedFormErrorKey).type, PredefinedFormErrorType.isNotValidPhoneNumber);

      model = phoneModel.setValue('123').validate();
      expect(model.isValid, isFalse);
      expect((model.error as PredefinedFormErrorKey).type, PredefinedFormErrorType.isNotValidPhoneNumber);

      model = phoneModel.setValue('123-456-7890').validate();
      expect(model.isValid, isTrue);
    });

    test('Whole form validation', () {
      // Set valid values for all fields
      usernameModel = usernameModel.setValue('valid_user').validate();
      emailModel = emailModel.setValue('user@example.com').validate();
      passwordModel = passwordModel.setValue('StrongPass1!').validate();
      confirmPasswordModel = confirmPasswordModel
          .replaceValidator(
            predicate: (validator) => validator is StringConfirmPasswordMatchValidator,
            newValidator: const StringConfirmPasswordMatchValidator(matchingValue: 'StrongPass1!'),
          )
          .setValue('StrongPass1!')
          .validate();
      birthDateModel = birthDateModel.setValue('1990-01-01').validate();
      phoneModel = phoneModel.setValue('123-456-7890').validate();

      // Check if all models are valid
      expect(
        [usernameModel, emailModel, passwordModel, confirmPasswordModel, birthDateModel, phoneModel]
            .every((model) => model.isValid),
        isTrue,
      );

      // Invalidate one field and check overall validity
      emailModel = emailModel.setValue('invalid_email').validate();
      expect(
        [usernameModel, emailModel, passwordModel, confirmPasswordModel, birthDateModel, phoneModel]
            .every((model) => model.isValid),
        isFalse,
      );
    });

    test('Form model behavior with multiple validators', () {
      var model = usernameModel.setValue('a@').validate();
      expect(model.isValid, isFalse);
      expect(model.errorsList.length, 2); // Too short and doesn't meet custom pattern
      expect((model.errorsList[0] as PredefinedFormErrorKey).type, PredefinedFormErrorType.lengthIsLessThanMin);
      expect(model.error, isA<PredefinedFormErrorKey>()); // First error is returned

      model = usernameModel.setValue('').validate();
      expect(model.isValid, isFalse);
      expect(model.errorsList.length, 3); // Required, too short, and doesn't meet custom pattern
      expect((model.error as PredefinedFormErrorKey).type,
          PredefinedFormErrorType.required); // Required error takes precedence
    });

    test('Updating and revalidating form models', () {
      var model = emailModel.setValue('invalid').validate();
      expect(model.isValid, isFalse);

      model = model.setValue('valid@email.com').validate();
      expect(model.isValid, isTrue);

      model = model.reset();
      expect(model.isDirty, isFalse);
      expect(model.isValid, isTrue); // Resets to initial valid state
    });
  });
}
