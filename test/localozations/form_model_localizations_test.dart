import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:form_model/form_model.dart';

void main() {
  group('FormModelLocalizations', () {
    late FormModelLocalizations localizations;

    setUp(() {
      localizations = FormModelLocalizations();
    });

    test('Default locale should be English', () {
      expect(localizations.currentLocale.languageCode, equals('en'));
    });

    group('setCurrentLocale', () {
      test('Should set locale correctly', () {
        localizations.setCurrentLocale(const Locale('fr'));
        expect(localizations.currentLocale.languageCode, equals('fr'));
      });

      test('Should allow setting unsupported locale', () {
        localizations.setCurrentLocale(const Locale('xx'));
        expect(localizations.currentLocale.languageCode, equals('xx'));
      });
    });

    group('setFallbackLocale', () {
      test('Should set fallback locale correctly', () {
        localizations.setFallbackLocale(const Locale('en'));
        localizations.setCurrentLocale(const Locale('fr'));
        var result = localizations.translateErrorKey(
            const PredefinedFormErrorKey(PredefinedFormErrorType.required));
        expect(result, isNotNull);
      });

      test('Should allow setting null fallback locale', () {
        localizations.setFallbackLocale(null);
        // No exception should be thrown
      });
    });

    group('supportedLocales', () {
      test('Should include predefined locales', () {
        expect(localizations.supportedLocales, contains('en'));
        // Add checks for other predefined locales
      });

      test('Should include custom translation locales', () {
        localizations.setCustomErrorTranslations(
            'zz', const CustomFormErrorKey('test'), 'Test');
        expect(localizations.supportedLocales, contains('zz'));
      });
    });

    group('translateErrorKey', () {
      test('Should return custom translation if available', () {
        localizations.clearCustomErrorTranslations('fr');
        localizations.setCustomErrorTranslations(
            'fr', const CustomFormErrorKey('test'), 'Test en français');
        localizations.setCurrentLocale(const Locale('fr'));
        expect(
            localizations.translateErrorKey(const CustomFormErrorKey('test')),
            equals('Test en français'));
      });

      test('Should return predefined translation if available', () {
        localizations.setCurrentLocale(const Locale('en'));
        expect(
          localizations.translateErrorKey(
              const PredefinedFormErrorKey(PredefinedFormErrorType.required)),
          equals('This field is required.'),
        );
      });

      test(
          'Should use fallback locale when translation not found in current locale',
          () {
        localizations.setCurrentLocale(const Locale('fr'));
        localizations.setFallbackLocale(const Locale('en'));
        localizations.setCustomErrorTranslations(
            'en', const CustomFormErrorKey('test'), 'Test in English');
        expect(
            localizations.translateErrorKey(const CustomFormErrorKey('test')),
            equals('Test in English'));
      });

      test('Should return error key string when no translation found', () {
        localizations.setCurrentLocale(const Locale('fr'));
        expect(
            localizations
                .translateErrorKey(const CustomFormErrorKey('unknown')),
            equals('unknown'));
      });
    });

    group('Custom translations', () {
      test('Should add and retrieve custom translations', () {
        localizations.setCustomErrorTranslations(
            'fr', const CustomFormErrorKey('test'), 'Test');
        localizations.setCurrentLocale(const Locale('fr'));
        expect(
            localizations.translateErrorKey(const CustomFormErrorKey('test')),
            equals('Test'));
      });

      test('Should remove custom translations', () {
        localizations.setCustomErrorTranslations(
            'fr', const CustomFormErrorKey('test'), 'Test');
        localizations.removeCustomErrorTranslation(
            'fr', const CustomFormErrorKey('test'));
        localizations.setCurrentLocale(const Locale('fr'));
        expect(
            localizations.translateErrorKey(const CustomFormErrorKey('test')),
            equals('test'));
      });

      test('Should clear all custom translations for a locale', () {
        localizations.setCustomErrorTranslations(
            'fr', const CustomFormErrorKey('test1'), 'Test1');
        localizations.setCustomErrorTranslations(
            'fr', const CustomFormErrorKey('test2'), 'Test2');
        localizations.clearCustomErrorTranslations('fr');
        localizations.setCurrentLocale(const Locale('fr'));
        expect(
            localizations.translateErrorKey(const CustomFormErrorKey('test1')),
            equals('test1'));
        expect(
            localizations.translateErrorKey(const CustomFormErrorKey('test2')),
            equals('test2'));
      });
    });

    test('hasCustomTranslationsForLocale should work correctly', () {
      expect(localizations.hasCustomTranslationsForLocale('fr'), isFalse);
      localizations.setCustomErrorTranslations(
          'fr', const CustomFormErrorKey('test'), 'Test');
      expect(localizations.hasCustomTranslationsForLocale('fr'), isTrue);
    });

    group('Error key translations for all supported languages', () {
      test(
          'Should have translations for all PredefinedFormErrorTypes in all supported languages',
          () {
        for (var locale in localizations.supportedLocales) {
          localizations.setCurrentLocale(Locale(locale));
          for (var errorType in PredefinedFormErrorType.values) {
            var errorKey = PredefinedFormErrorKey(errorType);
            var translation = localizations.translateErrorKey(errorKey);
            expect(translation, isNotNull);
            expect(translation, isNotEmpty);
            expect(translation, isNot(equals(errorKey.toString())));
          }
        }
      });
    });

    group('Consistent translations across languages', () {
      test('Translations should be different for each language', () {
        var testCases = [
          PredefinedFormErrorKey(PredefinedFormErrorType.required),
          PredefinedFormErrorKey(
              PredefinedFormErrorType.lengthIsLessThanMin, 5),
          PredefinedFormErrorKey(PredefinedFormErrorType.isNotValidEmail),
        ];

        for (var errorKey in testCases) {
          var translations = <String, String?>{};
          for (var locale in localizations.supportedLocales) {
            localizations.setCurrentLocale(Locale(locale));
            translations[locale] = localizations.translateErrorKey(errorKey);
          }

          var uniqueTranslations = translations.values.toSet();
          expect(uniqueTranslations.length, greaterThan(1),
              reason:
                  'Translations should be different across languages for ${errorKey.runtimeType}');
        }
      });
    });

    group('Interpolation of parameters', () {
      test('Should correctly interpolate parameters in translated strings', () {
        var testCases = [
          (
            PredefinedFormErrorKey(
                PredefinedFormErrorType.lengthIsLessThanMin, 5),
            '5'
          ),
          (
            PredefinedFormErrorKey(
                PredefinedFormErrorType.lengthIsMoreThanMax, 10),
            '10'
          ),
          (
            PredefinedFormErrorKey(
                PredefinedFormErrorType.isNotEqualTo, 'test'),
            'test'
          ),
        ];

        for (var locale in localizations.supportedLocales) {
          localizations.setCurrentLocale(Locale(locale));
          for (var (errorKey, expectedParam) in testCases) {
            var translation = localizations.translateErrorKey(errorKey);
            expect(translation, contains(expectedParam),
                reason:
                    'Translation should contain the parameter value for locale $locale');
          }
        }
      });
    });

    group('Edge cases', () {
      test('Should handle non-existent locale gracefully', () {
        localizations.setCurrentLocale(const Locale('nonexistent'));
        expect(
          localizations.translateErrorKey(
              const PredefinedFormErrorKey(PredefinedFormErrorType.required)),
          isNotNull,
        );
      });
    });
  });
}
