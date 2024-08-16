import 'package:flutter/material.dart';
import 'package:form_model/src/errors/form_error_key.dart';
import 'translations/all.dart';

/// A singleton class that manages localizations for form error messages.
///
/// This class provides functionality to:
/// - Set and manage current and fallback locales
/// - Translate error keys to localized messages
/// - Manage custom translations
/// - Handle predefined and custom error keys
class FormModelLocalizations {
  /// Private constructor to prevent direct instantiation.
  FormModelLocalizations._internal();

  /// Singleton instance of [FormModelLocalizations].
  static final FormModelLocalizations _instance =
      FormModelLocalizations._internal();

  /// Factory constructor that returns the singleton instance.
  ///
  /// Usage:
  /// ```dart
  /// final localizations = FormModelLocalizations();
  /// ```
  factory FormModelLocalizations() => _instance;

  /// The current locale used for translations.
  ///
  /// Defaults to English ('en').
  Locale _currentLocale = const Locale('en');

  /// The fallback locale used when a translation is not found in the current locale.
  ///
  /// Can be null, in which case no fallback is used.
  Locale? _fallbackLocale;

  /// Gets the current locale.
  Locale get currentLocale => _currentLocale;

  /// Stores custom translations for different locales.
  ///
  /// The structure is:
  /// {locale: {errorKey: translatedMessage}}
  final _customTranslations = <String, Map<FormErrorKey, String>>{};

  /// Gets the set of all supported locales.
  ///
  /// This includes both predefined locales from [localeMap] and
  /// any locales for which custom translations have been added.
  Set<String> get supportedLocales =>
      Set.from(localeMap.keys)..addAll(_customTranslations.keys);

  /// Sets the current locale for translations.
  ///
  /// Throws an [ArgumentError] if the locale is empty.
  ///
  /// Usage:
  /// ```dart
  /// localizations.setCurrentLocale(const Locale('fr'));
  /// ```
  void setCurrentLocale(Locale locale) {
    if (locale.languageCode.isEmpty) {
      throw ArgumentError('Locale cannot be empty');
    }
    _currentLocale = locale;
  }

  /// Sets the fallback locale for translations.
  ///
  /// This locale is used when a translation is not found in the current locale.
  /// Set to null to disable fallback.
  ///
  /// Usage:
  /// ```dart
  /// localizations.setFallbackLocale(const Locale('en'));
  /// ```
  void setFallbackLocale(Locale? locale) {
    _fallbackLocale = locale;
  }

  /// Translates a given error key to a localized message.
  ///
  /// This method attempts to find a translation in the following order:
  /// 1. Custom translation in the current locale
  /// 2. Predefined translation in the current locale
  /// 3. Custom translation in the fallback locale (if set)
  /// 4. Predefined translation in the fallback locale (if set)
  /// 5. The error key string itself
  ///
  /// Usage:
  /// ```dart
  /// final message = localizations.translateErrorKey(PredefinedFormErrorKey(PredefinedFormErrorType.required));
  /// ```
  String? translateErrorKey(FormErrorKey errorKey) {
    // Try to get translation in current locale
    String? translation =
        _getTranslation(errorKey, _currentLocale.languageCode);

    // If not found and fallback is set, try fallback locale
    if (translation == null && _fallbackLocale != null) {
      translation = _getTranslation(errorKey, _fallbackLocale!.languageCode);
    }

    // If still not found, return the error key
    return translation ?? _getErrorKeyString(errorKey);
  }

  /// Internal method to get a translation for a given error key and language code.
  String? _getTranslation(FormErrorKey errorKey, String languageCode) {
    if (errorKey is PredefinedFormErrorKey) {
      // Check for custom translation
      final customTranslation = _customTranslations[languageCode]
          ?.entries
          .firstWhere(
              (entry) =>
                  entry.key is PredefinedFormErrorKey &&
                  (entry.key as PredefinedFormErrorKey).type == errorKey.type,
              orElse: () => MapEntry(errorKey, ''))
          .value;

      if (customTranslation != null && customTranslation.isNotEmpty) {
        return customTranslation;
      }

      // Fall back to predefined translations
      return localeMap[languageCode]?.translate(errorKey);
    } else if (errorKey is CustomFormErrorKey) {
      return _customTranslations[languageCode]?[errorKey];
    }

    return null;
  }

  /// Converts an error key to its string representation.
  String _getErrorKeyString(FormErrorKey errorKey) {
    if (errorKey is PredefinedFormErrorKey) {
      return errorKey.type.toString().split('.').last;
    } else if (errorKey is CustomFormErrorKey) {
      return errorKey.key;
    }
    return errorKey.toString();
  }

  /// Sets a custom translation for a specific error key and locale.
  ///
  /// If a translation already exists for the given locale and key, it will be overwritten.
  ///
  /// Usage:
  /// ```dart
  /// localizations.setCustomErrorTranslations('fr', PredefinedFormErrorKey(PredefinedFormErrorType.required), 'Ce champ est obligatoire');
  /// ```
  void setCustomErrorTranslations(
      String locale, FormErrorKey key, String message) {
    _customTranslations.putIfAbsent(locale, () => {})[key] = message;
  }

  /// Removes a custom translation for a specific error key and locale.
  ///
  /// If the translation doesn't exist, this method does nothing.
  ///
  /// Usage:
  /// ```dart
  /// localizations.removeCustomErrorTranslation('fr', PredefinedFormErrorKey(PredefinedFormErrorType.required));
  /// ```
  void removeCustomErrorTranslation(String locale, FormErrorKey key) {
    _customTranslations[locale]?.remove(key);
  }

  /// Clears all custom translations for a specific locale.
  ///
  /// Usage:
  /// ```dart
  /// localizations.clearCustomErrorTranslations('fr');
  /// ```
  void clearCustomErrorTranslations(String locale) {
    _customTranslations.remove(locale);
  }

  /// Checks if there are any custom translations for a given locale.
  ///
  /// Returns true if custom translations exist for the locale, false otherwise.
  ///
  /// Usage:
  /// ```dart
  /// bool hasCustom = localizations.hasCustomTranslationsForLocale('fr');
  /// ```
  bool hasCustomTranslationsForLocale(String locale) {
    return _customTranslations.containsKey(locale);
  }
}
