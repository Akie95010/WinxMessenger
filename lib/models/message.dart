import 'package:email_app/models/user.dart';

class Message {
  final User sender;
  final String time;
  final String text;
  bool unread;
  final User recipient;

  Message({
    this.recipient,
    this.sender,
    this.time,
    this.text,
    this.unread,
  });
}

List<Message> chats = [
  Message(
    recipient: bloom,
    sender: kiko,
    time: '2020-12-09 17:14:23',
    text: 'I\'m hungry! Bring me a carrot!',
    unread: true,
  ),
  Message(
    recipient: bloom,
    sender: flora,
    time: '2020-12-09 16:14:23',
    text: 'Fill my flowers, please :)',
    unread: true,
  ),
  Message(
    recipient: bloom,
    sender: aisha,
    time: '2020-12-09 15:14:23',
    text: 'Why did you miss your workout?',
    unread: false,
  ),
  Message(
    recipient: bloom,
    sender: musa,
    time: '2020-12-09 14:30:23',
    text: 'Your rabbit ruined my headphones!',
    unread: true,
  ),
  Message(
    recipient: bloom,
    sender: stella,
    time: '2020-12-09 13:30:23',
    text: 'Do you remember who I kissed with at the last party?',
    unread: false,
  ),
  Message(
    recipient: bloom,
    sender: roxy,
    time: '2020-12-09 12:14:23',
    text: 'Can I talk to you about whether I can take a dog to Alfea?',
    unread: false,
  ),
  Message(
    recipient: bloom,
    sender: techna,
    time: '2020-12-09 11:14:23',
    text: 'Yes, of course, I will fix the headphones that Kiko broke',
    unread: false,
  ),
  Message(
    recipient: bloom,
    sender: icy,
    time: '2020-12-09 12:14:23',
    text: 'How are you, sweetie?)',
    unread: false,
  ),
];

List<Message> messages = [
  Message(
    recipient: bloom,
    sender: kiko,
    time: '2020-12-09 17:14:23',
    text: 'I\'m hungry! Bring me a carrot!',
    unread: true,
  ),
  Message(
    recipient: kiko,
    sender: bloom,
    time: '2020-12-09 16:14:23',
    text: 'How much can you eat? You have your food!',
    unread: true,
  ),
  Message(
    recipient: bloom,
    sender: flora,
    time: '2020-12-09 16:14:23',
    text: 'Fill my flowers, please :)',
    unread: true,
  ),
  Message(
    recipient: flora,
    sender: bloom,
    time: '2020-12-09 14:14:23',
    text: 'How can I help you with plants while you are with your parents?',
    unread: true,
  ),

  Message(
    recipient: bloom,
    sender: aisha,
    time: '2020-12-09 15:14:23',
    text: 'Why did you miss your workout?',
    unread: true,
  ),
  Message(
    recipient: aisha,
    sender: bloom,
    time: '2020-12-09 14:14:23',
    text: 'Sorry, but I won\'t be able to go to the gym today',
    unread: true,
  ),

  Message(
    recipient: bloom,
    sender: musa,
    time: '2020-12-09 13:14:23',
    text: 'Your rabbit ruined my headphones!',
    unread: true,
  ),

  Message(
    recipient: bloom,
    sender: stella,
    time: '2020-12-09 15:14:23',
    text: 'Do you remember who I kissed with at the last party?',
    unread: true,
  ),
  Message(
    recipient: stella,
    sender: bloom,
    time: '2020-12-09 14:14:23',
    text: 'How do you feel?',
    unread: true,
  ),

  Message(
    recipient: bloom,
    sender: roxy,
    time: '2020-12-09 12:14:23',
    text: 'Can I talk to you about whether I can take a dog to Alfea?',
    unread: true,
  ),

  Message(
    recipient: bloom,
    sender: techna,
    time: '2020-12-09 11:14:23',
    text: 'Yes, of course, I will fix the headphones that Kiko broke',
    unread: true,
  ),
  Message(
    recipient: techna,
    sender: bloom,
    time: '2020-12-09 10:14:23',
    text: 'Could you help me with the headphones?',
    unread: true,
  ),

  Message(
    recipient: bloom,
    sender: icy,
    time: '2020-12-09 12:14:23',
    text: 'How are you, sweetie?)',
    unread: true,
  ),
];
