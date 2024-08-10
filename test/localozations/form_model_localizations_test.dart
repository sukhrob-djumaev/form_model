import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:form_model/form_model.dart';

void main() {
  group('FormModelLocalizations Comprehensive Tests', () {
    late FormModelLocalizations localizations;

    setUp(() {
      localizations = FormModelLocalizations();
    });

    test('Default locale should be English', () {
      expect(localizations.currentLocale.languageCode, equals('en'));
    });

    test('Setting valid locales', () {
      for (var locale in supportedLocales) {
        localizations.currentLocale = Locale(locale);
        expect(localizations.currentLocale.languageCode, equals(locale));
      }
    });

    test('Setting unsupported locale should throw ArgumentError', () {
      expect(() => localizations.currentLocale = const Locale('xx'), throwsA(isA<ArgumentError>()));
    });

    group('Error key translations for all supported languages', () {
      for (var locale in supportedLocales) {
        test('$locale translations', () {
          localizations.currentLocale = Locale(locale);

          // Test all PredefinedFormErrorTypes
          for (var errorType in PredefinedFormErrorType.values) {
            var errorKey = PredefinedFormErrorKey(errorType);
            var translation = localizations.translateErrorKey(errorKey);
            expect(translation, isNotNull);
            expect(translation, isNot(isEmpty));
            expect(translation, isNot(equals('Translation missing')));
          }

          // Test specific error types with parameters
          expect(localizations.translateErrorKey(const PredefinedFormErrorKey(PredefinedFormErrorType.required)),
              isNotEmpty);

          expect(
              localizations
                  .translateErrorKey(const PredefinedFormErrorKey(PredefinedFormErrorType.lengthIsLessThanMin, 5)),
              contains('5'));

          expect(
              localizations.translateErrorKey(
                  const PredefinedFormErrorKey(PredefinedFormErrorType.passwordNoSpecialChar, '!@#\$%^&*')),
              contains('!@#\$%^&*'));

          // Test string contains validation
          var containsTranslation = localizations
              .translateErrorKey(const PredefinedFormErrorKey(PredefinedFormErrorType.stringDoesNotContain, '@'));
          expect(containsTranslation, contains('@'));

          // Test file size formatting
          var fileSizeTranslation = localizations
              .translateErrorKey(const PredefinedFormErrorKey(PredefinedFormErrorType.fileSizeExceedsLimit, 1048576));
          expect(
            fileSizeTranslation,
            contains('1'),
          );
        });
      }
    });

    test('Custom error translations', () {
      const customKey = CustomFormErrorKey('custom_error');

      for (var locale in supportedLocales) {
        localizations.setCustomErrorTranslations(locale, customKey, 'Custom error in $locale');
        localizations.currentLocale = Locale(locale);
        expect(localizations.translateErrorKey(customKey), equals('Custom error in $locale'));
      }
    });

    test('Fallback to error key for untranslated custom errors', () {
      const customKey = CustomFormErrorKey('untranslated_error');
      expect(localizations.translateErrorKey(customKey), equals('untranslated_error'));
    });

    test('Consistent translations across languages', () {
      const testCases = [
        PredefinedFormErrorKey(PredefinedFormErrorType.required),
        PredefinedFormErrorKey(PredefinedFormErrorType.lengthIsLessThanMin, 5),
        PredefinedFormErrorKey(PredefinedFormErrorType.passwordNoSpecialChar, '!@#\$%^&*'),
        PredefinedFormErrorKey(PredefinedFormErrorType.stringDoesNotContain, '@'),
        PredefinedFormErrorKey(PredefinedFormErrorType.invalidFileType, ['jpg', 'png', 'gif']),
      ];

      for (var errorKey in testCases) {
        var translations = <String, String>{};
        for (var locale in supportedLocales) {
          localizations.currentLocale = Locale(locale);
          translations[locale] = localizations.translateErrorKey(errorKey)!;
        }

        // Check that all translations are different (not just copying one language)
        expect(translations.values.toSet().length, equals(supportedLocales.length),
            reason: 'Translations should be different for each language');
      }
    });

    test('Interpolation of parameters', () {
      for (var locale in supportedLocales) {
        localizations.currentLocale = Locale(locale);
        var errorKey = const PredefinedFormErrorKey(PredefinedFormErrorType.lengthIsLessThanMin, 10);
        var translation = localizations.translateErrorKey(errorKey);
        expect(translation, contains('10'));
      }
    });
  });
}
