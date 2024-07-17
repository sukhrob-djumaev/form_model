import 'dart:ui';

import 'package:form_model/src/enums/error_code.dart';
import 'package:form_model/src/model/form_model_error.dart';

import 'translations/all.dart';

class FormModelLocalizations {
  FormModelLocalizations._internal();

  static final FormModelLocalizations _instance =
      FormModelLocalizations._internal();

  factory FormModelLocalizations() => _instance;

  Locale _currentLocale = const Locale('en');

  Locale get currentLocale => _currentLocale;

  set currentLocale(Locale locale) {
    if (!supportedLocales.contains(locale.countryCode)) {
      throw ArgumentError.value(locale, 'locale',
          'Form model translation for this locale is not yet supported');
    }
    _currentLocale = locale;
  }

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

  void setCustomErrorTexts(
      String locale, Map<ErrorCode, String> customMessages) {
    _customErrorTexts[locale] = customMessages;
  }

  final Map<String, Map<ErrorCode, String>> _customErrorTexts = {};
}
