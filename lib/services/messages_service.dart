import 'package:email_app/models/current_user.dart';
import 'package:email_app/models/message.dart';
import 'package:email_app/models/user.dart';

class MessageService {

  static final MessageService _singleton = MessageService._internal();

  factory MessageService() {
    return _singleton;
  }

  MessageService._internal();

  List<Message> getChatsOfCurrentUser() {
    List<Message> currentUserChats = new List();
    for (int i = 0; i < chats.length; i++) {
      if (_isCurrentUserChat(chats[i])) currentUserChats.add(chats[i]);
    }

    return currentUserChats;
  }

  bool _isCurrentUserChat(Message chat) {
    return chat.recipient.name == CurrentUser.user.name || chat.sender.name == CurrentUser.user.name;
  }

  List<Message> getMessagesOfCurrentChat(User otherUser) {
    List<Message> newMessages = new List();
    for (int i = 0; i < messages.length; i++) {
      String sender = messages[i].sender.name;
      String recipient = messages[i].recipient.name;
      if (_isItUsersMessage(sender, recipient, otherUser) ||
          _isItCurrentUsersMessage(sender, recipient, otherUser)) {
        newMessages.add(messages[i]);
      }
    }
    return newMessages;
  }

  void updateChat(Message message) {
    User user = message.sender != CurrentUser.user ? message.sender : message.recipient;

    for (int i = 0; i < chats.length; i++) {
      if (chats[i].recipient.name == user.name || chats[i].sender.name == user.name) {
        chats[i] = message;
        return;
      }
    }
  }

  bool _isItUsersMessage(String sender, String recipient, User otherUser) {
    return sender.compareTo(otherUser.name) == 0 &&
        recipient.compareTo(CurrentUser.user.name) == 0;
  }

  bool _isItCurrentUsersMessage(String sender, String recipient, User otherUser) {
    return sender.compareTo(CurrentUser.user.name) == 0 &&
        recipient.compareTo(otherUser.name) == 0;
  }
}