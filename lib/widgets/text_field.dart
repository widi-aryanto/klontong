import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String? initial;
  final String? label;
  final String? helper;
  final TextInputType? inputType;
  final TextInputAction? inputAction;
  final IconButton? suffixIcon;
  final Icon? prefixIcon;
  final bool? secureText;
  final int? maxLines;
  final Function? onChanged;
  const TextFieldWidget({super.key, this.initial, this.label, this.helper,
    this.onChanged, this.inputType, this.prefixIcon, this.suffixIcon,
    this.secureText, this.inputAction, this.maxLines});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initial,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4.0))
        ),
        labelText: label.toString(),
        labelStyle: const TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w400,
        ),
        helperText: helper,
        helperStyle: const TextStyle(
          fontSize: 11.0,
          fontWeight: FontWeight.w400,
        ),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        alignLabelWithHint: true,
      ),
      keyboardType: inputType,
      onChanged: (value) {
        onChanged?.call(value);
      },
      maxLines: maxLines ?? 1,
      textInputAction: inputAction,
      obscureText: secureText ?? false,
    );
  }
}
