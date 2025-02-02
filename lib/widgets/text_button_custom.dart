import 'package:flutter/material.dart';

class TextButtonCustom extends StatelessWidget {
  const TextButtonCustom(
      {super.key, required this.textbutton, required this.onpressed});
  final String textbutton;
  final VoidCallback onpressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onpressed,
        child: Text(
          // style: const TextStyle(color: Color.fromARGB(255, 145, 228, 214)),
          textbutton,
        ));
  }
}
