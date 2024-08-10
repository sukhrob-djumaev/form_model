import 'package:example/advanced_freezed_bloc_page.dart';
import 'package:flutter/material.dart';
import 'package:form_model/form_model.dart';

import 'advanced_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late FormModel<String> nameModel;
  late FormModel<String> emailModel;
  late FormModel<String> passwordModel;
  late FormModel<String> confirmPasswordModel;
  late FormModel<String> birthDateModel;
  late FormModel<bool> agreeToTermsModel;

  @override
  void initState() {
    super.initState();
    nameModel = const FormModel<String>(validators: [RequiredValidator()]);
    emailModel = const FormModel<String>(
        validators: [RequiredValidator(), EmailValidator()]);
    passwordModel = const FormModel<String>(validators: [
      RequiredValidator(),
      PasswordLengthValidator(minLength: 8),
      PasswordUppercaseValidator(),
      PasswordLowercaseValidator(),
      PasswordNumberValidator(),
      PasswordSpecialCharValidator(),
    ]);
    confirmPasswordModel = FormModel<String>(validators: [
      const RequiredValidator(),
      StringConfirmPasswordMatchValidator(matchingValue: passwordModel.value),
    ]);
    birthDateModel = const FormModel<String>(validators: [
      RequiredValidator(),
      DateTimeValidator(),
      StringDateTimeAgeMinValidator(minAge: 18),
    ]);
    agreeToTermsModel = const FormModel<bool>(
        validators: [BoolAgreeToTermsAndConditionsValidator()]);
  }

  void _submitForm() {
    setState(() {
      nameModel = nameModel.validate();
      emailModel = emailModel.validate();
      passwordModel = passwordModel.validate();
      confirmPasswordModel = confirmPasswordModel.validate();
      birthDateModel = birthDateModel.validate();
      agreeToTermsModel = agreeToTermsModel.validate();
    });

    if (nameModel.isValid &&
        emailModel.isValid &&
        passwordModel.isValid &&
        confirmPasswordModel.isValid &&
        birthDateModel.isValid &&
        agreeToTermsModel.isValid) {
      // All fields are valid, proceed with form submission
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Form submitted successfully!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Simple Form Example')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Name',
                errorText: nameModel.error?.translatedMessage,
              ),
              onChanged: (value) => setState(
                  () => nameModel = nameModel.setValue(value).validate()),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                errorText: emailModel.error?.translatedMessage,
              ),
              onChanged: (value) => setState(
                  () => emailModel = emailModel.setValue(value).validate()),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Password',
                errorText: passwordModel.error?.translatedMessage,
              ),
              obscureText: true,
              onChanged: (value) => setState(() {
                passwordModel = passwordModel.setValue(value).validate();
                // Update confirmPasswordModel to revalidate
                confirmPasswordModel = confirmPasswordModel
                    .replaceValidator(
                      predicate: (validator) =>
                          validator is StringConfirmPasswordMatchValidator,
                      newValidator: StringConfirmPasswordMatchValidator(
                          matchingValue: value),
                    )
                    .validate();
              }),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Confirm Password',
                errorText: confirmPasswordModel.error?.translatedMessage,
              ),
              obscureText: true,
              onChanged: (value) => setState(() => confirmPasswordModel =
                  confirmPasswordModel.setValue(value).validate()),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Birthdate (YYYY-MM-DD)',
                errorText: birthDateModel.error?.translatedMessage,
              ),
              onChanged: (value) => setState(() =>
                  birthDateModel = birthDateModel.setValue(value).validate()),
            ),
            const SizedBox(height: 16),
            CheckboxListTile(
              title: const Text('I agree to the terms and conditions'),
              value: agreeToTermsModel.value ?? false,
              onChanged: (value) => setState(() => agreeToTermsModel =
                  agreeToTermsModel.setValue(value).validate()),
            ),
            if (agreeToTermsModel.error != null)
              Text(
                agreeToTermsModel.error!.translatedMessage ?? '',
                style: TextStyle(color: Theme.of(context).colorScheme.error),
              ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _submitForm,
              child: const Text('Submit'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AdvancedPage()),
                );
              },
              child: const Text('Go to Advanced Example'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const JobApplicationForm()),
                );
              },
              child: const Text(
                'Go to Job Application Example with Bloc and Freezed',
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
