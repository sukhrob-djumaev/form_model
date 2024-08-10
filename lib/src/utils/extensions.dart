import 'package:form_model/localization/form_model_localizations.dart';
import 'package:form_model/src/errors/form_error_key.dart';

extension FormErrorExtension on FormErrorKey {
  String? get translatedMessage => FormModelLocalizations().translateErrorKey(this);
}
