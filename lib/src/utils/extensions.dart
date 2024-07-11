import 'package:form_model/localization/form_model_localizations.dart';
import 'package:form_model/src/models/form_model_error.dart';

/// Extension on the `FormModelError` class to provide additional functionality for localization.
///
/// The `FormModelErrorExtension` extension adds a method to the `FormModelError` class to get the localized
/// error message associated with the form error.
extension FormModelErrorExtension on FormModelError {
  /// Retrieves the localized error message for the current `FormModelError` instance.
  ///
  /// This method uses the `FormModelLocalizations` class to obtain a localized string that represents
  /// the error message for the given `FormModelError`. If no localized message is found, it returns `null`.
  ///
  /// Example usage:
  /// ```dart
  /// FormModelError<String> error = FormModelError(code: ErrorCode.required, value: "value");
  /// String? localizedMessage = error.textLocalized();
  /// print(localizedMessage); // Output: "This field is required."
  /// ```
  ///
  /// Returns:
  ///   A `String` containing the localized error message if available, otherwise `null`.
  String? textLocalized() {
    return FormModelLocalizations().getErrorMessage(this);
  }
}
