import 'package:form_model/src/enums/error_code.dart';
import 'package:form_model/src/models/form_error.dart';
import 'package:form_model/src/validators/base_form_model_validator.dart';

/// A validator class for ensuring the word count of a string value falls within specified limits.
///
/// This validator implements [BaseFormModelValidator] for values of type `String`.
/// It calculates the word count of the provided [value] and validates it against optional
/// [minWords] and [maxWords] constraints.
///
/// This validator is useful in form validation scenarios where a field should only accept
/// strings with a specific range of word counts.
///
/// It provides validation errors using [FormError] with [ErrorCode.wordCountIsLessThan] or
/// [ErrorCode.wordCountIsMoreThan] when the word count falls outside the specified range.
final class WordCountValidator implements BaseFormModelValidator<String?> {
  /// The minimum allowable word count.
  final int? minWords;

  /// The maximum allowable word count.
  final int? maxWords;

  /// Creates a [WordCountValidator] instance with optional [minWords] and [maxWords] constraints.
  const WordCountValidator({this.minWords, this.maxWords});

  /// Validates the word count of the provided [value].
  ///
  /// This method calculates the word count by splitting the trimmed [value] using whitespace
  /// characters as delimiters. It then compares the word count against [minWords] and [maxWords]
  /// constraints, if provided.
  ///
  /// - Parameter value: The string value to validate.
  /// - Returns: A [FormError] object with [ErrorCode.wordCountIsLessThan] or
  ///   [ErrorCode.wordCountIsMoreThan] if the validation fails (word count is out of bounds),
  ///   otherwise `null`.
  @override
  FormError<String?>? validate(String? value) {
    if (value != null && value.isNotEmpty) {
      final wordCount = value.trim().split(RegExp(r'\s+')).length;

      if (minWords != null && wordCount < minWords!) {
        return FormError(
          code: ErrorCode.wordCountIsLessThan,
          value: value,
          parameter: minWords,
        );
      }

      if (maxWords != null && wordCount > maxWords!) {
        return FormError(
          code: ErrorCode.wordCountIsMoreThan,
          value: value,
          parameter: maxWords,
        );
      }
    }
    return null;
  }
}
