part of 'login_form_bloc.dart';

final class LoginFormState extends Equatable {
  const LoginFormState({
    this.username = const UsernameInput.pure(),
    this.password = const PasswordInput.pure(),
    this.isValid = false,
    this.status = FormzSubmissionStatus.initial,
    this.isPasswordHidden = false,
  });

  final UsernameInput username;
  final PasswordInput password;
  final bool isValid;
  final FormzSubmissionStatus status;
  final bool isPasswordHidden;

  LoginFormState copyWith({
    UsernameInput? username,
    PasswordInput? password,
    bool? isValid,
    FormzSubmissionStatus? status,
    bool? isPasswordHidden,
  }) {
    return LoginFormState(
      username: username ?? this.username,
      password: password ?? this.password,
      isValid: isValid ?? this.isValid,
      status: status ?? this.status,
      isPasswordHidden: isPasswordHidden ?? this.isPasswordHidden,
    );
  }

  @override
  List<Object> get props => [
        username,
        password,
        isValid,
        status,
        isPasswordHidden,
      ];
}
