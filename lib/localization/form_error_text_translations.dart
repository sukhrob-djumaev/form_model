import 'package:form_model/src/model/form_model_error.dart';

/// Interface for translating form validation defined error messages.
///
/// Implementations of this interface should provide functionality to translate
/// a [FormModelError] into a localized error message.
abstract class FormModelErrorTextTranslations {
  /// Translates the provided [error] into a localized error message.
  ///
  /// Returns a localized error message corresponding to the provided [error].
  String translate(FormModelError error);
}
