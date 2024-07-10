import '../models/base_form_model.dart';

/// Checks if all form models in the provided list are valid.
///
/// Iterates through each form model in [formModels] and returns true if all
/// models have `isValid` set to true.
///
/// Returns true if all form models are valid, otherwise false.
bool areAllFormModelsValid(List<BaseFormModel> formModels) {
  for (var model in formModels) {
    if (!model.isValid) {
      return false;
    }
  }
  return true;
}
