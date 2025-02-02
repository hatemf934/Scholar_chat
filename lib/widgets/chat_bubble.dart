import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:chatsapp/models/message_model.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({super.key, required this.message});
  final MessageModel message;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: BubbleSpecialThree(
        text: message.message,
        color: Theme.of(context).primaryColor,
        tail: true,
        isSender: true,
        textStyle: Theme.of(context).textTheme.titleMedium!,
      ),
    );
  }
}

class ChatBubbleByFriend extends StatelessWidget {
  const ChatBubbleByFriend({super.key, required this.message});
  final MessageModel message;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: BubbleSpecialThree(
        text: message.message,
        color: Theme.of(context).primaryColorDark,
        tail: true,
        isSender: false,
        textStyle: Theme.of(context).textTheme.titleLarge!,
      ),
    );
  }
}
