import 'package:form_model/form_model.dart';

mixin FormMixin implements IForm {
  @override
  bool get isFormValid => formModels.every(
        (e) => e.isValid,
      );

  @override
  bool get readyToSubmit => formModels.every(
        (e) => !e.status.isProcessing,
      );
}
