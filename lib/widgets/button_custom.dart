import 'package:chatsapp/core/color_value_manager.dart';
import 'package:chatsapp/core/size_value_manager.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ButtonCustom extends StatelessWidget {
  ButtonCustom({super.key, required this.textbuttom, this.onpressed});
  final String textbuttom;
  VoidCallback? onpressed;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      minWidth: double.infinity,
      height: WidthAndHighValue.hV55,
      textColor: ColorValueManager.kBlackColor,
      color: ColorValueManager.kWhiteColor,
      onPressed: onpressed,
      child: Text(
        textbuttom,
        style: const TextStyle(
          fontSize: FontSizeValueManager.fontZV20,
        ),
      ),
    );
  }
}
