import 'package:form_model/src/model/contract/i_form_model_validator.dart';

abstract base class BaseRequiredValidator<T extends Object?, E extends Object>
    implements IFormModelValidator<T, E> {
  const BaseRequiredValidator();

  @override
  E? validate(T value) {
    if (value == null || (value is String && value.isEmpty)) {
      return error;
    }
    return null;
  }

  E get error;
}
