import 'package:flutter_test/flutter_test.dart';
import 'package:form_model/src/enums/error_code.dart';
import 'package:form_model/src/models/form_model_error.dart';
import 'package:form_model/src/validators/bool_true_validator.dart';

void main() {
  group('BoolTrueValidator', () {
    test('validate returns null when value is true', () {
      const validator = BoolTrueValidator();
      final result = validator.validate(true);
      expect(result, isNull);
    });

    test('validate returns FormModelError when value is false', () {
      const validator = BoolTrueValidator();
      final result = validator.validate(false);
      expect(result, isA<FormModelError<bool?>>());
      expect(result!.code, ErrorCode.boolShouldBeTrue);
    });

    test('validate returns FormModelError when value is null', () {
      const validator = BoolTrueValidator();
      final result = validator.validate(null);
      expect(result, isA<FormModelError<bool?>>());
      expect(result!.code, ErrorCode.boolShouldBeTrue);
    });
  });
}
