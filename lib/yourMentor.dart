import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class YourMentorPage extends StatefulWidget {
  const YourMentorPage({super.key});

  @override
  State<YourMentorPage> createState() => _YourMentorPageState();
}

class _YourMentorPageState extends State<YourMentorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 27, 27, 27),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(0),
            child: Row(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(25, 255, 255, 255),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Color.fromARGB(255, 255, 255, 255),
                        size: 15.w,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
