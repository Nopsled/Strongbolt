import 'package:flutter/material.dart';
import 'package:strongbolt/components/Background.dart';
import 'package:strongbolt/components/HeaderChatGroup.dart';
import 'package:strongbolt/components/MessageInputGroup.dart';
import 'package:strongbolt/components/MessageRecievedGroup.dart';

class Chat {
  String roomId;
  String roomAlias; // Same as userId chatting with.
  List<MessageRecievedGroup> messageList = [];

  void addMessage(String messageStr) {
    MessageRecievedGroup message =
        MessageRecievedGroup(message: messageStr, time: "8:30 AM");
    messageList.add(message);
  }

  Chat({@required this.roomId, @required this.roomAlias});
}

class MessagePage extends StatefulWidget {
  // Declare a field that holds the Chat.
  final Chat chat;
  // In the constructor, require a chat.
  MessagePage({@required this.chat});

  @override
  _MessagePageState createState() => _MessagePageState(chat: chat);
}

class _MessagePageState extends State<MessagePage> {
  // Declare a field that holds the Chat.
  final Chat chat;
  // In the constructor, require a chat.
  _MessagePageState({@required this.chat});

  void refresh() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Background(),
          SafeArea(
            child: Column(
              children: <Widget>[
                HeaderChatGroup(roomAlias: chat.roomAlias),
                SizedBox(height: 24.0),
                ...chat.messageList.toList(),
              ],
            ),
          ),
          MessageInputGroup(
              onNewMessage: refresh,
              roomId: chat.roomId,
              roomAlias: chat.roomAlias),
        ],
      ),
    );
  }
}
