import 'package:educationapp/onlinePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

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
                Text(
                  "Your ",
                  style: GoogleFonts.roboto(
                      fontSize: 24.w,
                      color: Color.fromARGB(255, 144, 136, 241)),
                ),
                Text(
                  "Mentor",
                  style: GoogleFonts.roboto(
                      fontSize: 24.w,
                      color: Color.fromARGB(255, 220, 248, 129)),
                ),
                Spacer(),
                Container(
                  height: 44.h,
                  width: 44.w,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(25, 255, 255, 255),
                    borderRadius: BorderRadius.circular(500.r),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.search,
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30.h),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OnlinePage(),
                          ));
                    },
                    child: MyContainer(
                      image: "assets/Mike.png",
                      title: "Mike Pena",
                      subtitle: "You need to go to Tempa University",
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  MyContainer(
                    image: "assets/sarah.png",
                    title: "Sarah Johnson",
                    subtitle: "Remember to submit your project"
                        "\nproposal by next...",
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  MyContainer(
                    image: "assets/Rectangle 8.jpg",
                    title: "David Lee",
                    subtitle: "Make sure to attend the networking "
                        "\nevent on Thurs...",
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  MyContainer(
                    image: "assets/emily.png",
                    title: "Emily White",
                    subtitle: "Don't forget to finalize your presentation "
                        "\nslides for th...",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyContainer extends StatefulWidget {
  final String image;
  final String title;
  final String subtitle;
  const MyContainer(
      {super.key,
      required this.image,
      required this.title,
      required this.subtitle});

  @override
  State<MyContainer> createState() => _MyContainerState();
}

class _MyContainerState extends State<MyContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10.w, right: 10.w),
      child: Container(
        width: 400,
        height: 76,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.grey,
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Image.asset(widget.image),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(
                    widget.title,
                    style: GoogleFonts.roboto(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(
                    widget.subtitle,
                    style: GoogleFonts.roboto(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(255, 102, 102, 102),
                    ),
                  ),
                )
              ],
            ),
            Spacer(),
            Container(
              margin: EdgeInsets.only(right: 10),
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFECEDF4),
              ),
              child: Icon(
                Icons.arrow_forward_ios,
                color: Color.fromARGB(255, 144, 136, 241),
                size: 15.h,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
