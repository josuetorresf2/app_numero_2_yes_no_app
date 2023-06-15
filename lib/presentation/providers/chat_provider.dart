import 'package:app_de_mensaje_joshue/config/helpers/get_yes_no_answer.dart';
import 'package:app_de_mensaje_joshue/domain/entities/message.dart';
import 'package:flutter/material.dart';

class ChatProvider extends ChangeNotifier {
  /*
    Puede notificar cuando hay cambios
  */

  // para que cada ves que se envie un mensaje, la pantalla baje
  final ScrollController chatScrollCrontroller = ScrollController();
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

  List<Message> messageList = [
    Message(text: 'Hola Madrid', fromWho: FromWho.mine),
    Message(text: 'Ya regresaste? ', fromWho: FromWho.mine)
  ];

  Future<void> SendMessage(String text) async {
    if (text.isEmpty) return;
    final newMessage = Message(text: text, fromWho: FromWho.mine);

    messageList.add(newMessage);

    if (text.endsWith('?')) {
      herReply();
    }

    notifyListeners(); //si cambio, notifica a todos de este cambio
    await moveScrollToBottom(); //scroll thru screen
  }

  Future<void> herReply() async {
    final herMessage = await getYesNoAnswer.getAnswer();

    messageList.add(herMessage);
    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));
    chatScrollCrontroller.animateTo(
        chatScrollCrontroller.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut);
  }
}
