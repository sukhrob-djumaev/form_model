import 'package:example/state_status/state_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'job_application_bloc/job_application_bloc.dart';
import 'package:form_model/form_model.dart';

class JobApplicationForm extends StatelessWidget {
  const JobApplicationForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => JobApplicationBloc(),
      child: Builder(builder: (context) {
        final bloc = context.read<JobApplicationBloc>();
        return BlocConsumer<JobApplicationBloc, JobApplicationState>(
          listener: (context, state) {
            if (state.status is SuccessStatus) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    content: Text('Application submitted successfully!')),
              );
            } else if (state.status is ErrorStatus) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: Text((state.status as ErrorStatus).message ??
                        'Something went wrong')),
              );
            }
          },
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                  title:
                      const Text('Job Application Form with Bloc and Freezed')),
              body: SingleChildScrollView(
                  child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Full Name',
                        errorText: state.fullName.error?.translatedMessage,
                      ),
                      onChanged: (value) =>
                          bloc.add(JobApplicationEvent.fullNameUpdated(value)),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        errorText: state.email.error?.translatedMessage,
                      ),
                      onChanged: (value) =>
                          bloc.add(JobApplicationEvent.emailUpdated(value)),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Phone',
                        errorText: state.phone.error?.translatedMessage,
                      ),
                      onChanged: (value) =>
                          bloc.add(JobApplicationEvent.phoneUpdated(value)),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Date of Birth',
                        errorText: state.dateOfBirth.error?.translatedMessage,
                      ),
                      readOnly: true,
                      controller: TextEditingController(
                        text:
                            state.dateOfBirth.value?.toString().split(' ')[0] ??
                                '',
                      ),
                      onTap: () async {
                        final date = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                        );
                        if (date != null) {
                          bloc.add(
                              JobApplicationEvent.dateOfBirthUpdated(date));
                        }
                      },
                    ),
                    TextFormField(
                        decoration: InputDecoration(
                          labelText: 'LinkedIn Profile',
                          errorText:
                              state.linkedinProfile.error?.translatedMessage,
                        ),
                        onChanged: (value) => bloc.add(
                            JobApplicationEvent.linkedinProfileUpdated(value))),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Cover Letter',
                        errorText: state.coverLetter.error?.translatedMessage,
                      ),
                      maxLines: 5,
                      onChanged: (value) => bloc
                          .add(JobApplicationEvent.coverLetterUpdated(value)),
                    ),
                    const Text('Skills'),
                    Wrap(
                      spacing: 8.0,
                      children: (state.skills.value ?? [])
                          .map((skill) => Chip(
                                label: Text(skill),
                                onDeleted: () => bloc.add(
                                    JobApplicationEvent.skillRemoved(skill)),
                              ))
                          .toList(),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Add Skill',
                      ),
                      onFieldSubmitted: (value) {
                        bloc.add(JobApplicationEvent.skillAdded(value));
                        // Clear the text field after adding the skill
                        (context as Element).markNeedsBuild();
                      },
                    ),
                    if (state.skills.error != null)
                      Text(
                        state.skills.error!.translatedMessage ?? '',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.error),
                      ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Expected Salary',
                        errorText:
                            state.expectedSalary.error?.translatedMessage,
                      ),
                      onChanged: (value) => bloc.add(
                          JobApplicationEvent.expectedSalaryUpdated(value)),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Available From',
                        errorText:
                            state.availableFromDate.error?.translatedMessage,
                      ),
                      readOnly: true,
                      controller: TextEditingController(
                        text: state.availableFromDate.value
                                ?.toString()
                                .split(' ')[0] ??
                            '',
                      ),
                      onTap: () async {
                        final date = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate:
                              DateTime.now().add(const Duration(days: 365)),
                        );
                        if (date != null) {
                          bloc.add(JobApplicationEvent.availableFromDateUpdated(
                              date));
                        }
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Years of Experience',
                        errorText:
                            state.yearsOfExperience.error?.translatedMessage,
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (value) => bloc.add(
                          JobApplicationEvent.yearsOfExperienceUpdated(value)),
                    ),
                    CheckboxListTile(
                      title: const Text('I agree to the terms and conditions'),
                      value: state.termsAgreed.value ?? false,
                      onChanged: (value) => bloc.add(
                          JobApplicationEvent.termsAgreedUpdated(
                              value ?? false)),
                    ),
                    if (state.termsAgreed.error != null)
                      Text(
                        state.termsAgreed.error!.translatedMessage ?? '',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.error),
                      ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: state.status is LoadingStatus
                          ? null
                          : () => bloc
                              .add(const JobApplicationEvent.formSubmitted()),
                      child: state.status is LoadingStatus
                          ? const CircularProgressIndicator()
                          : const Text('Submit Application'),
                    ),
                  ],
                ),
              )),
            );
          },
        );
      }),
    );
  }
}
