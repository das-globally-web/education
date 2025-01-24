import 'package:educationapp/home/views/home.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class FindMentorPage extends StatefulWidget {
  const FindMentorPage({super.key});

  @override
  State<FindMentorPage> createState() => _FindMentorPageState();
}

class _FindMentorPageState extends State<FindMentorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1B1B1B),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 70.h,
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
                  "Find a ",
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
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 10.w,
                ),
                SizedBox(
                  height: 30.h,
                  width: 440.w - 11.h,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    children: [
                      MyOption(
                        title: "Placements",
                        callBack: () {
                          setState(() {});
                        },
                        currentIndex: Icons.arrow_drop_down_outlined,
                        index: 0,
                      ),
                      MyOption(
                        title: "Carer",
                        callBack: () {
                          setState(() {});
                        },
                        currentIndex: Icons.arrow_drop_down_outlined,
                        index: 1,
                      ),
                      MyOption(
                        title: "Opportunities",
                        callBack: () {
                          setState(() {});
                        },
                        currentIndex: Icons.arrow_drop_down_outlined,
                        index: 2,
                      ),
                      MyOption(
                        title: "Development",
                        callBack: () {
                          setState(() {});
                        },
                        currentIndex: Icons.arrow_drop_down_outlined,
                        index: 3,
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(30.r)),
              child: FindMEntorBoduy(),
            ),
          ],
        ),
      ),
    );
  }
}

class FindMEntorBoduy extends StatefulWidget {
  const FindMEntorBoduy({super.key});

  @override
  State<FindMEntorBoduy> createState() => _FindMEntorBoduyState();
}

class _FindMEntorBoduyState extends State<FindMEntorBoduy> {
  int curenttabindex = 7;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
            itemCount: 8,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                // child: UserTabs(),
                
              );
            });
  }
}

class MyOption extends StatefulWidget {
  final String title;
  final Function callBack;
  final IconData currentIndex;
  final int index;
  const MyOption(
      {super.key,
      required this.title,
      required this.callBack,
      required this.currentIndex,
      required this.index});

  @override
  State<MyOption> createState() => _MyOptionState();
}

class _MyOptionState extends State<MyOption> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 4.w, right: 8.w),
      child: GestureDetector(
        onTap: () {
          widget.callBack();
        },
        child: Container(
          height: 30.h,
          decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(50.r)),
          child: Padding(
            padding: EdgeInsets.only(left: 10.w, right: 10.w),
            child: Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  widget.title,
                  style: GoogleFonts.roboto(
                      fontSize: 12.w,
                      fontWeight: FontWeight.w400,
                      letterSpacing: -0.30,
                      color: Colors.white),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Icon(
                  widget.currentIndex,
                  color: Colors.white,
                )
              ],
            )),
          ),
        ),
      ),
    );
  }
}
