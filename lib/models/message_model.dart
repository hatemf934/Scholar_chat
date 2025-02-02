import 'package:chatsapp/core/text_value_manager.dart';

class MessageModel {
  final String message;
  final String id;

  MessageModel(this.message, this.id);

  factory MessageModel.fromjson(jsondata) {
    return MessageModel(
        jsondata[TextValueManager.kMessage], jsondata[TextValueManager.kId]);
  }
}
