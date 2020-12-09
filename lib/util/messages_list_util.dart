import 'package:email_app/models/message.dart';
import 'package:email_app/models/user.dart';

import 'date_util.dart';

class MessagesListUtil {
  static void sortMessageList(List<Message> messages) {
    messages.sort((a,b) {
      DateTime aDateTime = DateUtil.getTimeFromString(a.time);
      DateTime bDateTime = DateUtil.getTimeFromString(b.time);
      return bDateTime.compareTo(aDateTime);
    });
  }

}
