

import 'package:intl/intl.dart';

class DateUtil {

  static String getTimeString(String timeString) {
    DateTime dateTime = DateTime.parse(timeString);
    String result = DateFormat("dd.MM.yyyy").format(dateTime) + "\n" + DateFormat.jm().format(dateTime);
    return result;
  }

  static DateTime getTimeFromString(String timeString) {
    DateTime dateTime = DateTime.parse(timeString);
    return dateTime;
  }
}