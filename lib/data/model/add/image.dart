import 'package:formz/formz.dart';

enum ImageError {
  empty
}

class Image extends FormzInput<String, ImageError> {
  const Image.pure([String value = '']) : super.pure(value);
  const Image.dirty([String value = '']) : super.dirty(value);

  @override
  ImageError? validator(String value) {
    if (value.isNotEmpty == false) {
      return ImageError.empty;
    }
    return null;
  }
}