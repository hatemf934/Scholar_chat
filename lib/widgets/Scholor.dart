import 'package:chatsapp/core/size_value_manager.dart';
import 'package:chatsapp/core/text_value_manager.dart';
import 'package:flutter/material.dart';

class ScholarChat extends StatelessWidget {
  const ScholarChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          TextValueManager.kLogo,
          width: WidthAndHighValue.wV100,
        ),
        TextValueManager.kPrimaryText,
      ],
    );
  }
}
