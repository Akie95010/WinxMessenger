import 'package:email_app/models/message.dart';
import 'package:email_app/util/date_util.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final Message message;
  final bool isMe;
  final bool isSameUser;

  const ChatBubble({Key key, this.message, this.isMe, this.isSameUser})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _chatBubble(message, isMe, isSameUser, context);
  }

  _chatBubble(
      Message message, bool isMe, bool isSameUser, BuildContext context) {
    if (isMe) {
      return Column(
        children: <Widget>[
          _buildCurrentUserMessage(context),
          _buildCurrentUserMessageInfo(),
        ],
      );
    } else {
      return Column(
        children: <Widget>[
          _buildUserMessage(context),
          _buildUserMessageInfo(),
        ],
      );
    }
  }

  Widget _buildUserMessageInfo() {
    return !isSameUser
        ? Row(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
              ),
            ],
          ),
          child: CircleAvatar(
            radius: 15,
            backgroundImage: AssetImage(message.sender.imageUrl),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          DateUtil.getTimeString(message.time),
          style: TextStyle(
            fontSize: 12,
            color: Colors.black45,
          ),
        ),
      ],
    )
        : Container(
      child: null,
    );
  }

  Widget _buildUserMessage(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.80,
        ),
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
            ),
          ],
        ),
        child: Text(
          message.text,
          style: TextStyle(
            color: Colors.black54,
          ),
        ),
      ),
    );
  }

  Widget _buildCurrentUserMessageInfo() {
    return !isSameUser
        ? Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Text(
          DateUtil.getTimeString(message.time),
          style: TextStyle(
            fontSize: 12,
            color: Colors.black45,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
              ),
            ],
          ),
          child: CircleAvatar(
            radius: 15,
            backgroundImage: AssetImage(message.sender.imageUrl),
          ),
        ),
      ],
    )
        : Container(
      child: null,
    );
  }

  Widget _buildCurrentUserMessage(BuildContext context) {
    return  Container(
      alignment: Alignment.topRight,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.80,
        ),
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
            ),
          ],
        ),
        child: Text(
          message.text,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
