import 'package:email_app/models/message.dart';
import 'package:email_app/models/user.dart';
import 'package:email_app/resources/strings.dart';
import 'package:email_app/ui/widgets/chat_bubble.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  final User user;

  ChatPage({this.user});

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    int prevUserId;
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        brightness: Brightness.dark,
        centerTitle: true,
        title: _buildTitle(),
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: _buildListView(prevUserId),
          ),
          _sendMessageArea(),
        ],
      ),
    );
  }

  Widget _buildListView(int prevUserId) {
    return ListView.builder(
      reverse: true,
      padding: EdgeInsets.all(20),
      itemCount: getMessages().length,
      itemBuilder: (BuildContext context, int index) {
        List<Message> chatMessages = getMessages();
        if (chatMessages.length != 0) {
          final Message message = chatMessages[index];
          final bool isMe = message.sender.id == currentUser.id;
          final bool isSameUser = prevUserId == message.sender.id;
          prevUserId = message.sender.id;
          return ChatBubble(
              message: message, isMe: isMe, isSameUser: isSameUser);
        }
        return null;
      },
    );
  }

  Widget _buildTitle() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
              text: widget.user.name,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              )),
          TextSpan(text: '\n'),
          widget.user.isOnline
              ? TextSpan(
                  text: Strings.online,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                  ),
                )
              : TextSpan(
                  text: Strings.offline,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                  ),
                )
        ],
      ),
    );
  }

  List<Message> getMessages() {
    List<Message> newMessages = new List();

    for (int i = 0; i < messages.length; i++) {
      String sender = messages[i].sender.name;
      String recipient = messages[i].recipient.name;
      if (isItUsersMessage(sender, recipient) ||
          isItCurrentUsersMessage(sender, recipient)) {
        newMessages.add(messages[i]);
      }
    }
    return newMessages;
  }

  bool isItUsersMessage(String sender, String recipient) {
    return sender.compareTo(widget.user.name) == 0 &&
        recipient.compareTo(currentUser.name) == 0;
  }

  bool isItCurrentUsersMessage(String sender, String recipient) {
    return sender.compareTo(currentUser.name) == 0 &&
        recipient.compareTo(widget.user.name) == 0;
  }

  _sendMessageArea() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      height: 70,
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              decoration: InputDecoration.collapsed(
                hintText: Strings.sendMessageHint,
              ),
              textCapitalization: TextCapitalization.sentences,
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            iconSize: 25,
            color: Theme.of(context).primaryColor,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
