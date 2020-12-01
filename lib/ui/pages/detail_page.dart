import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final String imageAsset;
  final String imageTag;

  const DetailPage({Key key, @required this.imageAsset, @required this.imageTag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Center(
          child: Hero(
            tag: imageTag,
            child: Image.asset(
              imageAsset,
            ),
          ),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
