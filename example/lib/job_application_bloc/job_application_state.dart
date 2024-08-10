part of 'job_application_bloc.dart';

@freezed
class JobApplicationState with _$JobApplicationState {
  const factory JobApplicationState({
    @Default(StateStatus()) StateStatus status,
    @Default(FormModel<String>(validators: [RequiredValidator()])) FormModel<String> fullName,
    @Default(FormModel<String>(validators: [RequiredValidator(), EmailValidator()])) FormModel<String> email,
    @Default(FormModel<String>(validators: [RequiredValidator(), StringPhoneNumberValidator()]))
    FormModel<String> phone,
    @Default(FormModel<DateTime>(validators: [RequiredValidator<DateTime>()])) FormModel<DateTime> dateOfBirth,
    @Default(FormModel<String>(validators: [RequiredValidator(), StringUrlValidator()]))
    FormModel<String> linkedinProfile,
    @Default(FormModel<String>(validators: [
      RequiredValidator(),
      StringMinLengthValidator(minLength: 100),
      StringMaxLengthValidator(maxLength: 500)
    ]))
    FormModel<String> coverLetter,
    @Default(FormModel<List<String>>(validators: [RequiredValidator<List<String>>()])) FormModel<List<String>> skills,
    @Default(FormModel<String>(validators: [RequiredValidator()])) FormModel<String> expectedSalary,
    @Default(FormModel<DateTime>(validators: [RequiredValidator<DateTime>()])) FormModel<DateTime> availableFromDate,
    @Default(FormModel<bool>(validators: [BoolTrueValidator()])) FormModel<bool> termsAgreed,
    @Default(FormModel<String>(
        validators: [RequiredValidator(), StringCustomValidator(validator: _validateYearsOfExperience)]))
    FormModel<String> yearsOfExperience,
  }) = _JobApplicationState;
}

String? _validateYearsOfExperience(String? value) {
  if (value == null || value.isEmpty) {
    return 'Years of experience is required';
  }
  final years = int.tryParse(value);
  if (years == null) {
    return 'Please enter a valid number';
  }
  if (years < 0 || years > 50) {
    return 'Years of experience should be between 0 and 50';
  }
  return null;
}
