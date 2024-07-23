import 'package:form_model/src/model/contract/i_form_model_validator.dart';

abstract base class BaseAgeValidator<E extends Object>
    implements IFormModelValidator<int, E> {
  const BaseAgeValidator({
    this.max,
    this.min,
  });

  final int? max;
  final int? min;

  @override
  E? validate(int value) {
    if (value < 0) {
      return negativeAgeError(value);
    }
    if (min != null && value < min!) {
      return minAgeError;
    }
    if (max != null && value > max!) {
      return maxAgeError;
    }
    return null;
  }

  E negativeAgeError(int value);
  E get maxAgeError;
  E get minAgeError;
}
