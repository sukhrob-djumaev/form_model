import 'package:example/feature/register/logic/register_bloc/register_bloc.dart';
import 'package:example/feature/register/source/user_repository.dart';
import 'package:example/shared/model/form/form_input.dart';
import 'package:example/shared/widget/input/app_input_decoration.dart';
import 'package:example/shared/widget/input/app_text_form_field.dart';
import 'package:example/shared/widget/loading/app_circular_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) => RepositoryProvider<IUserRepository>(
        create: (context) => UserRepository(),
        child: BlocProvider(
          create: (context) => RegisterBloc(
            repository: context.read(),
          )..add(const RegisterEvent.init()),
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Register'),
            ),
            body: const _Form(),
          ),
        ),
      );
}

class _Form extends StatelessWidget {
  const _Form({super.key});

  @override
  Widget build(BuildContext context) {
    return const Form(
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            _NameInput(),
            SizedBox(height: 16),
            _UsernameInput(),
            SizedBox(height: 16),
            _PasswordInput(),
            SizedBox(height: 16),
            _ConfirmPasswordInput(),
            SizedBox(height: 16),
            _SubmitButton(),
          ],
        ),
      ),
    );
  }
}

class _NameInput extends StatelessWidget {
  const _NameInput({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<RegisterBloc, RegisterState, NullableFormInput<String>>(
      selector: (state) => state.name,
      builder: (context, name) {
        return AppTextFormField(
          value: name.value,
          enabled: name.status.isEnabled,
          decoration: AppInputDecoration(
            labelText: "Name",
            errorText: name.error,
            suffixIcon:
                name.status.isProcessing ? const AppCircularLoading() : null,
          ),
          onChanged: (value) =>
              context.read<RegisterBloc>().add(RegisterEvent.setName(value)),
        );
      },
    );
  }
}

class _UsernameInput extends StatelessWidget {
  const _UsernameInput({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<RegisterBloc, RegisterState, FormInput<String>>(
      selector: (state) => state.username,
      builder: (context, username) {
        return AppTextFormField(
          value: username.value,
          enabled: username.status.isEnabled,
          decoration: AppInputDecoration(
            labelText: "Username",
            errorText: username.error,
            suffixIcon: username.status.isProcessing
                ? const AppCircularLoading()
                : null,
          ),
          onChanged: (value) => context
              .read<RegisterBloc>()
              .add(RegisterEvent.setUsername(value)),
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  const _PasswordInput({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<RegisterBloc, RegisterState, FormInput<String>>(
      selector: (state) => state.password,
      builder: (context, password) {
        return TextFormField(
          initialValue: password.value,
          decoration: AppInputDecoration(
            labelText: "Password",
            errorText: password.error,
          ),
          onChanged: (value) => context
              .read<RegisterBloc>()
              .add(RegisterEvent.setPassword(value)),
        );
      },
    );
  }
}

class _ConfirmPasswordInput extends StatelessWidget {
  const _ConfirmPasswordInput({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<RegisterBloc, RegisterState, FormInput<String>>(
      selector: (state) => state.confirmPassword,
      builder: (context, confirmPassword) {
        return TextFormField(
          initialValue: confirmPassword.value,
          decoration: AppInputDecoration(
            labelText: "Confirm password",
            errorText: confirmPassword.error,
          ),
          onChanged: (value) => context
              .read<RegisterBloc>()
              .add(RegisterEvent.setConfirmPassword(value)),
        );
      },
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) => ElevatedButton(
        onPressed: state.readyToSubmit
            ? () =>
                context.read<RegisterBloc>().add(const RegisterEvent.submit())
            : null,
        child: const Text('Submit'),
      ),
    );
  }
}
