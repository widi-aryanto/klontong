import 'package:formz/formz.dart';

enum LengthError {
  empty,
  invalid
}

class Length extends FormzInput<int?, LengthError> {
  const Length.pure([int? value]) : super.pure(value);
  const Length.dirty([int? value]) : super.dirty(value);

  @override
  LengthError? validator(int? value) {
    if (value == null) {
      return LengthError.empty;
    }
    return value != 0
        ? null
        : LengthError.invalid;
  }
}

extension Explanation on LengthError {
  String? get name {
    switch(this) {
      case LengthError.invalid:
        return "Price can't be zero";
      default:
        return null;
    }
  }
}