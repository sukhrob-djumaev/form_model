import 'dart:ui';

import 'package:form_model/src/enums/error_code.dart';
import 'package:form_model/src/models/form_model_error.dart';

import 'translations/all.dart';

/// Provides localization support for form field error messages.
///
/// The `FormModelLocalizations` class manages the localization of error messages
/// related to form field validation errors. It supports fetching error messages
/// based on the current locale and allows setting custom error messages for specific locales.
///
/// Example usage:
/// ```dart
/// // Initialize and set current locale
/// FormModelLocalizations localizations = FormModelLocalizations();
/// localizations.currentLocale = Locale('en');
///
/// // Fetch error message for a specific error
/// FormModelError error = FormModelError(code: ErrorCode.required, value: 'Field is required');
/// String? errorMessage = localizations.getErrorMessage(error);
///
/// // Set custom error messages for a locale
/// localizations.setCustomErrorTexts('en', {
///   ErrorCode.required: 'This field cannot be empty',
///   ErrorCode.custom: 'Custom error message for this field',
/// });
/// ```
class FormModelLocalizations {
  FormModelLocalizations._internal();

  static final FormModelLocalizations _instance =
      FormModelLocalizations._internal();

  factory FormModelLocalizations() => _instance;

  /// The current locale used for error message localization.
  Locale _currentLocale = const Locale('en');

  /// Retrieves the current locale used for error message localization.
  Locale get currentLocale => _currentLocale;

  /// Sets the current locale used for error message localization.
  ///
  /// Throws an [ArgumentError] if the provided locale is not supported.
  set currentLocale(Locale locale) {
    if (!supportedLocales.contains(locale.countryCode)) {
      throw ArgumentError.value(locale, 'locale',
          'Form model translation for this locale is not yet supported');
    }
    _currentLocale = locale;
  }

  /// Retrieves the error message corresponding to the given [error].
  ///
  /// If a custom error message is defined for the current locale and the error code,
  /// it is returned. Otherwise, falls back to the default localized error message.
  ///
  /// Returns `null` if no matching error message is found.
  String? getErrorMessage(FormModelError error) {
    // Check for custom message first based on current locale
    if (error.code == ErrorCode.custom) {
      String? customMessage = _getCustomErrorMessage(error);
      if (customMessage != null) {
        return customMessage;
      }
    }
    // Fall back to default localization for other error codes
    return localeMap[_currentLocale.countryCode]?.translate(error);
  }

  /// Retrieves the custom error message for ErrorCode.custom and current locale.
  String? _getCustomErrorMessage(FormModelError error) {
    // Check if custom error texts exist for the current locale
    if (_customErrorTexts.containsKey(_currentLocale.countryCode)) {
      String? customMessage =
          _customErrorTexts[_currentLocale.countryCode]?[error.code];
      return customMessage;
    }
    return null;
  }

  /// Sets custom error messages for a specific locale.
  ///
  /// Allows setting custom error messages for specific error codes and locales.
  ///
  /// Example:
  /// ```dart
  /// localizations.setCustomErrorTexts('en', {
  ///   'Field Name': 'Custom error message for this field',
  /// });
  /// ```
  void setCustomErrorTexts(
      String locale, Map<ErrorCode, String> customMessages) {
    _customErrorTexts[locale] = customMessages;
  }

  /// Internal storage for custom error messages mapped by locale.
  final Map<String, Map<ErrorCode, String>> _customErrorTexts = {};
}
