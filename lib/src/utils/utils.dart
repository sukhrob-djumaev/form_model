import 'package:form_model/src/models/i_form_model.dart';

bool areAllFormModelsValid(List<IFormModel> formModels) {
  return formModels.every((model) => model.isValid);
}
