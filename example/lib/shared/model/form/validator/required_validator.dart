import 'package:form_model/form_model.dart';

final class RequiredValidator extends BaseRequiredValidator<String, String> {
  const RequiredValidator();

  @override
  String get error => 'Required field';
}
