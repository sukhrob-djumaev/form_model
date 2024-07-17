import 'package:flutter_test/flutter_test.dart';
import 'package:form_model/form_model.dart';

void main() {
  group('FormModel', () {
    test('initializes with default values', () {
      final formModel = FormModel<String>();
      expect(formModel.value, isNull);
      expect(formModel.isValid, isTrue);
      expect(formModel.isDirty, isFalse);
      expect(formModel.error, isNull);
      expect(formModel.errorsList, isEmpty);
      expect(formModel.validators, isEmpty);
    });

    test('sets value correctly', () {
      final formModel = FormModel<String>().setValue('test');
      expect(formModel.value, equals('test'));
    });

    test('adds and removes validators', () {
      final formModel = FormModel<String>();
      final mockValidator = RequiredValidator<String>();

      final updatedModel = formModel.addValidator(mockValidator);
      expect(updatedModel.validators.length, equals(1));

      final finalModel = updatedModel.removeValidator(mockValidator);
      expect(finalModel.validators, isEmpty);
    });

    test('validates and changes dirty state', () {
      final formModel = FormModel<String>(value: 'test');
      expect(formModel.isDirty, isFalse);

      final validatedModel = formModel.validate();
      expect(validatedModel.isDirty, isTrue);
    });

    test('resets to initial state', () {
      final formModel = FormModel<String>(value: 'test')
        ..validate()
        ..setValue('new value');

      final resetModel = formModel.reset();
      expect(resetModel.value, equals('test'));
      expect(resetModel.isDirty, isFalse);
    });
  });
}
