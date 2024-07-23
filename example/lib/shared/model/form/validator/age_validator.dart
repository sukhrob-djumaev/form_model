import 'package:form_model/form_model.dart';

final class AgeValidator extends BaseAgeValidator<String> {
  const AgeValidator({
    super.max,
    super.min,
  });

  @override
  String get maxAgeError => 'Age must be no more than $max years old.';

  @override
  String get minAgeError => 'Age must be at least $min years old.';

  @override
  String negativeAgeError(int value) =>
      'Invalid age: $value, Age cannot be negative.';
}
