import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class OnlinePage extends StatefulWidget {
  const OnlinePage({super.key});

  @override
  State<OnlinePage> createState() => _OnlinePageState();
}

class _OnlinePageState extends State<OnlinePage> {
  final _controller = TextEditingController();
  List<Map<String, dynamic>> messages = [
    {"text": "And the HR round?", "isMe": true, "time": "06:30 PM"},
    {
      "text":
          "Be honest and confident. Practice answers for common questions like strengths, weaknesses, and career goals.",
      "isMe": false,
      "time": "06:00 PM"
    },
    {"text": "Any tips to stay calm?", "isMe": true, "time": "06:30 PM"},
    {
      "text":
          "Stick to a schedule, practice mock interviews, and take breaks. Rejections happen—learn and move forward.",
      "isMe": false,
      "time": "06:00 PM"
    },
    {"text": "Thanks! This really helps.", "isMe": true, "time": "06:30 PM"},
    {
      "text": "Hi, how’s your placement prep going?",
      "isMe": false,
      "time": "10 min ago"
    },
    {
      "text": "I’m nervous and not sure if I’m fully prepared.",
      "isMe": true,
      "time": "10 min ago"
    },
  ];
  void sendMessage() {
    if (_controller.text.trim().isNotEmpty) {
      setState(() {
        messages.add({
          'text': _controller.text.trim(),
          'time': TimeOfDay.now().format(context),
        });
      });
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 27, 27, 27),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 30.w,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 44.h,
                    width: 44.w,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(25, 255, 255, 255),
                        borderRadius: BorderRadius.circular(500.r)),
                    child: Center(
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Color.fromARGB(255, 255, 255, 255),
                        size: 15.w,
                      ),
                    ),
                  ),
                ),
                Spacer(),
                Column(
                  children: [
                    Text(
                      "Mike Pena ",
                      style: GoogleFonts.roboto(
                        fontSize: 24.w,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Online",
                      style: GoogleFonts.roboto(
                        fontSize: 15.w,
                        fontWeight: FontWeight.w400,
                        color: Color.fromARGB(255, 220, 248, 129),
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Container(
                  height: 44.h,
                  width: 44.w,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(25, 255, 255, 255),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.more_horiz,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  width: 30.w,
                ),
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.r),
                  topRight: Radius.circular(30.r),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height,
                      child: ListView.builder(
                        itemCount: messages.length,
                        itemBuilder: (context, index) {
                          return ChatScreen(
                            text: messages[index]['text'],
                            isMe: messages[index]['isMe'],
                            time: messages[index]['time'],
                          );
                        },
                      ),
                    ),
                    MessageInput(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessageInput extends StatefulWidget {
  const MessageInput({super.key});

  @override
  State<MessageInput> createState() => _MessageInputState();
}

class _MessageInputState extends State<MessageInput> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            hintText: "Enter Message...",
          ),
        ),
      ],
    );
  }
}

class ChatScreen extends StatefulWidget {
  final String text;
  final bool isMe;
  final String time;
  const ChatScreen(
      {super.key, required this.isMe, required this.time, required this.text});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: widget.isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color:
              widget.isMe ? Color.fromARGB(255, 144, 136, 241) : Colors.white,
          borderRadius: widget.isMe
              ? BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                )
              : BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
          border: Border.all(width: 1),
        ),
        child: Column(
          crossAxisAlignment:
              widget.isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Text(
              widget.text,
              style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: widget.isMe
                      ? Colors.white
                      : Color.fromARGB(255, 38, 50, 56)),
            ),
            SizedBox(height: 5),
            Text(
              widget.time,
              style: TextStyle(
                color: widget.isMe ? Colors.white70 : Colors.black54,
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
