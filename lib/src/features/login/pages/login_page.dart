import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_formz/src/core/form/form_models.dart';
import 'package:flutter_bloc_formz/src/features/login/logic/login_form.dart';
import 'package:formz/formz.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginFormBloc(),
      child: LoginScreen(),
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LoginForm(),
          ],
        ),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Form(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            UsernameField(),
            PasswordField(),
            SizedBox(height: 16),
            LoginButtonBuilder(),
          ],
        ),
      ),
    );
  }
}

class UsernameField extends StatelessWidget {
  const UsernameField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginFormBloc, LoginFormState>(
      builder: (context, state) {
        return TextFormField(
          decoration: InputDecoration(
            labelText: 'Username',
            prefixIcon: Icon(Icons.person),
            errorText: state.username.displayError?.text(),
          ),
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          onTapOutside: (event) => FocusScope.of(context).unfocus(),
          onChanged: (value) {
            BlocProvider.of<LoginFormBloc>(context).add(UsernameChanged(value));
          },
        );
      },
    );
  }
}

class PasswordField extends StatelessWidget {
  const PasswordField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    togglePasswordVisibility() {
      BlocProvider.of<LoginFormBloc>(context).add(TogglePasswordVisibility());
    }

    return BlocBuilder<LoginFormBloc, LoginFormState>(
      builder: (context, state) {
        return TextFormField(
          decoration: InputDecoration(
            labelText: 'Password',
            prefixIcon: Icon(Icons.key),
            suffixIcon: IconButton(
              onPressed: togglePasswordVisibility,
              icon: state.isPasswordHidden
                  ? Icon(Icons.visibility)
                  : Icon(Icons.visibility_off),
            ),
            errorText: state.password.displayError?.text(),
          ),
          keyboardType: TextInputType.visiblePassword,
          textInputAction: TextInputAction.done,
          obscureText: state.isPasswordHidden,
          onTapOutside: (event) => FocusScope.of(context).unfocus(),
          onChanged: (value) {
            BlocProvider.of<LoginFormBloc>(context).add(PasswordChanged(value));
          },
        );
      },
    );
  }
}

class LoginButtonBuilder extends StatelessWidget {
  const LoginButtonBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginFormBloc, LoginFormState>(
      builder: (context, state) {
        if (state.status == FormzSubmissionStatus.inProgress) {
          return LoginLoading();
        }
        return LoginButton();
      },
    );
  }
}

class LoginLoading extends StatelessWidget {
  const LoginLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircularProgressIndicator(),
      ],
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    submitLoginForm() {
      BlocProvider.of<LoginFormBloc>(context).add(SubmitLoginForm());
    }

    return Row(
      children: [
        Expanded(
          child: TextButton(
            onPressed: submitLoginForm,
            child: Text('Login'),
          ),
        ),
      ],
    );
  }
}
