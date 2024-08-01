import 'package:formz/formz.dart';

enum UsernameValidationError { empty }

extension UsernameValidationErrorDetail on UsernameValidationError {
  String text() {
    switch (this) {
      case UsernameValidationError.empty:
        return 'Username cannot be empty';
    }
  }
}

class UsernameInput extends FormzInput<String, UsernameValidationError> {
  const UsernameInput.pure([super.value = '']) : super.pure();
  const UsernameInput.dirty([super.value = '']) : super.dirty();

  @override
  UsernameValidationError? validator(String value) {
    if (value.isEmpty) {
      return UsernameValidationError.empty;
    }
    return null;
  }
}
