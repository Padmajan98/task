import 'package:flutter/material.dart';

class SubMenuPage extends StatelessWidget {
  final String title;
  final String body;

  const SubMenuPage({super.key, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor:const Color.fromARGB(255, 99, 98, 199),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          body,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
