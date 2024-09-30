import 'package:collection/collection.dart';
import 'package:form_model/form_model.dart';

mixin FormMixin {
  List<IFormModel> get formProps;

  Object? dirtyForm();

  bool get isFormValid => formProps.every(
        (e) => e.isValid,
      );

  bool get readyToSubmit => formProps.none(
        (e) => e.status.isProcessing,
      );
}
