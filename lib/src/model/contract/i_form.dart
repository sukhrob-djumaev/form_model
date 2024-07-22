import 'package:form_model/src/model/contract/i_form_model.dart';

abstract interface class IForm {
  bool get isFormValid;

  bool get readyToSubmit;

  List<IFormModel> get formModels;

  Object? dirtyForm();
}
