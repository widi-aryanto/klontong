import 'package:formz/formz.dart';

enum HeightError {
  empty,
  invalid
}

class Height extends FormzInput<int?, HeightError> {
  const Height.pure([int? value]) : super.pure(value);
  const Height.dirty([int? value]) : super.dirty(value);

  @override
  HeightError? validator(int? value) {
    if (value == null) {
      return HeightError.empty;
    }
    return value != 0
        ? null
        : HeightError.invalid;
  }
}

extension Explanation on HeightError {
  String? get name {
    switch(this) {
      case HeightError.invalid:
        return "Price can't be zero";
      default:
        return null;
    }
  }
}