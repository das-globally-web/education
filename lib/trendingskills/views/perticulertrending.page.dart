import 'package:educationapp/trendingskills/views/review.page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class PerticulerTrendingPage extends StatefulWidget {
  const PerticulerTrendingPage({super.key});

  @override
  State<PerticulerTrendingPage> createState() => _PerticulerTrendingPageState();
}

class _PerticulerTrendingPageState extends State<PerticulerTrendingPage> {
  List<String> items = [
    "Placement Expert",
    "Design Specialist",
    "Visualization Wizard",
    "Visualization Wizard",
    "Visualization Wizard",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF9088F1),
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Column(
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
                            color: Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.circular(500.r)),
                        child: Center(
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Color.fromARGB(255, 4, 0, 0),
                            size: 15.w,
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    Text(
                      "Trending ",
                      style: GoogleFonts.roboto(
                          fontSize: 24.w,
                          color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                    Text(
                      "Skills",
                      style: GoogleFonts.roboto(
                          fontSize: 24.w,
                          color: Color.fromARGB(255, 220, 248, 129)),
                    ),
                    Spacer(),
                    Container(
                      height: 44.h,
                      width: 44.w,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 254, 254, 254),
                        borderRadius: BorderRadius.circular(500.r),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.search,
                          color: const Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 30.w,
                    ),
                  ],
                ),
                SizedBox(
                  height: 150.h,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 111.h,
                      ),
                      Text(
                        "Jennifer Johns",
                        style: GoogleFonts.roboto(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            letterSpacing: -0.95),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 100.w, right: 100.w),
                        child: Text(
                          "Helping students land their dream jobs with 5+ years of placement coaching experience",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              letterSpacing: -0.55),
                        ),
                      ),
                      SizedBox(
                        height: 18.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 26,
                            decoration: BoxDecoration(
                                color: Color(0xFFDEDDEC),
                                borderRadius: BorderRadius.circular(40.r)),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.only(left: 15, right: 15),
                                child: Text(
                                  "Placement Expert",
                                  style: GoogleFonts.roboto(fontSize: 10.w),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Container(
                            height: 26,
                            decoration: BoxDecoration(
                                color: Color(0xFFDEDDEC),
                                borderRadius: BorderRadius.circular(40.r)),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.only(left: 15, right: 15),
                                child: Text(
                                  "Career Coach",
                                  style: GoogleFonts.roboto(fontSize: 10.w),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Container(
                            height: 26,
                            decoration: BoxDecoration(
                                color: Color(0xFFDEDDEC),
                                borderRadius: BorderRadius.circular(40.r)),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.only(left: 15, right: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Color(0xFF9088F1),
                                      size: 16,
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Text(
                                      "4.5 Review",
                                      style: GoogleFonts.roboto(fontSize: 10.w),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 38.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 46.h,
                            width: 46.w,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(25, 144, 136, 241),
                                borderRadius: BorderRadius.circular(40.r)),
                            child: Center(
                              child: Icon(
                                Icons.call_outlined,
                                color: Color.fromARGB(255, 144, 136, 241),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 46.h,
                            decoration: BoxDecoration(
                                color: Color(0xFFDCF881),
                                borderRadius: BorderRadius.circular(40.r)),
                            child: Center(
                              child: Padding(
                                padding:
                                    EdgeInsets.only(left: 40.w, right: 40.w),
                                child: Text(
                                  "Pay me",
                                  style: GoogleFonts.roboto(
                                      fontSize: 16.w,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 46.h,
                            width: 46.w,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(25, 144, 136, 241),
                                borderRadius: BorderRadius.circular(40.r)),
                            child: Center(
                              child: Icon(
                                Icons.mail_outline,
                                color: Color.fromARGB(255, 144, 136, 241),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 38,
                      ),
                      Divider(
                        color: Colors.grey.shade300,
                        height: 2,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20.w, right: 20.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "About Jennifer",
                                  style: GoogleFonts.roboto(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15.w),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(
                              "With over 5 years of experience, I've guided 300+ students to land jobs in top companies like Google, TCS, and Deloitte. My sessions focus on mock interviews, resume building, and effective communication",
                              style: GoogleFonts.roboto(
                                  color: Color.fromARGB(255, 102, 102, 102),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13.w),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Divider(
                        color: Colors.grey.shade300,
                        height: 2,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(left: 20.w, right: 20.w, top: 10.h),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Skills and Expertise",
                                  style: GoogleFonts.roboto(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15.w),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 12.h,
                            ),
                            Wrap(
                              spacing: 0.0,
                              runSpacing: 0.0,
                              children: items
                                  .map((item) => buildContainer(item))
                                  .toList(),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Divider(
                        color: Colors.grey.shade300,
                        height: 2,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(left: 20.w, right: 20.w, top: 10.h),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Reviews & Testimonials",
                                  style: GoogleFonts.roboto(
                                      color: const Color.fromARGB(255, 0, 0, 0),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15.w),
                                ),
                                Spacer(),
                                GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, CupertinoPageRoute(builder: (context)=> ReviewPage('2')));
                                  },
                                  child: Text("View All", style: GoogleFonts.roboto(fontSize: 11.w, fontWeight: FontWeight.w600, color: Color(0xFF9088F1) , textBaseline: TextBaseline.ideographic),))
                              ],
                            ),
                            ListView.builder(
                                itemCount: 4,
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.only(bottom: 15.h),
                                    child: Container(
                                      height: 110,
                                      width: 400,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20.r),
                                          color: Color.fromARGB(
                                              255, 241, 242, 246)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.star,
                                                  color: Color(0xFF9088F1),
                                                  size: 17,
                                                ),
                                                Icon(
                                                  Icons.star,
                                                  color: Color(0xFF9088F1),
                                                  size: 17,
                                                ),
                                                Icon(
                                                  Icons.star,
                                                  color: Color(0xFF9088F1),
                                                  size: 17,
                                                ),
                                                Icon(
                                                  Icons.star,
                                                  color: Color(0xFF9088F1),
                                                  size: 17,
                                                ),
                                                Icon(
                                                  Icons.star,
                                                  color: Color(0xFF9088F1),
                                                  size: 17,
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 8.h,
                                            ),
                                            Text("Rahul helped me prepare for my TCS interview, and I got the job! His tips are spot-on!", style: GoogleFonts.roboto(color: Color.fromARGB(255, 102, 102, 102), fontSize: 13.w, fontStyle: FontStyle.italic),),
                                            SizedBox(
                                              height: 8.h,
                                            ),
                                            Text("- Vinod Shyam ", style: GoogleFonts.roboto(color: Color.fromARGB(255, 0, 0, 0), fontSize: 11.w, fontStyle: FontStyle.normal),)
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                })
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 180.h, // Adjust for circle height
              child: Container(
                height: 182.h,
                width: 182.w,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 5),
                ),
                child: ClipOval(
                  child: Image.network(
                    'https://i.imgur.com/QB2NUBs.jpg', // Replace with your image URL
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildContainer(String title) {
    return Padding(
      padding: EdgeInsets.only(right: 8.w, bottom: 8.h),
      child: Container(
        height: 32.h,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 222, 221, 236),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 7.h),
          child: Text(
            title,
            style: GoogleFonts.roboto(fontSize: 12.w, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
