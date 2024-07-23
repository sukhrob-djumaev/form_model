import 'package:form_model/form_model.dart';

mixin FormMixin {
  List<IFormModel> get formProps;

  Object? dirtyForm();

  bool get isFormValid => formProps.every(
        (e) => e.isValid,
      );

  bool get readyToSubmit => formProps.every(
        (e) => !e.status.isProcessing,
      );
}
