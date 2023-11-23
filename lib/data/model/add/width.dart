import 'package:formz/formz.dart';

enum WidthError {
  empty,
  invalid
}

class Width extends FormzInput<int?, WidthError> {
  const Width.pure([int? value]) : super.pure(value);
  const Width.dirty([int? value]) : super.dirty(value);

  @override
  WidthError? validator(int? value) {
    if (value == null) {
      return WidthError.empty;
    }
    return value != 0
        ? null
        : WidthError.invalid;
  }
}

extension Explanation on WidthError {
  String? get name {
    switch(this) {
      case WidthError.invalid:
        return "Price can't be zero";
      default:
        return null;
    }
  }
}