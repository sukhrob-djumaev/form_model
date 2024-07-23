import 'package:flutter_test/flutter_test.dart';
import 'package:form_model/form_model.dart';

final class _RequiredValidator extends BaseRequiredValidator<String, String> {
  @override
  String get error => 'Required field';
}

final class _ConfirmPasswordValidator
    extends BaseConfirmPasswordValidator<String> {
  @override
  String get error => 'Password mismatch';
}

void main() {
  group('FormModel equality:', () {
    test('same props', () {
      const m1 = FormModel<String, String>('');
      const m2 = FormModel<String, String>('');

      expect(m1 == m2, isTrue);
    });

    test('different value', () {
      const m1 = FormModel<String, String>('');
      const m2 = FormModel<String, String>('1');

      expect(m1 == m2, isFalse);
    });

    test('different status', () {
      const m1 = FormModel<String, String>('');
      const m2 = FormModel<String, String>(
        '',
        status: FormModelStatus.edited(),
      );

      expect(m1 == m2, isFalse);
    });

    test('different validators', () {
      const m1 = FormModel<String, String>('');
      final m2 = FormModel<String, String>(
        '',
        validators: [
          _RequiredValidator(),
        ],
      );

      expect(m1 == m2, isFalse);
    });

    test('different restrictedValidators', () {
      const m1 = FormModel<String, String>(
        '',
      );
      const m2 = FormModel<String, String>(
        '',
        restrictedValidators: {_RequiredValidator},
      );

      expect(m1 == m2, isFalse);
    });

    test('same restrictedValidators', () {
      const m1 = FormModel<String, String>(
        '',
        restrictedValidators: {_RequiredValidator},
      );
      const m2 = FormModel<String, String>(
        '',
        restrictedValidators: {_RequiredValidator},
      );

      expect(m1 == m2, isTrue);
    });

    test('same restrictedValidators different order', () {
      const m1 = FormModel<String, String>(
        '',
        restrictedValidators: {_RequiredValidator, _ConfirmPasswordValidator},
      );
      const m2 = FormModel<String, String>(
        '',
        restrictedValidators: {_ConfirmPasswordValidator, _RequiredValidator},
      );

      expect(m1 == m2, isTrue);
    });
  });
}
