import 'package:email_app/models/message.dart';
import 'package:email_app/resources/strings.dart';
import 'package:flutter/material.dart';

import 'chats.dart';
import 'detail_page.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        brightness: Brightness.dark,
        elevation: 8,
        leading: IconButton(
          icon: Icon(Icons.menu),
          color: Colors.white,
          onPressed: () {},
        ),
        title: Text(
          Strings.homePageTitle,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            color: Colors.white,
            onPressed: () {},
          ),
        ],
      ),
      body: _buildListOfChats(),
    );
  }

  Widget _buildListOfChats() {
    return ListView.builder(
      itemCount: chats.length,
      itemBuilder: (BuildContext context, int index) {
        Message chat = chats[index];
        return _buildChatListView(chat);
      },
    );
  }

  Widget _buildChatListView(Message chat) {
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
                          user: chat.sender,
                        ),
                      ),
                    ),
                child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 1,
                      vertical: 2,
                    ),
                    child: _buildListViewItem(chat)))),
      ),
    );
  }

  Widget _buildListViewItem(Message chat) {
    return Row(
      children: <Widget>[
        _buildAvatar(context, chat),
        Container(
          width: MediaQuery.of(context).size.width * 0.65,
          padding: EdgeInsets.only(
            left: 20,
          ),
          child: Column(
            children: <Widget>[
              _buildUserInfoRow(chat),
              SizedBox(
                height: 15,
              ),
              _buildTextContainer(chat),
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

  Widget _buildTextContainer(Message chat) {
    return Container(
      alignment: Alignment.topLeft,
      child: Text(
        chat.text,
        style: TextStyle(
          fontSize: 13,
          color: Colors.black54,
        ),
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
      ),
    );
  }

  Widget _buildAvatar(BuildContext context, Message chat) {
    return Container(
      padding: EdgeInsets.all(2),
      child: GestureDetector(
        child: Hero(
          tag: chat.sender.name,
          child: CircleAvatar(
            radius: 35,
            backgroundImage: AssetImage(chat.sender.imageUrl),
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

  Widget _buildUserInfoRow(Message chat) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Text(
              chat.sender.name,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            chat.sender.isOnline
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
          chat.time,
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
