import 'package:flutter/material.dart';

class Chatinbox extends StatefulWidget {
  const Chatinbox({super.key});

  @override
  State<Chatinbox> createState() => _ChatinboxState();
}

class _ChatinboxState extends State<Chatinbox> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat Inbox"),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
