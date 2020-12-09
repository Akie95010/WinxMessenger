
import 'package:email_app/ui/pages/login_page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Email',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        primaryColor: Colors.pink.shade300,
        backgroundColor: Colors.pink.shade50,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginPage(),
    );
  }
}