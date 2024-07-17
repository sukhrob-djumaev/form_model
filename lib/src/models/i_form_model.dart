import 'package:form_model/src/errors/form_error_key.dart';
import 'package:form_model/src/validators/validators.dart';

abstract interface class IFormModel<T extends Object> {
  T? get value;

  bool get isValid;

  bool get isDirty;

  FormErrorKey? get error;

  List<FormErrorKey> get errorsList;

  List<IFormModelValidator<T>> get validators;

  IFormModel addValidator(IFormModelValidator<T> validator);

  IFormModel removeValidator(IFormModelValidator<T> validator);

  IFormModel replaceValidator({
    required bool Function(IFormModelValidator<T> validator) predicate,
    required IFormModelValidator<T> newValidator,
  });

  IFormModel setValue(T? value);

  IFormModel validate();

  IFormModel reset();
}
