import 'package:formz/formz.dart';

enum DescriptionError {
  empty
}

class Description extends FormzInput<String, DescriptionError> {
  const Description.pure([String value = '']) : super.pure(value);
  const Description.dirty([String value = '']) : super.dirty(value);

  @override
  DescriptionError? validator(String value) {
    if (value.isNotEmpty == false) {
      return DescriptionError.empty;
    }
    return null;
  }
}