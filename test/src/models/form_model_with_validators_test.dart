import 'package:flutter_test/flutter_test.dart';
import 'package:form_model/form_model.dart';

void main() {
  group('FormModel with Validators', () {
    test('Initial state of FormModel', () {
      const formModel = FormModel<String>(validators: [RequiredValidator()]);
      expect(formModel.isValid, isTrue);
      expect(formModel.isDirty, isFalse);
      expect(formModel.error, isNull);
      expect(formModel.errorsList, isEmpty);
    });

    test('FormModel state after setting value', () {
      final formModel = const FormModel<String>(validators: [RequiredValidator()]).setValue('test');
      expect(formModel.value, equals('test'));
      expect(formModel.isDirty, isFalse);
      expect(formModel.isValid, isTrue);
    });

    test('FormModel state after validation', () {
      final formModel = const FormModel<String>(validators: [RequiredValidator()]).setValue('test').validate();
      expect(formModel.isDirty, isTrue);
      expect(formModel.isValid, isTrue);
    });

    test('FormModel with failing validation', () {
      final formModel = const FormModel<String>(validators: [RequiredValidator()]).setValue(null).validate();
      expect(formModel.isDirty, isTrue);
      expect(formModel.isValid, isFalse);
      expect(formModel.error, isNotNull);
      expect(formModel.errorsList.length, equals(1));
    });

    test('FormModel with multiple validators', () {
      final formModel = const FormModel<String>(validators: [
        RequiredValidator(),
        StringMinLengthValidator(minLength: 5),
      ]).setValue('a').validate();

      expect(formModel.isValid, isFalse);
      expect(formModel.errorsList.length, equals(1));
      expect(formModel.error, isA<PredefinedFormErrorKey>());
    });

    test('FormModel reset', () {
      final formModel = const FormModel<String>(validators: [RequiredValidator()]).setValue('test').validate().reset();
      expect(formModel.isDirty, isFalse);
      expect(formModel.value, equals('test'));
      expect(formModel.isValid, isTrue);
    });

    test('FormModel add validator', () {
      const initialModel = FormModel<String>(validators: [RequiredValidator()]);
      final updatedModel = initialModel.addValidator(const StringMinLengthValidator(minLength: 5));

      expect(updatedModel.validators.length, equals(2));

      final validatedModel = updatedModel.setValue('a').validate();
      expect(validatedModel.isValid, isFalse);
      expect(validatedModel.errorsList.length, equals(1));
    });

    test('FormModel remove validator', () {
      const initialValidator = RequiredValidator<String>();
      const initialModel = FormModel<String>(validators: [
        initialValidator,
        StringMinLengthValidator(minLength: 5),
      ]);

      final updatedModel = initialModel.removeValidator(initialValidator);
      expect(updatedModel.validators.length, equals(1));

      final validatedModel = updatedModel.setValue('a').validate();
      expect(validatedModel.isValid, isFalse);
      expect(validatedModel.errorsList.length, equals(1));
    });

    test('FormModel with custom error key', () {
      final customValidator = StringCustomValidator(
        validator: (value) => value == 'special' ? null : 'Not special',
      );
      final formModel = FormModel<String>(validators: [customValidator]).setValue('not special').validate();

      expect(formModel.isValid, isFalse);
      expect(formModel.error, isA<CustomFormErrorKey>());
    });

    test('FormModel equality', () {
      final model1 = const FormModel<String>(validators: [RequiredValidator()]).setValue('test');
      final model2 = const FormModel<String>(validators: [RequiredValidator()]).setValue('test');
      final model3 = const FormModel<String>(validators: [RequiredValidator()]).setValue('different');

      expect(model1 == model2, isTrue);
      expect(model1 == model3, isFalse);
    });

    test('FormModel hashCode', () {
      final model1 = const FormModel<String>(validators: [RequiredValidator()]).setValue('test');
      final model2 = const FormModel<String>(validators: [RequiredValidator()]).setValue('test');

      expect(model1.hashCode == model2.hashCode, isTrue);
    });
  });
}
