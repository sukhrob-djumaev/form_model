import 'package:form_model/src/errors/predefined_form_error_type.dart';

sealed class FormErrorKey {
  const FormErrorKey();
}

final class PredefinedFormErrorKey extends FormErrorKey {
  final PredefinedFormErrorType type;
  final Object? parameter;
  const PredefinedFormErrorKey(this.type, [this.parameter]);
}

final class CustomFormErrorKey extends FormErrorKey {
  final String key;
  const CustomFormErrorKey(this.key);
}
