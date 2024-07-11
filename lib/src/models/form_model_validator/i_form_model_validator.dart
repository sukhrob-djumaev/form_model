abstract interface class IFormModelValidator<T extends Object?, E> {
  /// Validates the given [value].
  ///
  /// This method should be implemented by concrete validators to provide specific
  /// validation logic. If the [value] is invalid, it should return a [FormModelError].
  /// If the [value] is valid, it should return `null`.
  ///
  /// - Parameter value: The value to be validated.
  /// - Returns: A [FormModelError] if the value is invalid, otherwise `null`.
  E? validate(T value);
}
