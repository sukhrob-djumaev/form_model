import 'package:form_model/src/models/form_error.dart';

/// Interface for translating form validation defined error messages.
///
/// Implementations of this interface should provide functionality to translate
/// a [FormError] into a localized error message.
abstract class FormErrorTextTranslations {
  /// Translates the provided [error] into a localized error message.
  ///
  /// Returns a localized error message corresponding to the provided [error].
  String translate(FormError error);
}
