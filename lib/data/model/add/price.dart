import 'package:formz/formz.dart';

enum PriceError {
  empty,
  invalid
}

class Price extends FormzInput<int?, PriceError> {
  const Price.pure([int? value]) : super.pure(value);
  const Price.dirty([int? value]) : super.dirty(value);

  @override
  PriceError? validator(int? value) {
    if (value == null) {
      return PriceError.empty;
    }
    return value != 0
        ? null
        : PriceError.invalid;
  }
}

extension Explanation on PriceError {
  String? get name {
    switch(this) {
      case PriceError.invalid:
        return "Price can't be zero";
      default:
        return null;
    }
  }
}