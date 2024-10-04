abstract base class AppException implements Exception {
  AppException([this.message]);

  final String? message;

  @override
  String toString() {
    final message = this.message;
    if (message == null) return "AppException";
    return message;
  }
}

sealed class ApiException extends AppException {
  ApiException([super.message]);
}

final class BadResponseException extends ApiException {
  BadResponseException(
    super.message, {
    this.errors = const {},
  });

  final Map<String, dynamic> errors;
}

extension BadResponseExceptionX on BadResponseException {
  String? fieldError(
    String field, {
    String separator = ', ',
  }) {
    final rv = hasField(field) ? _parseField(errors[field], separator) : null;

    return rv;
  }

  bool hasField(String field) => errors.containsKey(field);

  bool hasAnyField(Set<String> fields) => fields.any(hasField);

  String _parseField(dynamic error, String separator) {
    if (error is List<dynamic>) {
      return error.map((e) => e.toString()).join(separator);
    }
    if (error is List<String>) {
      return error.join(separator);
    }
    if (error is String) {
      return error;
    }

    return error.toString();
  }

  String? fieldsErrors(
    Set<String> fields, {
    String separator = '; ',
  }) {
    final fieldErrors = fields.map((e) => fieldError(e)).nonNulls;

    return fieldErrors.isEmpty ? null : fieldErrors.join(separator);
  }
}
