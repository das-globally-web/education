import 'package:educationapp/home/controller/homeController.dart';
import 'package:educationapp/home/views/home.page.dart';
import 'package:educationapp/trendingskills/controller/sikllscontroller.dart';
import 'package:educationapp/trendingskills/views/perticulertrending.page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SkillListPage extends ConsumerStatefulWidget {
  final int id;
  const SkillListPage(this.id, {super.key});

  @override
  ConsumerState<SkillListPage> createState() => _SkillListPageState();
}

class _SkillListPageState extends ConsumerState<SkillListPage> {
  @override
  Widget build(BuildContext context) {
    final newskillprovider = ref.watch(newskillsProvider(widget.id.toString()));
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
                  "Trending ",
                  style: GoogleFonts.roboto(
                      fontSize: 18.w,
                      color: Color.fromARGB(255, 144, 136, 241)),
                ),
                Text(
                  "Skills",
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
              height: 25.h,
            ),
            Container(
              height: 108.h,
              width: 400.w,
              decoration: BoxDecoration(
                  color: Color(0xFF262626),
                  borderRadius: BorderRadius.circular(20.w)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 20.w,
                      ),
                      Container(
                        height: 46.h,
                        width: 46.w,
                        decoration: BoxDecoration(
                            color: Color(0xFF9088F1),
                            borderRadius: BorderRadius.circular(100.r),
                            image: DecorationImage(
                                image:
                                    AssetImage('assets/Mask group (1).png'))),
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Beginner",
                            style: GoogleFonts.roboto(
                                fontSize: 11.w,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF9088F1)),
                          ),
                          Text(
                            "UX/UI",
                            style: GoogleFonts.roboto(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 16.w),
                          )
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 20.w, right: 20.w, top: 10.h),
                    child: Text(
                      "Guiding aspiring entrepreneurs through business development strategies",
                      style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w400,
                          fontSize: 12.w,
                          color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.r),
                      topRight: Radius.circular(40.r))),
              child: Padding(
                padding: const EdgeInsets.all(7.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 12.r,
                        ),
                        Text(
                          "Expert in UX/UI",
                          style: GoogleFonts.roboto(
                              fontSize: 20.w, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    newskillprovider.when(data: (data) {
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: data.data.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: UserTabs(
                              id: data.data[index].id,
                              fullname: data.data[index].fullName,
                              dec: data.data[index].description,
                              servicetype: [],
                            ),
                          );
                        },
                      );
                    }, error: (error, stackTrace) {
                      return Center(
                        child: Text("Error :$error"),
                      );
                    }, loading: () {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }),

                    // ListView.builder(
                    //     itemCount: 5,
                    //     shrinkWrap: true,
                    //     physics: NeverScrollableScrollPhysics(),
                    //     itemBuilder: (context, index) {
                    //       return Padding(
                    //         padding: const EdgeInsets.all(8.0),
                    //         child: GestureDetector(
                    //           onTap: () {
                    //             Navigator.push(
                    //                 context,
                    //                 CupertinoPageRoute(
                    //                     builder: (context) =>
                    //                         PerticulerTrendingPage()));
                    //           },
                    //           // child: UserTabs()
                    //           child: SizedBox(),
                    //         ),
                    //       );
                    //     }),
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
