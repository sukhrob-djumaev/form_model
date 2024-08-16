# form_model

A powerful and flexible form validation package for Flutter applications.

<!-- [![pub package](https://img.shields.io/pub/v/form_model.svg)](https://pub.dev/packages/form_model) -->
[![flutter platform](https://img.shields.io/badge/Platform-Flutter-yellow.svg)](https://flutter.io)
[![pub package](https://img.shields.io/pub/v/form_model.svg)](https://pub.dartlang.org/packages/form_model)
[![BSD-2-Clause](https://img.shields.io/badge/BSD-3-Clause.svg?style=flat-square)](https://opensource.org/licenses/)

## Features

- 🚀 Easy-to-use form validation
- 🎯 Single-responsibility validators for clear, maintainable code
- 🌐 Built-in internationalization support with fallback locales
- 🧩 Extensible with custom validators and translations
- 🔄 Immutable state management
- 🔗 Integrates seamlessly with Flutter widgets
- 🎛️ Advanced form controls (date pickers, multi-select, etc.)
- 🧬 Works great with state management solutions like BLoC
- 🧪 Comprehensive test coverage

## Screenshots

Here are some screenshots of form_model in action:

<div style="display: flex; justify-content: space-between; flex-wrap: wrap;">
  <img src="https://raw.githubusercontent.com/sukhrob-djumaev/form_model/main/screenshots/1.png" alt="Screenshot 1" width="13%" />
  <img src="https://raw.githubusercontent.com/sukhrob-djumaev/form_model/main/screenshots/2.png" alt="Screenshot 2" width="13%" />
  <img src="https://raw.githubusercontent.com/sukhrob-djumaev/form_model/main/screenshots/3.png" alt="Screenshot 3" width="13%" />
  <img src="https://raw.githubusercontent.com/sukhrob-djumaev/form_model/main/screenshots/4.png" alt="Screenshot 4" width="13%" />
  <img src="https://raw.githubusercontent.com/sukhrob-djumaev/form_model/main/screenshots/5.png" alt="Screenshot 5" width="13%" />
  <img src="https://raw.githubusercontent.com/sukhrob-djumaev/form_model/main/screenshots/6.png" alt="Screenshot 6" width="13%" />
  <img src="https://raw.githubusercontent.com/sukhrob-djumaev/form_model/main/screenshots/7.png" alt="Screenshot 7" width="13%" />
</div>

## Installation

Add `form_model` to your `pubspec.yaml` file:

```yaml
dependencies:
  form_model: ^1.0.2+1
```

Then run:

```
flutter pub get
```

## Basic Usage

Here's a simple example of how to use `form_model`:

```dart
import 'package:form_model/form_model.dart';

// Create a FormModel for an email field
final emailModel = FormModel<String>(
  validators: [RequiredValidator(), EmailValidator()],
);

// Set a value and validate
final validatedModel = emailModel.setValue('user@example.com').validate();

if (validatedModel.isValid) {
  print('Email is valid: ${validatedModel.value}');
} else {
  print('Validation error: ${validatedModel.error?.translatedMessage}');
}
```

Note: Each validator is responsible for checking one specific aspect of the input and returns only one type of error. This principle should be followed when creating custom validators for your application.

## Advanced Usage

For more complex forms, you can combine multiple `FormModel` instances. Here's an example with a password confirmation field:

```dart
class RegistrationForm {
  final FormModel<String> username;
  final FormModel<String> email;
  final FormModel<String> password;
  late final FormModel<String> confirmPassword;

  RegistrationForm({
    required this.username,
    required this.email,
    required this.password,
  }) {
    confirmPassword = FormModel<String>(
      validators: [
        RequiredValidator(),
        StringConfirmPasswordMatchValidator(matchingValue: password.value),
      ],
    );
  }

  bool get isValid => 
    username.isValid && 
    email.isValid && 
    password.isValid && 
    confirmPassword.isValid;

  void validate() {
    username.validate();
    email.validate();
    password.validate();
    confirmPassword = confirmPassword
      .replaceValidator(
        predicate: (validator) => validator is StringConfirmPasswordMatchValidator,
        newValidator: StringConfirmPasswordMatchValidator(matchingValue: password.value),
      )
      .validate();
  }

  void updatePassword(String newPassword) {
    password.setValue(newPassword);
    // Update confirm password validator
    confirmPassword = confirmPassword
      .replaceValidator(
        predicate: (validator) => validator is StringConfirmPasswordMatchValidator,
        newValidator: StringConfirmPasswordMatchValidator(matchingValue: newPassword),
      );
  }
}
```

This example demonstrates how to properly set up and update a password match validator.

## Validators

`form_model` includes a wide range of built-in validators, each responsible for a single aspect of validation:

- `RequiredValidator`
- `EmailValidator`
- `StringMinLengthValidator`
- `StringMaxLengthValidator`
- `PasswordLengthValidator`
- `PasswordUppercaseValidator`
- `PasswordLowercaseValidator`
- `PasswordNumberValidator`
- `PasswordSpecialCharValidator`
- `DateTimeValidator`
- `StringDateTimeAgeMinValidator`
- `StringDateTimeAgeMaxValidator`
- `StringPhoneNumberValidator`
- `StringNumbersOnlyValidator`
- `StringTextOnlyValidator`
- `StringUrlValidator`
- `StringWordsCountMinValidator`
- `StringWordsCountMaxValidator`
- `StringCreditCardValidator`
- `CustomEqualValidator`
- `StringCustomPatternValidator`
- `IpAddressValidator`
- `Ipv6AddressValidator`
- `StringNumMinValidator`
- `StringNumMaxValidator`
- `StringContainsValidator`
- `StringNotContainsValidator`
- `FileTypeValidator`
- `FileSizeValidator`
- `BoolTrueValidator`
- `BoolFalseValidator`
- `BoolAgreeToTermsAndConditionsValidator`

Each validator focuses on a single validation rule, adhering to the single-responsibility principle.

## Internationalization

`form_model` supports multiple languages out of the box:

```dart
// Set the current locale
FormModelLocalizations().setCurrentLocale(const Locale('es'));

// Get a translated error message
final errorMessage = emailModel.error?.translatedMessage;
```

### Supported Languages

`form_model` supports the following languages:

- English (en)
- Spanish (es)
- French (fr)
- German (de)
- Arabic (ar)
- Chinese (Simplified) (zh_CN)
- Hindi (hi)
- Italian (it)
- Japanese (ja)
- Korean (ko)
- Dutch (nl)
- Portuguese (pt)
- Russian (ru)
- Turkish (tr)
- Ukrainian (uk)
- Vietnamese (vi)
- Polish (pl)
- Swedish (sv)

## Integration with BLoC and Freezed

`form_model` integrates seamlessly with the BLoC pattern. Here's an example of a Flutter BLoC state using Freezed:

```dart
@freezed
class RegistrationState with _$RegistrationState {
  const factory RegistrationState({
    @Default(FormModel<String>(validators: [RequiredValidator()]))
    FormModel<String> username,
    
    @Default(FormModel<String>(validators: [RequiredValidator(), EmailValidator()]))
    FormModel<String> email,
    
    @Default(FormModel<String>(validators: [
      RequiredValidator(),
      PasswordLengthValidator(minLength: 8),
      PasswordUppercaseValidator(),
      PasswordLowercaseValidator(),
      PasswordNumberValidator(),
      PasswordSpecialCharValidator(),
    ]))
    FormModel<String> password,
    
    @Default(false) bool isSubmitting,
    @Default(false) bool isSuccess,
    String? errorMessage,
  }) = _RegistrationState;
}
```

## Custom Validators

Custom validators allow you to create specific validation rules not covered by built-in validators. Here's a simple example of a custom validator that checks if a string starts with a specific prefix:

```dart
String? validatePrefix(String? value) {
  const requiredPrefix = 'USER_';
  if (value == null || !value.startsWith(requiredPrefix)) {
    return 'Value must start with $requiredPrefix';
  }
  return null;
}

final userIdModel = FormModel<String>(
  validators: [
    RequiredValidator(),
    CustomValidator(validator: validatePrefix),
  ],
);

// Usage
void validateUserId(String userId) {
  final validatedModel = userIdModel.setValue(userId).validate();
  if (validatedModel.isValid) {
    print('Valid User ID: ${validatedModel.value}');
  } else {
    print('Invalid User ID: ${validatedModel.error?.translatedMessage}');
  }
}

// Example
validateUserId('USER_123'); // Valid
validateUserId('ADMIN_456'); // Invalid
```

This custom validator checks if the input string starts with the prefix 'USER_'. It demonstrates how you can easily create application-specific validation logic using custom validators.

Custom validation functions should return a string with an error message if validation fails, or `null` if it passes. This approach allows you to extend form_model's capabilities to suit your specific needs while maintaining clean and modular code.

## Working with Custom Objects

form_model can handle complex custom objects as well. Here's an example using an `Address` class:

```dart
class Address {
  final String street;
  final String city;

  Address({required this.street, required this.city});
}

String? validateStreet(Address? value) {
  if (value == null || value.street.isEmpty) return 'Street is required';
  return null;
}

String? validateCity(Address? value) {
  if (value == null || value.city.isEmpty) return 'City is required';
  return null;
}

final addressModel = FormModel<Address>(
  validators: [
    CustomValidator(validator: validateStreet),
    CustomValidator(validator: validateCity),
  ],
);

// Usage
void updateAddress(String street, String city) {
  final newAddress = Address(street: street, city: city);
  addressModel.setValue(newAddress).validate();
}
```

This approach allows you to validate complex objects while keeping individual validation rules separate and focused.

## Custom Translations

You can set custom translations for both custom and predefined error messages:

```dart
void setCustomTranslations() {
  // Set custom translation for a custom error
  FormModelLocalizations().setCustomErrorTranslations(
    'en',
    const CustomFormErrorKey('password_no_exclamation'),
    'Password must contain an exclamation mark',
  );

  // Override translation for a predefined error
  FormModelLocalizations().setCustomErrorTranslations(
    'en',
    const PredefinedFormErrorKey(PredefinedFormErrorType.required),
    'This field cannot be left empty',
  );

  // Set translations for other languages
  FormModelLocalizations().setCustomErrorTranslations(
    'es',
    const CustomFormErrorKey('password_no_exclamation'),
    'La contraseña debe contener un signo de exclamación',
  );

  FormModelLocalizations().setCustomErrorTranslations(
    'es',
    const PredefinedFormErrorKey(PredefinedFormErrorType.required),
    'Este campo no puede estar vacío',
  );
}
```

Call this function early in your app's lifecycle to set up custom translations.

## Contributing

Contributions are welcome! Please read our [contributing guidelines](CONTRIBUTING.md) to get started. The package already has comprehensive test coverage, but additional tests for new features are always appreciated.

## License

This project is licensed under the 3-Clause BSD License - see the [LICENSE](LICENSE) file for details.
