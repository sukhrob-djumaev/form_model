import 'package:form_model/src/model/form_model/i_form_model.dart';

abstract interface class IForm {
  bool get isFormValid;

  List<IFormModel> get formModels;

  Object dirtyForm();
}

mixin FormMixin implements IForm {
  @override
  bool get isFormValid => formModels.every(
        (e) => e.isValid,
      );
}
