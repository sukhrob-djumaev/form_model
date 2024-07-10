import 'package:form_model/localization/form_model_localizations.dart';
import 'package:form_model/src/models/form_error.dart';

/// Extension on the `FormError` class to provide additional functionality for localization.
///
/// The `FormErrorExtension` extension adds a method to the `FormError` class to get the localized
/// error message associated with the form error.
extension FormErrorExtension on FormError {
  /// Retrieves the localized error message for the current `FormError` instance.
  ///
  /// This method uses the `FormModelLocalizations` class to obtain a localized string that represents
  /// the error message for the given `FormError`. If no localized message is found, it returns `null`.
  ///
  /// Example usage:
  /// ```dart
  /// FormError<String> error = FormError(code: ErrorCode.required, value: "value");
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
