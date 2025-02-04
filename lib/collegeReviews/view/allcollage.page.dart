import 'package:educationapp/collegeReviews/view/perticuler.collage.dart';
import 'package:educationapp/findmentor/view/findmentor.page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AllCollage extends StatefulWidget {
  const AllCollage({super.key});

  @override
  State<AllCollage> createState() => _AllCollageState();
}

class _AllCollageState extends State<AllCollage> {
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
                  "Explore ",
                  style: GoogleFonts.roboto(
                      fontSize: 18.w,
                      color: Color.fromARGB(255, 144, 136, 241)),
                ),
                Text(
                  "College Review",
                  style: GoogleFonts.roboto(
                      fontSize: 18.w,
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
              child: AllCollageBody(),
            ),
          ],
        ),
      ),
    );
  }
}

class AllCollageBody extends StatefulWidget {
  const AllCollageBody({super.key});

  @override
  State<AllCollageBody> createState() => _AllCollageBodyState();
}

class _AllCollageBodyState extends State<AllCollageBody> {
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
            child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => PerticulerCollagePage()));
                },
                child: UniversityTab()),
          );
        });
  }
}

class UniversityTab extends StatefulWidget {
  const UniversityTab({super.key});

  @override
  State<UniversityTab> createState() => _UniversityTabState();
}

class _UniversityTabState extends State<UniversityTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 135.h,
      width: 400.w,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(color: Color.fromARGB(25, 0, 0, 0), width: 1)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(8.0.w),
            child: Container(
              height: 111.h,
              width: 112.w,
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(12.r),
                  image: DecorationImage(
                      image: AssetImage("assets/Rectangle 8.jpg"),
                      fit: BoxFit.fill)),
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 0.w, right: 8.w),
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 26.h,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(225, 222, 221, 236),
                            borderRadius: BorderRadius.circular(50.r)),
                        child: Padding(
                          padding: EdgeInsets.only(left: 10.w, right: 10.w),
                          child: Center(
                            child: Text(
                              "Jaipur",
                              style: GoogleFonts.roboto(
                                  fontSize: 12.w,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: -0.30,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 4.w, right: 8.w),
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 26.h,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(225, 222, 221, 236),
                            borderRadius: BorderRadius.circular(50.r)),
                        child: Padding(
                          padding: EdgeInsets.only(left: 10.w, right: 10.w),
                          child: Center(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.star,
                                color: Color(0xFF9088F1),
                                size: 13.w,
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Text(
                                "4.5 Review",
                                style: GoogleFonts.roboto(
                                    fontSize: 12.w,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: -0.30,
                                    color: Colors.black),
                              ),
                            ],
                          )),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                height: 0.5.h,
                width: 246.w,
                decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "Jennifer Johns",
                style: GoogleFonts.roboto(
                    color: Colors.black,
                    fontSize: 16.w,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 5.h,
              ),
              Container(
                width: 246.w,
                child: Text(
                  "Helping students land their dream jobs with 5+ years of placement coaching experience",
                  style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontSize: 12.w,
                      fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
