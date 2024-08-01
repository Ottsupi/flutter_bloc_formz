part of 'login_form_bloc.dart';

sealed class LoginFormEvent extends Equatable {
  const LoginFormEvent();

  @override
  List<Object> get props => [];
}

final class UsernameChanged extends LoginFormEvent {
  const UsernameChanged(this.username);

  final String username;

  @override
  List<Object> get props => [username];
}

final class PasswordChanged extends LoginFormEvent {
  const PasswordChanged(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}

final class TogglePasswordVisibility extends LoginFormEvent {}

final class SubmitLoginForm extends LoginFormEvent {}
