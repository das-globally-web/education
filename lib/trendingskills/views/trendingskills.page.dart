import 'package:educationapp/findmentor/view/findmentor.page.dart';
import 'package:educationapp/trendingskills/views/perticulertrending.page.dart';
import 'package:educationapp/trendingskills/views/skills.page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TrendingSkilsPage extends StatefulWidget {
  const TrendingSkilsPage({super.key});

  @override
  State<TrendingSkilsPage> createState() => _TrendingSkilsPageState();
}

class _TrendingSkilsPageState extends State<TrendingSkilsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Color(0xFF1B1B1B),
     body: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
                  "Trending ",
                  style: GoogleFonts.roboto(
                      fontSize: 24.w,
                      color: Color.fromARGB(255, 144, 136, 241)),
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
                        title: "Filter",
                        callBack: () {
                          setState(() {});
                        },
                        currentIndex: Icons.arrow_drop_down_outlined,
                        index: 0,
                      ),
                      MyOption(
                        title: "Study Level",
                        callBack: () {
                          setState(() {});
                        },
                        currentIndex: Icons.arrow_drop_down_outlined,
                        index: 1,
                      ),
                      MyOption(
                        title: "Type",
                        callBack: () {
                          setState(() {});
                        },
                        currentIndex: Icons.arrow_drop_down_outlined,
                        index: 2,
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
              child: TrendingSkillsBody (),
            ),
        ],
      ),
     ),
    );
  }
}


class TrendingSkillsBody extends StatefulWidget {
  const TrendingSkillsBody({super.key});

  @override
  State<TrendingSkillsBody> createState() => _TrendingSkillsBodyState();
}

class _TrendingSkillsBodyState extends State<TrendingSkillsBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top: 15.h, right: 10.w, left: 10.w),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of items per row
          crossAxisSpacing: 20, // Spacing between columns
          mainAxisSpacing: 20, // Spacing between rows
        ),
        itemCount: 8, // Total items
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.all(10),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: (){
              Navigator.push(context, CupertinoPageRoute(builder: (context) => SkillListPage()));
            },
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 241, 242, 246),
                borderRadius: BorderRadius.circular(20.w),
              ),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 58.h,
                    width: 58.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(500.r),
                      color: Color(0xFF9088F1)
                    ),
                    child: Center(
                      child: Image.asset("assets/image 3.png"),
                    ),
                  ),
                  SizedBox(
                  height: 5.h,
                  ),
                  Text("Beginner", style: GoogleFonts.montserrat(color: Color(0xFF9088F1), fontSize: 13.w, fontWeight: FontWeight.w400),),
                  SizedBox(
                  height: 5.h,
                  ),
                  Text("Java Development", style: GoogleFonts.montserrat(color: Color.fromARGB(255, 0, 0, 0), fontSize: 16.w, fontWeight: FontWeight.w600, letterSpacing: -0.95),),
                  SizedBox(
                  height: 3.h,
                  ),
                  Padding(
                    padding:  EdgeInsets.only(left: 4.2.w, right: 4.2.w),
                    child: Text("Guiding aspiring entrepreneurs through business development strategies",
                    textAlign: TextAlign.center,
                     style: GoogleFonts.montserrat(color: Color(0xFF666666), fontSize: 11.w, fontWeight: FontWeight.w400),),
                  ),
                ],
              )
            ),
          );
        },
      ),
    );
  }
}