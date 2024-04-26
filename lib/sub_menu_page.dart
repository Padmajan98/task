import 'package:flutter/material.dart';

class SubMenuPage extends StatelessWidget {
  final String title;
  final String body;

  const SubMenuPage({Key? key, required this.title, required this.body})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          body,
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
