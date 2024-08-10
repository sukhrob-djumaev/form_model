part of 'job_application_bloc.dart';

@freezed
class JobApplicationEvent with _$JobApplicationEvent {
  const factory JobApplicationEvent.fullNameUpdated(String value) =
      _FullNameUpdated;
  const factory JobApplicationEvent.emailUpdated(String value) = _EmailUpdated;
  const factory JobApplicationEvent.phoneUpdated(String value) = _PhoneUpdated;
  const factory JobApplicationEvent.dateOfBirthUpdated(DateTime value) =
      _DateOfBirthUpdated;
  const factory JobApplicationEvent.linkedinProfileUpdated(String value) =
      _LinkedinProfileUpdated;
  const factory JobApplicationEvent.coverLetterUpdated(String value) =
      _CoverLetterUpdated;
  const factory JobApplicationEvent.skillAdded(String skill) = _SkillAdded;
  const factory JobApplicationEvent.skillRemoved(String skill) = _SkillRemoved;
  const factory JobApplicationEvent.expectedSalaryUpdated(String value) =
      _ExpectedSalaryUpdated;
  const factory JobApplicationEvent.availableFromDateUpdated(DateTime value) =
      _AvailableFromDateUpdated;
  const factory JobApplicationEvent.yearsOfExperienceUpdated(String value) =
      _YearsOfExperienceUpdated;
  const factory JobApplicationEvent.termsAgreedUpdated(bool value) =
      _TermsAgreedUpdated;
  const factory JobApplicationEvent.formSubmitted() = _FormSubmitted;
}
