import 'package:formz/formz.dart';

enum SKUError {
  empty
}

class SKU extends FormzInput<String, SKUError> {
  const SKU.pure([String value = '']) : super.pure(value);
  const SKU.dirty([String value = '']) : super.dirty(value);

  @override
  SKUError? validator(String value) {
    if (value.isNotEmpty == false) {
      return SKUError.empty;
    }
    return null;
  }
}