import 'package:example/state_status/state_status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_model/form_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'job_application_event.dart';
part 'job_application_state.dart';
part 'job_application_bloc.freezed.dart';

class JobApplicationBloc extends Bloc<JobApplicationEvent, JobApplicationState> {
  JobApplicationBloc() : super(const JobApplicationState()) {
    on<_FullNameUpdated>(_onFullNameUpdated);
    on<_EmailUpdated>(_onEmailUpdated);
    on<_PhoneUpdated>(_onPhoneUpdated);
    on<_DateOfBirthUpdated>(_onDateOfBirthUpdated);
    on<_LinkedinProfileUpdated>(_onLinkedinProfileUpdated);
    on<_CoverLetterUpdated>(_onCoverLetterUpdated);
    on<_SkillAdded>(_onSkillAdded);
    on<_SkillRemoved>(_onSkillRemoved);
    on<_ExpectedSalaryUpdated>(_onExpectedSalaryUpdated);
    on<_AvailableFromDateUpdated>(_onAvailableFromDateUpdated);
    on<_YearsOfExperienceUpdated>(_onYearsOfExperienceUpdated);
    on<_TermsAgreedUpdated>(_onTermsAgreedUpdated);
    on<_FormSubmitted>(_onFormSubmitted);
  }

  void _onFullNameUpdated(_FullNameUpdated event, Emitter<JobApplicationState> emit) {
    emit(state.copyWith(fullName: state.fullName.setValue(event.value)));
  }

  void _onEmailUpdated(_EmailUpdated event, Emitter<JobApplicationState> emit) {
    emit(state.copyWith(email: state.email.setValue(event.value)));
  }

  void _onPhoneUpdated(_PhoneUpdated event, Emitter<JobApplicationState> emit) {
    emit(state.copyWith(phone: state.phone.setValue(event.value)));
  }

  void _onDateOfBirthUpdated(_DateOfBirthUpdated event, Emitter<JobApplicationState> emit) {
    emit(state.copyWith(dateOfBirth: state.dateOfBirth.setValue(event.value)));
  }

  void _onLinkedinProfileUpdated(_LinkedinProfileUpdated event, Emitter<JobApplicationState> emit) {
    emit(state.copyWith(linkedinProfile: state.linkedinProfile.setValue(event.value)));
  }

  void _onCoverLetterUpdated(_CoverLetterUpdated event, Emitter<JobApplicationState> emit) {
    emit(state.copyWith(coverLetter: state.coverLetter.setValue(event.value)));
  }

  void _onSkillAdded(_SkillAdded event, Emitter<JobApplicationState> emit) {
    final updatedSkills = List<String>.from(state.skills.value ?? [])..add(event.skill);
    emit(state.copyWith(skills: state.skills.setValue(updatedSkills)));
  }

  void _onSkillRemoved(_SkillRemoved event, Emitter<JobApplicationState> emit) {
    final updatedSkills = List<String>.from(state.skills.value ?? [])..remove(event.skill);
    emit(state.copyWith(skills: state.skills.setValue(updatedSkills)));
  }

  void _onExpectedSalaryUpdated(_ExpectedSalaryUpdated event, Emitter<JobApplicationState> emit) {
    emit(state.copyWith(expectedSalary: state.expectedSalary.setValue(event.value)));
  }

  void _onAvailableFromDateUpdated(_AvailableFromDateUpdated event, Emitter<JobApplicationState> emit) {
    emit(state.copyWith(availableFromDate: state.availableFromDate.setValue(event.value)));
  }

  void _onYearsOfExperienceUpdated(_YearsOfExperienceUpdated event, Emitter<JobApplicationState> emit) {
    emit(state.copyWith(yearsOfExperience: state.yearsOfExperience.setValue(event.value)));
  }

  void _onTermsAgreedUpdated(_TermsAgreedUpdated event, Emitter<JobApplicationState> emit) {
    emit(state.copyWith(termsAgreed: state.termsAgreed.setValue(event.value)));
  }

  void _onFormSubmitted(_FormSubmitted event, Emitter<JobApplicationState> emit) {
    emit(state.copyWith(status: const StateStatus.loading()));

    emit(state.copyWith(
      fullName: state.fullName.validate(),
      email: state.email.validate(),
      phone: state.phone.validate(),
      dateOfBirth: state.dateOfBirth.validate(),
      linkedinProfile: state.linkedinProfile.validate(),
      coverLetter: state.coverLetter.validate(),
      skills: state.skills.validate(),
      expectedSalary: state.expectedSalary.validate(),
      availableFromDate: state.availableFromDate.validate(),
      termsAgreed: state.termsAgreed.validate(),
    ));
    final isValid = areAllFormModelsValid([
      state.fullName.validate(),
      state.email.validate(),
      state.phone.validate(),
      state.dateOfBirth.validate(),
      state.linkedinProfile.validate(),
      state.coverLetter.validate(),
      state.skills.validate(),
      state.expectedSalary.validate(),
      state.availableFromDate.validate(),
      state.termsAgreed.validate(),
    ]);

    if (isValid) {
      // Perform job application submission logic here
      emit(state.copyWith(status: const StateStatus.success()));
    } else {
      emit(state.copyWith(status: const StateStatus.error('Please fill all fields correctly')));
    }
    emit(state.copyWith(status: const StateStatus()));
  }
}
