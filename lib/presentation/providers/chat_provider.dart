import 'package:app_de_mensaje_joshue/domain/entities/message.dart';
import 'package:flutter/material.dart';

class ChatProvider extends ChangeNotifier {
  /*
    Puede notificar cuando hay cambios
  */

  List<Message> messageList = [
    Message(text: 'Hola amor', fromWho: FromWho.mine),
    Message(text: 'Ya regresaste? ', fromWho: FromWho.mine)
  ];

  Future<void> SendMessage(String text) async {}
}
