import 'package:flutter_test/flutter_test.dart';
import 'package:form_model/form_model.dart';

void main() {
  group('FormModel', () {
    test('initial state', () {
      const model = FormModel<String>(value: 'test');
      expect(model.value, equals('test'));
      expect(model.isValid, isTrue);
      expect(model.isDirty, isFalse);
      expect(model.error, isNull);
      expect(model.errorsList, isEmpty);
    });

    test('setValue creates a new instance', () {
      const model1 = FormModel<String>(value: 'test');
      final model2 = model1.setValue('new value');

      expect(model2, isNot(same(model1)));
      expect(model2.value, equals('new value'));
      expect(model1.value, equals('test')); // Original unchanged
    });

    test('validate changes status to dirty', () {
      const model1 = FormModel<String>(value: 'test');
      final model2 = model1.validate();

      expect(model2.isDirty, isTrue);
      expect(model1.isDirty, isFalse); // Original unchanged
    });

    test('reset changes status to pure', () {
      final model1 = const FormModel<String>(value: 'test').validate();
      final model2 = model1.reset();

      expect(model2.isDirty, isFalse);
      expect(model1.isDirty, isTrue); // Original unchanged
    });

    test('equality', () {
      const model1 = FormModel<String>(value: 'test');
      const model2 = FormModel<String>(value: 'test');
      const model3 = FormModel<String>(value: 'different');

      expect(model1, equals(model2));
      expect(model1, isNot(equals(model3)));
    });

    test('hash code', () {
      const model1 = FormModel<String>(value: 'test');
      const model2 = FormModel<String>(value: 'test');
      const model3 = FormModel<String>(value: 'different');

      expect(model1.hashCode, equals(model2.hashCode));
      expect(model1.hashCode, isNot(equals(model3.hashCode)));
    });

    test('addValidator creates a new instance with additional validator', () {
      const model1 = FormModel<String>(value: 'test');
      final model2 = model1.addValidator(const RequiredValidator());

      expect(model2, isNot(same(model1)));
      expect(model2.validators.length, equals(model1.validators.length + 1));
    });

    test(
        'removeValidator creates a new instance without the specified validator',
        () {
      const validator = RequiredValidator<String>();
      const model1 = FormModel<String>(value: 'test', validators: [validator]);
      final model2 = model1.removeValidator(validator);

      expect(model2, isNot(same(model1)));
      expect(model2.validators.length, equals(model1.validators.length - 1));
      expect(model2.validators, isNot(contains(validator)));
    });

    test('replaceValidator creates a new instance with replaced validator', () {
      const oldValidator = RequiredValidator<String>();
      const newValidator = StringMinLengthValidator(minLength: 5);
      const model1 =
          FormModel<String>(value: 'test', validators: [oldValidator]);
      final model2 = model1.replaceValidator(
        predicate: (validator) => validator == oldValidator,
        newValidator: newValidator,
      );

      expect(model2, isNot(same(model1)));
      expect(model2.validators.length, equals(model1.validators.length));
      expect(model2.validators, contains(newValidator));
      expect(model2.validators, isNot(contains(oldValidator)));
    });
  });
}
