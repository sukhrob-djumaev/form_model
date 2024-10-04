import 'package:form_model/form_model.dart';

final class ConfirmPasswordValidator extends BaseMatchValidator<String> {
  const ConfirmPasswordValidator({
    super.valueGetter,
  });

  @override
  String get error => 'Password mismatch';
}
