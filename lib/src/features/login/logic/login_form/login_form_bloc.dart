import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_formz/src/core/form/models/password.dart';
import 'package:flutter_bloc_formz/src/core/form/models/username.dart';
import 'package:formz/formz.dart';

part 'login_form_event.dart';
part 'login_form_state.dart';

class LoginFormBloc extends Bloc<LoginFormEvent, LoginFormState> {
  LoginFormBloc() : super(LoginFormState()) {
    on<UsernameChanged>(_onUsernameChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<TogglePasswordVisibility>(_onTogglePasswordVisibility);
    on<SubmitLoginForm>(_onSubmitLoginForm);
  }

  void _onUsernameChanged(UsernameChanged event, Emitter<LoginFormState> emit) {
    final username = UsernameInput.dirty(event.username);
    final isValid = Formz.validate([
      username,
      state.password,
    ]);
    emit(state.copyWith(
      username: username,
      isValid: isValid,
      status: FormzSubmissionStatus.initial,
    ));
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<LoginFormState> emit) {
    final password = PasswordInput.dirty(event.password);
    final isValid = Formz.validate([
      state.username,
      password,
    ]);
    emit(state.copyWith(
      password: password,
      isValid: isValid,
      status: FormzSubmissionStatus.initial,
    ));
  }

  void _onTogglePasswordVisibility(
      TogglePasswordVisibility event, Emitter<LoginFormState> emit) {
    emit(state.copyWith(isPasswordHidden: !state.isPasswordHidden));
  }

  void _onSubmitLoginForm(
      SubmitLoginForm event, Emitter<LoginFormState> emit) async {
    // Emit dirty form to display errors
    final username = UsernameInput.dirty(state.username.value);
    final password = PasswordInput.dirty(state.password.value);
    emit(state.copyWith(
      username: username,
      password: password,
      isValid: Formz.validate([username, password]),
      status: FormzSubmissionStatus.initial,
    ));

    if (state.isValid) {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      await Future.delayed(const Duration(seconds: 5));
      emit(state.copyWith(status: FormzSubmissionStatus.success));
    }
  }
}
