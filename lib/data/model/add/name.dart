import 'package:formz/formz.dart';

enum NameError {
  empty
}

class Name extends FormzInput<String, NameError> {
  const Name.pure([String value = '']) : super.pure(value);
  const Name.dirty([String value = '']) : super.dirty(value);

  @override
  NameError? validator(String value) {
    if (value.isNotEmpty == false) {
      return NameError.empty;
    }
    return null;
  }
}