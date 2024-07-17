import 'package:flutter_test/flutter_test.dart';
import 'package:form_model/src/enums/error_code.dart';
import 'package:form_model/src/model/form_model_error.dart';
import 'package:form_model/src/validators/bool_false_validator.dart';

void main() {
  group('BoolFalseValidator', () {
    test('validate returns null when value is false', () {
      const validator = BoolFalseValidator();
      final result = validator.validate(false);
      expect(result, isNull);
    });

    test('validate returns FormModelError when value is true', () {
      const validator = BoolFalseValidator();
      final result = validator.validate(true);
      expect(result, isA<FormModelError<bool?>>());
      expect(result!.code, ErrorCode.boolShouldBeFalse);
    });

    test('validate returns FormModelError when value is null', () {
      const validator = BoolFalseValidator();
      final result = validator.validate(null);
      expect(result, isA<FormModelError<bool?>>());
      expect(result!.code, ErrorCode.boolShouldBeFalse);
    });
  });
}
