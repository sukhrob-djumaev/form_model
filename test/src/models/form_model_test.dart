import 'package:flutter_test/flutter_test.dart';
import 'package:form_model/form_model.dart';
import 'package:form_model/src/enums/form_status.dart';

void main() {
  group('FormModel', () {
    test('initial value is null and status is pure by default', () {
      const formModel = FormModel();
      expect(formModel.value, isNull);
      expect(formModel.status, equals(FormStatus.pure));
      expect(formModel.validators, isEmpty);
    });

    test('reset returns new instance with pure status and optional new value', () {
      const formModel = FormModel(value: 'initial value');
      final resetModel = formModel.reset('new value');
      expect(resetModel.value, equals('new value'));
      expect(resetModel.status, equals(FormStatus.pure));
    });

    test('setValue returns new instance with updated value', () {
      const formModel = FormModel(value: 'initial value');
      final updatedModel = formModel.setValue('updated value');
      expect(updatedModel.value, equals('updated value'));
    });

    test('validate marks the form as dirty and returns new instance', () {
      const formModel = FormModel(value: 'value');
      final validatedModel = formModel.validate();
      expect(validatedModel.status, equals(FormStatus.dirty));
    });

    test('addValidator returns new instance with added validator', () {
      const formModel = FormModel();
      const validator = RequiredValidator<String>();
      final modelWithValidator = formModel.addValidator(validator);
      expect(modelWithValidator.validators, contains(validator));
    });

    test('removeValidator returns new instance with removed validator', () {
      const validator = RequiredValidator<String>();
      const formModel = FormModel(validators: [validator]);
      final modelWithoutValidator = formModel.removeValidator(validator);
      expect(modelWithoutValidator.validators, isNot(contains(validator)));
    });

    test('error returns validation error when dirty with validators', () {
      const formModel = FormModel(value: '');
      final modelWithValidators = formModel.addValidator(const RequiredValidator());
      final dirtyModel = modelWithValidators.validate();
      expect(dirtyModel.error, isNotNull);
    });

    test('errorsList returns list of errors when dirty with validators', () {
      const formModel = FormModel(value: '');
      final modelWithValidators =
          formModel.addValidator(const RequiredValidator()).addValidator(const LengthValidator(minLength: 5));
      final dirtyModel = modelWithValidators.validate();
      expect(dirtyModel.errorsList, isNotEmpty);
      expect(dirtyModel.errorsList.length, 2); // Assuming two validators have errors
    });

    test('isValid returns true when there are no validation errors', () {
      const formModel = FormModel(value: 'valid value');
      final modelWithValidators = formModel.addValidator(const LengthValidator(minLength: 5));
      expect(modelWithValidators.isValid, isTrue);
    });

    test('isValid returns false when there are validation errors', () {
      const formModel = FormModel(value: 'val');
      final modelWithValidators = formModel.addValidator(const LengthValidator(minLength: 5));
      final dirtyModel = modelWithValidators.validate();
      expect(dirtyModel.isValid, isFalse);
    });

    test('isDirty returns true when form is dirty', () {
      const formModel = FormModel(value: 'value');
      final dirtyModel = formModel.validate();
      expect(dirtyModel.isDirty, isTrue);
    });

    test('isDirty returns false when form is pure', () {
      const formModel = FormModel();
      expect(formModel.isDirty, isFalse);
    });
  });
}
