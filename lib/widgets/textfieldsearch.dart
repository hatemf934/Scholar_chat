import 'package:flutter/material.dart';

class TextFieldSearch extends StatelessWidget {
  const TextFieldSearch({
    super.key,
    required this.onSend,
    required this.controller,
    this.onButtonPressed,
  });
  final Function(String)? onSend;
  final TextEditingController controller;
  final Function(String)? onButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20),
        child: TextField(
            cursorColor: Theme.of(context).primaryColor,
            controller: controller,
            onSubmitted: onSend,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                  onPressed: () {
                    if (onButtonPressed != null) {
                      onButtonPressed!(controller.text);
                    }
                  },
                  icon:
                      Icon(Icons.send, color: Theme.of(context).primaryColor)),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            )));

    // textfield like messagebar
    // MessageBar(
    //   onSend: onSend,
    //   actions: [
    //     InkWell(
    //       onTap: () {},
    //       child: const Icon(
    //         Icons.add,
    //         // color: Colors.black,
    //         size: 24,
    //       ),
    //     ),
    //     Padding(
    //       padding: const EdgeInsets.only(left: 8, right: 8),
    //       child: InkWell(
    //         onTap: () {},
    //         child: const Icon(
    //           Icons.camera_alt,
    //           // color: Colors.green,
    //           size: 24,
    //         ),
    //       ),
    //     ),
    //   ],
    // );
  }
}
