import 'package:email_app/models/current_user.dart';
import 'package:email_app/models/message.dart';
import 'package:email_app/models/user.dart';
import 'package:email_app/resources/strings.dart';
import 'package:email_app/services/messages_service.dart';
import 'package:email_app/ui/widgets/chat_bubble.dart';
import 'package:email_app/util/date_util.dart';
import 'package:email_app/util/messages_list_util.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  final User user;

  ChatPage({this.user});

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<Message> _messagesOfCurrentChat = new List();
  final _messageTextController = TextEditingController();
  final MessageService _messageService = MessageService();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int prevUserId;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
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
    _messagesOfCurrentChat = _messageService.getMessagesOfCurrentChat(widget.user);
    MessagesListUtil.sortMessageList(_messagesOfCurrentChat);

    return ListView.builder(
      reverse: true,
      padding: EdgeInsets.all(20),
      itemCount: _messagesOfCurrentChat.length,
      itemBuilder: (BuildContext context, int index) {
        List<Message> chatMessages = _messagesOfCurrentChat;

        if (chatMessages.length != 0) {
          final Message message = chatMessages[index];
          final bool isMe = message.sender.id == CurrentUser.user.id;
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

  /*List<Message> _getMessagesOfCurrentChat(List<Message> allMessages) {
    List<Message> newMessages = new List();
    for (int i = 0; i < allMessages.length; i++) {
      String sender = allMessages[i].sender.name;
      String recipient = allMessages[i].recipient.name;
      if (isItUsersMessage(sender, recipient) ||
          isItCurrentUsersMessage(sender, recipient)) {
        newMessages.add(messages[i]);
      }
    }
    return newMessages;
  }*/



  Widget _sendMessageArea() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      height: 70,
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: _messageTextController,
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
            onPressed: () {
              setState(() {
                if (_messageTextController.text.isNotEmpty) {
                  Message sendMessage = _getMessage();
                  messages.add(sendMessage);
                  FocusScope.of(context).unfocus();
                  _messageTextController.clear();
                  _messageService.updateChat(sendMessage);
                }
              });
            },
          ),
        ],
      ),
    );
  }

  Message _getMessage() {
    return new Message(
        recipient: widget.user,
        sender: CurrentUser.user,
        time: DateTime.now().toString(),
        text: _messageTextController.text,
        unread: false);
  }

/* void _sortMessageList() {
    _messagesOfCurrentChat.sort((a,b) {
      DateTime aDateTime = DateUtil.getTimeFromString(a.time);
      DateTime bDateTime = DateUtil.getTimeFromString(b.time);
      return bDateTime.compareTo(aDateTime);
    });
  }*/

}
