import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:form_model/form_model.dart';

void main() {
  group('FormErrorExtension Tests', () {
    late FormModelLocalizations localizations;

    setUp(() {
      localizations = FormModelLocalizations();
      // Ensure we're using a consistent locale for testing
      localizations.setCurrentLocale(Locale('en'));
    });

    test('translatedMessage for PredefinedFormErrorKey', () {
      const errorKey = PredefinedFormErrorKey(PredefinedFormErrorType.required);
      expect(errorKey.translatedMessage, isNotNull);
      expect(errorKey.translatedMessage, isNotEmpty);
      expect(errorKey.translatedMessage, contains('required'));
    });

    test('translatedMessage for CustomFormErrorKey', () {
      const customKey = CustomFormErrorKey('custom_error');
      expect(customKey.translatedMessage, equals('custom_error'));
    });

    test('translatedMessage with parameters', () {
      const errorKey = PredefinedFormErrorKey(PredefinedFormErrorType.lengthIsLessThanMin, 5);
      expect(errorKey.translatedMessage, contains('5'));
    });

    test('translatedMessage for different locales', () {
      const errorKey = PredefinedFormErrorKey(PredefinedFormErrorType.required);

      localizations.setCurrentLocale(Locale('en'));
      final englishMessage = errorKey.translatedMessage;

      localizations.setCurrentLocale(Locale('es'));

      final spanishMessage = errorKey.translatedMessage;

      expect(englishMessage, isNot(equals(spanishMessage)));
    });

    test('translatedMessage for custom error with translation', () {
      const customKey = CustomFormErrorKey('custom_error');
      localizations.setCustomErrorTranslations('en', customKey, 'Custom error message');

      expect(customKey.translatedMessage, equals('Custom error message'));
    });

    test('translatedMessage for all PredefinedFormErrorTypes', () {
      for (var errorType in PredefinedFormErrorType.values) {
        final errorKey = PredefinedFormErrorKey(errorType);
        expect(errorKey.translatedMessage, isNotNull);
        expect(errorKey.translatedMessage, isNotEmpty);
      }
    });

    test('translatedMessage consistency across multiple calls', () {
      const errorKey = PredefinedFormErrorKey(PredefinedFormErrorType.required);
      final firstCall = errorKey.translatedMessage;
      final secondCall = errorKey.translatedMessage;
      expect(firstCall, equals(secondCall));
    });
  });
}
