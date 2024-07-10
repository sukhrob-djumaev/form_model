import 'package:flutter_test/flutter_test.dart';
import 'package:form_model/form_model.dart';
import 'package:form_model/src/enums/error_code.dart';
import 'package:form_model/src/models/form_error.dart';

void main() {
  group('BoolFalseValidator', () {
    test('validate returns null when value is false', () {
      const validator = BoolFalseValidator();
      final result = validator.validate(false);
      expect(result, isNull);
    });

    test('validate returns FormError when value is true', () {
      const validator = BoolFalseValidator();
      final result = validator.validate(true);
      expect(result, isA<FormError<bool?>>());
      expect(result!.code, ErrorCode.boolShouldBeFalse);
    });

    test('validate returns FormError when value is null', () {
      const validator = BoolFalseValidator();
      final result = validator.validate(null);
      expect(result, isA<FormError<bool?>>());
      expect(result!.code, ErrorCode.boolShouldBeFalse);
    });
  });
}
