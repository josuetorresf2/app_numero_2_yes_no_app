import 'package:app_de_mensaje_joshue/domain/entities/message.dart';
import 'package:app_de_mensaje_joshue/presentation/providers/chat_provider.dart';
import 'package:app_de_mensaje_joshue/presentation/widgets/chat/her_messages_bubble.dart';
import 'package:app_de_mensaje_joshue/presentation/widgets/chat/my_message_bubble.dart';
import 'package:app_de_mensaje_joshue/presentation/widgets/shared/message_field_box.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(2.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTsPMiOZSwCtfwjKjf1CI6cjZ4DUrpDLtPO9Q&usqp=CAU'),
          ),
        ),
        title: const Text('Madrid'),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

//Private class _ChatView
class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<
        ChatProvider>(); //pendientes de los cambios que suceden en la istancia

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                //List view controlls how the messages look
                child: ListView.builder(
              controller: chatProvider.chatScrollCrontroller,
              itemCount: chatProvider.messageList.length, //elementos que tengo
              itemBuilder: (context, index) {
                final message = chatProvider.messageList[index];

                return (message.fromWho == FromWho.thems)
                    ? HerMessageBuble(message: message)
                    : MyMessageBuble(message: message);
              },
            )),

            /// caja de texto de mensajes
            MessageFieldBox(
              //saves messages send my user
              //onValue: (value) => chatProvider.SendMessage(value),
              onValue: chatProvider.SendMessage,
            ),
          ],
        ),
      ),
    );
  }
}
