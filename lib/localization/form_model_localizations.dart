import 'dart:ui';

import 'package:form_model/src/errors/form_error_key.dart';

import 'translations/all.dart';

class FormModelLocalizations {
  FormModelLocalizations._internal();

  static final FormModelLocalizations _instance =
      FormModelLocalizations._internal();

  factory FormModelLocalizations() => _instance;

  Locale _currentLocale = const Locale('en');

  Locale get currentLocale => _currentLocale;

  set currentLocale(Locale locale) {
    if (!supportedLocales.contains(locale.languageCode)) {
      throw ArgumentError.value(locale, 'locale',
          'Form model translation for this locale is not yet supported');
    }
    _currentLocale = locale;
  }

  final _customTranslations = <String, Map<FormErrorKey, String>>{};

  String? translateErrorKey(FormErrorKey errorKey) {
    final customTranslation =
        _customTranslations[_currentLocale.languageCode]?[errorKey];
    if (customTranslation != null) {
      return customTranslation;
    }

    return switch (errorKey) {
      PredefinedFormErrorKey() =>
        localeMap[_currentLocale.languageCode]?.translate(errorKey),
      CustomFormErrorKey() => errorKey.key,
    };
  }

  void setCustomErrorTranslations(
      String locale, FormErrorKey key, String message) {
    _customTranslations.putIfAbsent(locale, () => {})[key] = message;
  }
}
