import 'package:flutter_test/flutter_test.dart';
import 'package:form_model/form_model.dart';
import 'package:form_model/src/enums/error_code.dart';
import 'package:form_model/src/enums/form_status.dart';
import 'package:form_model/src/models/form_error.dart';
import 'package:form_model/src/validators/base_form_model_validator.dart';

void main() {
  group('FormModelCustom', () {
    test('initial value is null and status is pure by default', () {
      const formModel = FormModelCustom<int>();
      expect(formModel.value, isNull);
      expect(formModel.status, equals(FormStatus.pure));
      expect(formModel.validators, isEmpty);
    });

    test('reset returns new instance with pure status and optional new value', () {
      const formModel = FormModelCustom<int>(value: 1);
      final resetModel = formModel.reset(2);
      expect(resetModel.value, equals(2));
      expect(resetModel.status, equals(FormStatus.pure));
    });

    test('setValue returns new instance with updated value', () {
      const formModel = FormModelCustom<int>(value: 1);
      final updatedModel = formModel.setValue(2);
      expect(updatedModel.value, equals(2));
    });

    test('validate marks the form as dirty and returns new instance', () {
      const formModel = FormModelCustom<int>(value: 1);
      final validatedModel = formModel.validate();
      expect(validatedModel.status, equals(FormStatus.dirty));
    });

    test('addValidator returns new instance with added validator', () {
      const formModel = FormModelCustom<int>();
      const validator = RequiredValidator<int>();
      final modelWithValidator = formModel.addValidator(validator);
      expect(modelWithValidator.validators, contains(validator));
    });

    test('removeValidator returns new instance with removed validator', () {
      const validator = RequiredValidator<int>();
      const formModel = FormModelCustom<int>(validators: [validator]);
      final modelWithoutValidator = formModel.removeValidator(validator);
      expect(modelWithoutValidator.validators, isNot(contains(validator)));
    });

    test('error returns validation error when dirty with validators', () {
      const formModel = FormModelCustom<int>();
      final modelWithValidators = formModel.addValidator(const RequiredValidator());
      final dirtyModel = modelWithValidators.validate();
      expect(dirtyModel.error, isNotNull);
    });

    test('errorsList returns list of errors when dirty with validators', () {
      const formModel = FormModelCustom<int>(value: 11);
      final modelWithValidators = formModel
          .addValidator(const CustomEqualValidator<int>(equalValue: 2))
          .addValidator(CustomIntDivisibleBy5Validator());
      final dirtyModel = modelWithValidators.validate();
      expect(dirtyModel.errorsList, isNotEmpty);
      expect(dirtyModel.errorsList.length, 2); // Assuming two validators have errors
    });

    test('isValid returns true when there are no validation errors', () {
      const formModel = FormModelCustom<int>(value: 5);
      final modelWithValidators = formModel.addValidator(CustomIntDivisibleBy5Validator());
      expect(modelWithValidators.isValid, isTrue);
    });

    test('isValid returns false when there are validation errors', () {
      const formModel = FormModelCustom<int>(value: 11);
      final modelWithValidators = formModel.addValidator(CustomIntDivisibleBy5Validator());
      final dirtyModel = modelWithValidators.validate();
      expect(dirtyModel.isValid, isFalse);
    });

    test('isDirty returns true when form is dirty', () {
      const formModel = FormModelCustom<int>(value: 1);
      final dirtyModel = formModel.validate();
      expect(dirtyModel.isDirty, isTrue);
    });

    test('isDirty returns false when form is pure', () {
      const formModel = FormModelCustom<int>();
      expect(formModel.isDirty, isFalse);
    });
  });
}

class CustomIntDivisibleBy5Validator implements BaseFormModelValidator<int> {
  @override
  FormError<int?>? validate(int? value) {
    if (value != null) {
      if (value < 5 || value % 5 > 0) {
        return FormError(
          code: ErrorCode.custom,
          customErrorText: {'en': 'The number is not divisible by 5'},
        );
      }
    }
    return null;
  }
}
