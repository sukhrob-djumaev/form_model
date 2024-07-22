import 'package:form_model/src/enums/error_code.dart';
import 'package:form_model/src/model/form_model_error.dart';
import 'package:form_model/src/model/form_model_validator/form_model_validator.dart';

final class RequiredValidator<T extends Object?>
    implements FormModelValidator<T> {
  const RequiredValidator();

  @override
  FormModelError<T>? validate(T value) {
    if (value == null || (value is String && value.isEmpty)) {
      return FormModelError(
        code: ErrorCode.required,
      );
    }
    return null;
  }
}
