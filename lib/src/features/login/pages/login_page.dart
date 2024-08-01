import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LoginScreen();
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
            LoginButton(),
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
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Username',
        prefixIcon: Icon(Icons.person),
      ),
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      onChanged: (value) {},
    );
  }
}

class PasswordField extends StatelessWidget {
  const PasswordField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    togglePasswordVisibility() {}

    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Password',
        prefixIcon: Icon(Icons.key),
        suffixIcon: IconButton(
            onPressed: togglePasswordVisibility, icon: Icon(Icons.visibility)),
      ),
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.done,
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      onChanged: (value) {},
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextButton(
            onPressed: () {},
            child: Text('Login'),
          ),
        ),
      ],
    );
  }
}
