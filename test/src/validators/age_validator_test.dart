import 'package:flutter_test/flutter_test.dart';
import 'package:form_model/form_model.dart';
import 'package:form_model/src/enums/error_code.dart';

void main() {
  group('AgeValidator', () {
    test('validate returns null when age is within range', () {
      // Arrange
      const validator = AgeValidator(minAge: 18, maxAge: 60);
      const validDate = '1990-01-01'; //

      // Act
      final error = validator.validate(validDate);

      // Assert
      expect(error, isNull);
    });

    test('validate returns error when age is below minAge', () {
      // Arrange
      const validator = AgeValidator(minAge: 18, maxAge: 60);
      const invalidDate = '2010-01-01';

      // Act
      final error = validator.validate(invalidDate);

      // Assert
      expect(error, isNotNull);
      expect(error!.code, ErrorCode.dateIsLessThanMinAge);
    });

    test('validate returns error when age is above maxAge', () {
      // Arrange
      const validator = AgeValidator(minAge: 18, maxAge: 60);
      const invalidDate = '1940-01-01'; // Replace with a date string representing an age above maxAge

      // Act
      final error = validator.validate(invalidDate);

      // Assert
      expect(error, isNotNull);
      expect(error!.code, ErrorCode.dateIsMoreThanMaxAge);
    });

    test('validate returns null when minAge and maxAge are null', () {
      // Arrange
      const validator = AgeValidator();

      // Act
      const validDate = '1990-01-01'; // Replace with a valid date string
      final error = validator.validate(validDate);

      // Assert
      expect(error, isNull);
    });

    test('validate returns null when value is null', () {
      // Arrange
      const validator = AgeValidator();

      // Act
      final error = validator.validate(null);

      // Assert
      expect(error, isNull);
    });
  });
}
