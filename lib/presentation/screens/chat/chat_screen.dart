import 'package:app_de_mensaje_joshue/presentation/widgets/chat/her_messages_bubble.dart';
import 'package:app_de_mensaje_joshue/presentation/widgets/chat/my_message_bubble.dart';
import 'package:app_de_mensaje_joshue/presentation/widgets/shared/message_field_box.dart';
import 'package:flutter/material.dart';

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

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
              itemCount: 100, //elementos que tengo
              itemBuilder: (context, index) {
                return (index % 2 == 0)
                    ? const HerMessageBuble()
                    : const MyMessageBuble();
              },
            )),

            /// caja de texto de mensajes
            const MessageFieldBox(),
          ],
        ),
      ),
    );
  }
}
