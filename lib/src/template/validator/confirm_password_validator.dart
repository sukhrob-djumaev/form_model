import 'package:flutter/foundation.dart';
import 'package:form_model/form_model.dart';
import 'package:form_model/src/enums/error_code.dart';
import 'package:form_model/src/model/form_model_error.dart';

class ConfirmPasswordValidator implements FormModelValidator<String> {
  ConfirmPasswordValidator({
    required this.passwordGetter,
  });

  ValueGetter<String>? passwordGetter;

  @override
  FormModelError<String>? validate(String value) {
    final password = passwordGetter?.call();
    if (password != value) {
      return FormModelError(
        code: ErrorCode.boolAgreeToTerms,
      );
    }
    return null;
  }
}
