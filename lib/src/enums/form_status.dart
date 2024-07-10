/// Represents the status of a form field during the validation process.
///
/// The `FormStatus` enum defines the various states that a form field can be in. These states
/// help in tracking whether the field has been modified, whether it is currently valid, and
/// other relevant status information.
enum FormStatus {
  /// The form field is in its initial state and has not been modified.
  pure,

  /// The form field has been modified by the user.
  dirty,

  /// The form field has been validated and is currently valid.
  valid,
}
