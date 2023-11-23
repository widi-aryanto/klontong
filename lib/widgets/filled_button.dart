import 'package:flutter/material.dart';

class FilledButtonWidget extends StatelessWidget {
  final String? title;
  final double? width;
  final Function? onClick;
  const FilledButtonWidget({super.key, this.title, this.width, this.onClick});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        onClick?.call();
      },
      child: Container(
        width: width,
        padding: const EdgeInsets.fromLTRB(24.0, 10.0, 24.0, 10.0),
        decoration: BoxDecoration(
            color: Colors.deepPurple,
            borderRadius: BorderRadius.circular(100.0)
        ),
        child: Text(
          title.toString(),
          textAlign: TextAlign.center,
          style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500
          ),
        ),
      ),
    );
  }
}
