import 'package:example/feature/register/logic/register_bloc/register_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => RegisterBloc()..add(const RegisterEvent.init()),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Register'),
          ),
          body: const _Form(),
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
            _PasswordInput(),
            SizedBox(
              height: 16,
            ),
            _ConfirmPasswordInput(),
            SizedBox(
              height: 16,
            ),
            _SubmitButton(),
          ],
        ),
      ),
    );
  }
}

class _PasswordInput extends StatelessWidget {
  const _PasswordInput({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return TextFormField(
          initialValue: state.password.value,
          decoration: InputDecoration(
            labelText: "Password",
            errorText: state.password.error?.code.name,
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
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return TextFormField(
          initialValue: state.confirmPassword.value,
          decoration: InputDecoration(
            labelText: "Confirm password",
            errorText: state.confirmPassword.error?.code.name,
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
    return ElevatedButton(
      onPressed: () =>
          context.read<RegisterBloc>().add(const RegisterEvent.submit()),
      child: const Text('Submit'),
    );
  }
}
