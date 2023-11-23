import 'package:formz/formz.dart';

enum CategoryError {
  empty
}

class Category extends FormzInput<String, CategoryError> {
  const Category.pure([String value = '']) : super.pure(value);
  const Category.dirty([String value = '']) : super.dirty(value);

  @override
  CategoryError? validator(String value) {
    if (value.isNotEmpty == false) {
      return CategoryError.empty;
    }
    return null;
  }
}