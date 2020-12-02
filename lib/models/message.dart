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
    recipient: currentUser,
    sender: kiko,
    time: '5:30 PM',
    text: 'I\'m hungry! Bring me a carrot!',
    unread: true,
  ),
  Message(
    recipient: currentUser,
    sender: flora,
    time: '4:30 PM',
    text: 'Fill my flowers, please :)',
    unread: true,
  ),
  Message(
    recipient: currentUser,
    sender: aisha,
    time: '3:30 PM',
    text: 'Why did you miss your workout?',
    unread: false,
  ),
  Message(
    recipient: currentUser,
    sender: musa,
    time: '2:30 PM',
    text: 'Your rabbit ruined my headphones!',
    unread: true,
  ),
  Message(
    recipient: currentUser,
    sender: stella,
    time: '1:30 PM',
    text: 'Do you remember who I kissed with at the last party?',
    unread: false,
  ),
  Message(
    recipient: currentUser,
    sender: roxy,
    time: '12:30 PM',
    text: 'Can I talk to you about whether I can take a dog to Alfea?',
    unread: false,
  ),
  Message(
    recipient: currentUser,
    sender: techna,
    time: '11:30 AM',
    text: 'Yes, of course, I will fix the headphones that Kiko broke',
    unread: false,
  ),
  Message(
    recipient: currentUser,
    sender: icy,
    time: '12:45 AM',
    text: 'How are you, sweetie?)',
    unread: false,
  ),
];

List<Message> messages = [
  Message(
    recipient: currentUser,
    sender: kiko,
    time: '5:30 PM',
    text: 'I\'m hungry! Bring me a carrot!',
    unread: true,
  ),
  Message(
    recipient: kiko,
    sender: currentUser,
    time: '4:30 PM',
    text: 'How much can you eat? You have your food!',
    unread: true,
  ),
  Message(
    recipient: currentUser,
    sender: flora,
    time: '4:30 PM',
    text: 'Fill my flowers, please :)',
    unread: true,
  ),
  Message(
    recipient: flora,
    sender: currentUser,
    time: '2:40 PM',
    text: 'How can I help you with plants while you are with your parents?',
    unread: true,
  ),

  Message(
    recipient: currentUser,
    sender: aisha,
    time: '3:30 PM',
    text: 'Why did you miss your workout?',
    unread: true,
  ),
  Message(
    recipient: aisha,
    sender: currentUser,
    time: '2:40 PM',
    text: 'Sorry, but I won\'t be able to go to the gym today',
    unread: true,
  ),

  Message(
    recipient: currentUser,
    sender: musa,
    time: '1:30 PM',
    text: 'Your rabbit ruined my headphones!',
    unread: true,
  ),

  Message(
    recipient: currentUser,
    sender: stella,
    time: '3:30 PM',
    text: 'Do you remember who I kissed with at the last party?',
    unread: true,
  ),
  Message(
    recipient: stella,
    sender: currentUser,
    time: '2:40 PM',
    text: 'How do you feel?',
    unread: true,
  ),

  Message(
    recipient: currentUser,
    sender: roxy,
    time: '12:30 PM',
    text: 'Can I talk to you about whether I can take a dog to Alfea?',
    unread: true,
  ),

  Message(
    recipient: currentUser,
    sender: techna,
    time: '11:30 PM',
    text: 'Yes, of course, I will fix the headphones that Kiko broke',
    unread: true,
  ),
  Message(
    recipient: techna,
    sender: currentUser,
    time: '10:40 PM',
    text: 'Could you help me with the headphones?',
    unread: true,
  ),

  Message(
    recipient: currentUser,
    sender: icy,
    time: '12:40 PM',
    text: 'How are you, sweetie?)',
    unread: true,
  ),
];
