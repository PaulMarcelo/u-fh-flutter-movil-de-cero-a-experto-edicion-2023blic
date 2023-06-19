import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widget/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widget/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widget/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                "https://static.wikia.nocookie.net/marvelcinematicuniverse/images/b/bf/JARVIS.png/revision/latest?cb=20150512235236&path-prefix=es"),
          ),
        ),
        title: const Text("IA Chat "),
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: chatProvider.controllerScroll,
                itemBuilder: (context, index) {
                  final message = chatProvider.messageList[index];
                  return (message.fromWho == FromWho.hers)
                      ? HerMessageBubble(
                          message: message,
                        )
                      : MyMessageBubble(
                          message: message,
                        );
                },
                itemCount: chatProvider.messageList.length,
              ),
            ),
            MessageFieldBox(
              onValue: chatProvider.sendMessage,
            ),
          ],
        ),
      ),
    );
  }
}
