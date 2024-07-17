import 'package:form_model/src/model/form_model_error.dart';
import 'package:form_model/src/model/form_model_validator/i_form_model_validator.dart';

/// An abstract interface class representing a base validator for form models.
///
/// This interface defines a contract for implementing validators that can validate
/// values of type `T` and return a [FormModelError] if the value is invalid. Concrete
/// implementations should provide specific validation logic.
abstract interface class FormModelValidator<T>
    implements IFormModelValidator<T, FormModelError<T>> {}
