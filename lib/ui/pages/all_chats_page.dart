import 'package:email_app/models/current_user.dart';
import 'package:email_app/models/message.dart';
import 'package:email_app/models/user.dart';
import 'package:email_app/resources/strings.dart';
import 'package:email_app/services/messages_service.dart';
import 'package:email_app/util/date_util.dart';
import 'package:email_app/util/messages_list_util.dart';
import 'package:flutter/material.dart';

import 'chat_page.dart';
import 'detail_page.dart';

class AllChatsPage extends StatefulWidget {
  @override
  _AllChatsPageState createState() => _AllChatsPageState();
}

class _AllChatsPageState extends State<AllChatsPage> {
  final MessageService _messageService = MessageService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        brightness: Brightness.dark,
        elevation: 8,
        title: Text(
          Strings.homePageTitle,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: _buildListOfChats(),
    );
  }

  Widget _buildListOfChats() {
    List<Message> currentUserChats = _messageService.getChatsOfCurrentUser();
    return ListView.builder(
      itemCount: currentUserChats.length,
      itemBuilder: (BuildContext context, int index) {
        Message chat = chats[index];
        return _buildChatListView(chat);
      },
    );
  }

  Widget _buildChatListView(Message chat) {
    User user = chat.sender.name != CurrentUser.user.name
        ? chat.sender
        : chat.recipient;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Padding(
            padding: EdgeInsets.all(5.0),
            child: InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ChatPage(
                      user: user,
                    ),
                  ),
                ),
                child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 1,
                      vertical: 2,
                    ),
                    child: _buildListViewItem(chat, user)))),
      ),
    );
  }

  Widget _buildListViewItem(Message chat, User user) {
    return Row(
      children: <Widget>[
        _buildAvatar(context, chat, user),
        Container(
          width: MediaQuery.of(context).size.width * 0.65,
          padding: EdgeInsets.only(
            left: 20,
          ),
          child: Column(
            children: <Widget>[
              _buildUserInfoRow(chat, user),

              _buildTextContainer(chat, user),
            ],
          ),
        ),
        SizedBox(width: 1, height: 2),
        Expanded(child: _buildCbx(chat)),
      ],
    );
  }

  Widget _buildCbx(Message chat) {
    return Checkbox(
        value: chat.unread,
        onChanged: (bool value) {
          setState(() {
            chat.unread = value;
          });
        });
  }

  Widget _buildTextContainer(Message chat, User user) {
    return Container(
        alignment: Alignment.topLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              chat.sender.name,
              style: TextStyle(
                fontSize: 13,
                color: Colors.black54,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
            Text(
              chat.text,
              style: TextStyle(
                fontSize: 13,
                color: Colors.black54,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ],
        ));
  }

  Widget _buildAvatar(BuildContext context, Message chat, User user) {
    return Container(
      padding: EdgeInsets.all(2),
      child: GestureDetector(
        child: Hero(
          tag: user.name,
          child: CircleAvatar(
            radius: 35,
            backgroundImage: AssetImage(user.imageUrl),
          ),
        ),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return DetailPage(
                imageAsset: chat.sender.imageUrl, imageTag: chat.sender.name);
          }));
        },
      ),
    );
  }

  Widget _buildUserInfoRow(Message chat, User user) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Text(
              user.name,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            user.isOnline
                ? Container(
              margin: const EdgeInsets.only(left: 5),
              width: 7,
              height: 7,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).primaryColor,
              ),
            )
                : Container(
              child: null,
            ),
          ],
        ),
        Text(
          DateUtil.getTimeString(chat.time),
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w300,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}
