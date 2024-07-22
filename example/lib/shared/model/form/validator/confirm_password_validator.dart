import 'package:form_model/form_model.dart';

final class ConfirmPasswordValidator
    extends BaseConfirmPasswordValidator<String> {
  const ConfirmPasswordValidator({
    super.passwordGetter,
  });

  @override
  String get error => 'Password mismatch';
}
