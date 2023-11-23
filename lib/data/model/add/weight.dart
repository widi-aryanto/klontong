import 'package:formz/formz.dart';

enum WeightError {
  empty,
  invalid
}

class Weight extends FormzInput<int?, WeightError> {
  const Weight.pure([int? value]) : super.pure(value);
  const Weight.dirty([int? value]) : super.dirty(value);

  @override
  WeightError? validator(int? value) {
    if (value == null) {
      return WeightError.empty;
    }
    return value != 0
        ? null
        : WeightError.invalid;
  }
}

extension Explanation on WeightError {
  String? get name {
    switch(this) {
      case WeightError.invalid:
        return "Price can't be zero";
      default:
        return null;
    }
  }
}