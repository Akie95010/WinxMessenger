import 'package:email_app/models/user.dart';

class LoginService {
  static final LoginService _singleton = LoginService._internal();

  factory LoginService() {
    return _singleton;
  }

  LoginService._internal();

  User findUser(String login, String password) {
    for (int i = 0; i < existUsers.length; i++) {
      User user = existUsers[i];
      if (login == user.login && password == user.password) {
        return user;
      }
    }
    return null;
  }

}