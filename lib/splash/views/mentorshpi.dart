import 'package:educationapp/registerpage/views/register.page.dart';
import 'package:educationapp/splash/views/getstart.page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class MentorShipPage extends StatefulWidget {
  const MentorShipPage({super.key});

  @override
  State<MentorShipPage> createState() => _MentorShipPageState();
}

class _MentorShipPageState extends State<MentorShipPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 956,
        width: 440,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            MentorshipBody(),
            BackGroundImage(),
          ],
        ),
      ),
    );
  }
}

class MentorshipBody extends StatefulWidget {
  const MentorshipBody({super.key});

  @override
  State<MentorshipBody> createState() => _MentorshipBodyState();
}

class _MentorshipBodyState extends State<MentorshipBody> {
  final selectColor = Color(0xFFDCF881);
  final deselectColor = Color(0xFFF1F2F6);
  int selectIndex = 0;

  void sendToNextPage() {
    Future.delayed(Duration(seconds: 1), () {
      Navigator.push(
          context, CupertinoPageRoute(builder: (context) => RegisterPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Spacer(),
        Text(
          "What brings you here?",
          style: GoogleFonts.roboto(
              color: Colors.black,
              fontSize: 26.w,
              fontWeight: FontWeight.w600,
              letterSpacing: -1.2.h),
        ),
        SizedBox(
          height: 20.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  selectIndex = 0;
                });
                sendToNextPage();
              },
              child: Container(
                height: 46.h,
                width: 148.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.r),
                    color:
                        selectIndex == 0 ? Color(0xFFDCF881) : deselectColor),
                child: Center(
                    child: Text(
                  "🎓 Placements",
                  style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w400,
                      fontSize: 15.w,
                      letterSpacing: -0.95),
                )),
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  selectIndex = 1;
                });
                sendToNextPage();
              },
              child: Container(
                height: 46.h,
                width: 176.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.r),
                    color:
                        selectIndex == 1 ? Color(0xFFDCF881) : deselectColor),
                child: Center(
                    child: Text(
                  "🧑‍🎓 Career Guidance",
                  style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w400,
                      fontSize: 15.w,
                      letterSpacing: -0.95),
                )),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10.w,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  selectIndex = 2;
                });
                sendToNextPage();
              },
              child: Container(
                height: 46.h,
                width: 178.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.r),
                    color:
                        selectIndex == 2 ? Color(0xFFDCF881) : deselectColor),
                child: Center(
                    child: Text(
                  "📚 Course Selection",
                  style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w400,
                      fontSize: 15.w,
                      letterSpacing: -0.95),
                )),
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  selectIndex = 3;
                });
                sendToNextPage();
              },
              child: Container(
                height: 46.h,
                width: 166.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.r),
                    color:
                        selectIndex == 3 ? Color(0xFFDCF881) : deselectColor),
                child: Center(
                    child: Text(
                  "🤔 General Advice",
                  style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w400,
                      fontSize: 15.w,
                      letterSpacing: -0.95),
                )),
              ),
            ),
          ],
        ),
        Spacer()
      ],
    );
  }
}
