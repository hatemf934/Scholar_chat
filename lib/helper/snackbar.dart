import 'package:flutter/material.dart';

void snackBar(BuildContext context, String word) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(word),
    ),
  );
}
