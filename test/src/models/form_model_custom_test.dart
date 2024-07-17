import 'package:flutter_test/flutter_test.dart';
import 'package:form_model/form_model.dart';
import 'package:form_model/src/model/form_model/form_model_status.dart';
import 'package:form_model/src/model/form_model/form_model.dart';
import 'package:form_model/src/validators/required_validator.dart';

void main() {
  group('FormModelCustom', () {
    test('initial value is null and status is pure by default', () {
      const formModel = NullableFormModel<int>();
      expect(formModel.value, isNull);
      expect(formModel.status, equals(FormModelStatus.pure));
      expect(formModel.validators, isEmpty);
    });

    test('reset returns new instance with pure status and optional new value',
        () {
      const formModel = FormModel<int>(1);
      final resetModel = formModel.reset(() => 2);
      expect(resetModel.value, equals(2));
      expect(resetModel.status, equals(FormModelStatus.pure));
    });

    test('setValue returns new instance with updated value', () {
      const formModel = FormModel<int>(1);
      final updatedModel = formModel.setValue(2);
      expect(updatedModel.value, equals(2));
    });

    test('validate marks the form as dirty and returns new instance', () {
      const formModel = FormModel<int>(2);
      final validatedModel = formModel.dirty();
      expect(validatedModel.status, equals(FormModelStatus.dirty));
    });

    test('addValidator returns new instance with added validator', () {
      const validator = RequiredValidator<int>();
      const formModel = FormModel<int>(
        0,
        validators: [
          validator,
        ],
      );
      final modelWithValidator = formModel.switchValidator(
        RequiredValidator<int>,
        active: true,
      );
      expect(modelWithValidator.filteredValidators, contains(validator));
    });

    // test('removeValidator returns new instance with removed validator', () {
    //   const validator = RequiredValidator<int>();
    //   const formModel = FormModel<int>(validators: [validator]);
    //   final modelWithoutValidator = formModel.removeValidator(validator);
    //   expect(modelWithoutValidator.validators, isNot(contains(validator)));
    // });

    // test('error returns validation error when dirty with validators', () {
    //   const formModel = FormModel<int>();
    //   final modelWithValidators =
    //       formModel.addValidator(const RequiredValidator());
    //   final dirtyModel = modelWithValidators.validate();
    //   expect(dirtyModel.error, isNotNull);
    // });

    // test('errorsList returns list of errors when dirty with validators', () {
    //   const formModel = RequiredFormModel<int>(11);
    //   final modelWithValidators = formModel
    //       .addValidator(const CustomEqualValidator<int>(equalValue: 2))
    //       .addValidator(CustomIntDivisibleBy5Validator());
    //   final dirtyModel = modelWithValidators.validate();
    //   expect(dirtyModel.errorsList, isNotEmpty);
    //   expect(dirtyModel.errorsList.length,
    //       2); // Assuming two validators have errors
    // });

    // test('isValid returns true when there are no validation errors', () {
    //   const formModel = FormModelCustom<int>(initialValue: 5);
    //   final modelWithValidators =
    //       formModel.addValidator(CustomIntDivisibleBy5Validator());
    //   expect(modelWithValidators.isValid, isTrue);
    // });

    // test('isValid returns false when there are validation errors', () {
    //   const formModel = FormModelCustom<int>(initialValue: 11);
    //   final modelWithValidators =
    //       formModel.addValidator(CustomIntDivisibleBy5Validator());
    //   final dirtyModel = modelWithValidators.validate();
    //   expect(dirtyModel.isValid, isFalse);
    // });

    // test('isDirty returns true when form is dirty', () {
    //   const formModel = FormModelCustom<int>(initialValue: 1);
    //   final dirtyModel = formModel.validate();
    //   expect(dirtyModel.isDirty, isTrue);
    // });

    // test('isDirty returns false when form is pure', () {
    //   const formModel = FormModelCustom<int>();
    //   expect(formModel.isDirty, isFalse);
    // });
  });
}

// class CustomIntDivisibleBy5Validator implements FormModelValidator<int> {
//   @override
//   FormModelError<int?>? validate(int? value) {
//     if (value != null) {
//       if (value < 5 || value % 5 > 0) {
//         return FormModelError(
//           code: ErrorCode.custom,
//           customErrorText: {'en': 'The number is not divisible by 5'},
//         );
//       }
//     }
//     return null;
//   }
// }
