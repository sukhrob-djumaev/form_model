/// Represents the status of a form model.
///
/// This enum is used to track whether the form model is in its initial state
/// or has been modified. It plays a crucial role in determining when validation
/// should occur and how the UI should respond to changes in the form.
///
/// The status helps in distinguishing between:
/// - Fields that haven't been interacted with by the user (pure)
/// - Fields that have been modified or touched by the user (dirty)
///
/// This distinction is useful for:
/// - Controlling when to show validation errors (often only when dirty)
/// - Tracking which fields have been changed for optimized API updates
/// - Resetting forms to their original state
///
/// Usage example:
/// ```dart
/// FormModel<String> emailField = FormModel(status: FormModelStatus.pure);
///
/// // After user interaction:
/// emailField = emailField.setValue('user@example.com');
/// if (emailField.status == FormModelStatus.dirty) {
///   // Perform validation or update UI
/// }
/// ```
enum FormModelStatus {
  /// Indicates that the form model is in its initial, unmodified state.
  ///
  /// A pure status typically means:
  /// - The field hasn't been touched by the user
  /// - No validation errors should be displayed yet
  /// - The value is in its original, default state
  pure,

  /// Indicates that the form model has been modified.
  ///
  /// A dirty status typically means:
  /// - The field has been interacted with or changed by the user
  /// - Validation can be performed and errors can be displayed
  /// - The current value may differ from the original, default state
  dirty,
}
