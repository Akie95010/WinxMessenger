import 'package:email_app/models/current_user.dart';
import 'package:email_app/models/user.dart';
import 'package:email_app/resources/strings.dart';
import 'package:email_app/services/login_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'all_chats_page.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _LoginPageState();
}

enum FormType { login, register }

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailFilter = new TextEditingController();
  final TextEditingController _passwordFilter = new TextEditingController();
  String _email = "";
  String _password = "";
  FormType _form = FormType.login;
  final LoginService _loginService = LoginService();

  _LoginPageState() {
    _emailFilter.addListener(_emailListen);
    _passwordFilter.addListener(_passwordListen);
  }

  void _emailListen() {
    if (_emailFilter.text.isEmpty) {
      _email = "";
    } else {
      _email = _emailFilter.text;
    }
  }

  void _passwordListen() {
    if (_passwordFilter.text.isEmpty) {
      _password = "";
    } else {
      _password = _passwordFilter.text;
    }
  }

  // Swap in between our two forms, registering and logging in
  void _formChange() async {
    setState(() {
      if (_form == FormType.register) {
        _form = FormType.login;
      } else {
        _form = FormType.register;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildBar(context),
      body: SingleChildScrollView(child:Container(
        padding: EdgeInsets.all(16.0),
        child: new Column(
          children: <Widget>[
            _buildTextFields(),
            _buildButtons(),
            SizedBox(
              height: 60,
            ),
            Image.asset(Strings.logoImage),
          ],
        ),
      ), )
    );
  }

  Widget _buildBar(BuildContext context) {
    return AppBar(
      title: new Text("Secret winx club"),
      centerTitle: true,
    );
  }

  Widget _buildTextFields() {
    return Container(
      child: new Column(
        children: <Widget>[
          new Container(
            child: new TextField(
              controller: _emailFilter,
              decoration: new InputDecoration(labelText: 'Email'),
            ),
          ),
          new Container(
            child: new TextField(
              controller: _passwordFilter,
              decoration: new InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildButtons() {
    if (_form == FormType.login) {
      return new Container(
        child: new Column(
          children: <Widget>[
            new RaisedButton(
              child: new Text('Login'),
              onPressed: _loginPressed,
            ),
          ],
        ),
      );
    }
  }

  // These functions can self contain any user auth logic required, they all have access to _email and _password

  void _loginPressed() {
    print('The user wants to login with $_email and $_password');
    User user = _loginService.findUser(_email, _password);
    if (user != null) {
      CurrentUser.user = user;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => AllChatsPage(),
        ),
      );
    } else
      _showErrorDialog();
  }
  void _showErrorDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(Strings.failedLoggingTitle),
          content: SingleChildScrollView(
              child: Center(
            child: Text(Strings.failedLoggingText),
          )),
          actions: <Widget>[
            TextButton(
              child: Text(Strings.approveBtnText),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
