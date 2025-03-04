import 'dart:developer';

import 'package:educationapp/collegeReviews/controller/collage.controller.dart';
import 'package:educationapp/trendingskills/views/controller.review/reviewController.dart';
import 'package:educationapp/trendingskills/views/review.page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class PerticulerCollagePage extends ConsumerStatefulWidget {
  final String id;
  const PerticulerCollagePage(this.id, {super.key});

  @override
  ConsumerState<PerticulerCollagePage> createState() =>
      _PerticulerCollagePageState();
}

class _PerticulerCollagePageState extends ConsumerState<PerticulerCollagePage> {
  List<String> items = [
    "Placement Expert",
    "Design Specialist",
    "Visualization Wizard",
    "Visualization Wizard",
    "Visualization Wizard",
  ];
  @override
  Widget build(BuildContext context) {
    final particularProvider = ref.watch(addreviewProvider("${widget.id}"));
    final perticulerCollageData =
        ref.watch(perticulerCollageProvider(widget.id));

    return Scaffold(
        body: perticulerCollageData.when(
      data: (snap) {
        List<String> departments = snap.data.branch!.split(', ');
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
                            height: 44.w,
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
                          "College Review",
                          style: GoogleFonts.roboto(
                              fontSize: 18.w,
                              color: Color.fromARGB(255, 255, 255, 255)),
                        ),
                        Spacer(),
                        SizedBox(
                          width: 70.w,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 150.h,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 111.h,
                          ),
                          Text(
                            snap.data.collageName,
                            style: GoogleFonts.roboto(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                letterSpacing: -0.95),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(left: 100.w, right: 100.w),
                            child: Text(
                              "${snap.data.collageDescription}",
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
                                    borderRadius:
                                        BorderRadius.circular(40.r)),
                                child: Center(
                                  child: Padding(
                                    padding:
                                        EdgeInsets.only(left: 15, right: 15),
                                    child: Text(
                                      snap.data.city,
                                      style:
                                          GoogleFonts.roboto(fontSize: 10.w),
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
                                    borderRadius:
                                        BorderRadius.circular(40.r)),
                                child: Center(
                                  child: Padding(
                                    padding:
                                        EdgeInsets.only(left: 15, right: 15),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
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
                                          "${snap.data.avgRating == null ? "3" : snap.data.avgRating.toStringAsFixed(1)} Review",
                                          style: GoogleFonts.roboto(
                                              fontSize: 10.w),
                                        )
                                      ],
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
                                    borderRadius:
                                        BorderRadius.circular(40.r)),
                                child: Center(
                                  child: Padding(
                                    padding:
                                        EdgeInsets.only(left: 15, right: 15),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Seat intake ${snap.data.seat_intake}",
                                          style: GoogleFonts.roboto(
                                              fontSize: 10.w),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Divider(
                            color: Colors.grey.shade300,
                            height: 2,
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 15.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Branches",
                                  style: GoogleFonts.roboto(
                                      color:
                                          const Color.fromARGB(255, 0, 0, 0),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15.w),
                                ),
                                Spacer(),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 50.h,
                            width: MediaQuery.of(context).size.width,
                            child: Padding(
                              padding: EdgeInsets.only(left: 8.0.w),
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: departments.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: EdgeInsets.all(4.0.w),
                                      child: Container(
                                        height: 26,
                                        decoration: BoxDecoration(
                                            color: Color(0xFFDEDDEC),
                                            borderRadius:
                                                BorderRadius.circular(40.r)),
                                        child: Center(
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                left: 15, right: 15),
                                            child: Text(
                                              departments[index],
                                              style: GoogleFonts.roboto(
                                                  fontSize: 10.w),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Divider(
                            color: Colors.grey.shade300,
                            height: 2,
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 20.w, right: 20.w, top: 10.h),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Reviews & Testimonials",
                                      style: GoogleFonts.roboto(
                                          color: const Color.fromARGB(
                                              255, 0, 0, 0),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15.w),
                                    ),
                                    Spacer(),
                                    GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              CupertinoPageRoute(
                                                  builder: (context) =>
                                                      ReviewPage(widget.id)));
                                        },
                                        child: Text(
                                          "View All",
                                          style: GoogleFonts.roboto(
                                              fontSize: 11.w,
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xFF9088F1),
                                              textBaseline:
                                                  TextBaseline.ideographic),
                                        ))
                                  ],
                                ),
                                particularProvider.when(
                                  data: (data) {
                                    return ListView.builder(
                                      itemCount: data.data.length,
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding:
                                              EdgeInsets.only(bottom: 15.h),
                                          child: Container(
                                            width: 400,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        20.r),
                                                color: Color.fromARGB(
                                                    255, 241, 242, 246)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        Icons.star,
                                                        color:
                                                            Color(0xFF9088F1),
                                                        size: 17,
                                                      ),
                                                      Icon(
                                                        Icons.star,
                                                        color:
                                                            Color(0xFF9088F1),
                                                        size: 17,
                                                      ),
                                                      Icon(
                                                        Icons.star,
                                                        color:
                                                            Color(0xFF9088F1),
                                                        size: 17,
                                                      ),
                                                      Icon(
                                                        Icons.star,
                                                        color:
                                                            Color(0xFF9088F1),
                                                        size: 17,
                                                      ),
                                                      Icon(
                                                        Icons.star,
                                                        color:
                                                            Color(0xFF9088F1),
                                                        size: 17,
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 8.h,
                                                  ),
                                                  Text(
                                                    data.data[index]
                                                        .description,
                                                    style: GoogleFonts.roboto(
                                                        color: Color.fromARGB(
                                                            255,
                                                            102,
                                                            102,
                                                            102),
                                                        fontSize: 13.w,
                                                        fontStyle:
                                                            FontStyle.italic),
                                                  ),
                                                  SizedBox(
                                                    height: 8.h,
                                                  ),
                                                  Text(
                                                    "-${data.data[index].userName}",
                                                    style: GoogleFonts.roboto(
                                                        color: Color.fromARGB(
                                                            255, 0, 0, 0),
                                                        fontSize: 13.w,
                                                        fontStyle:
                                                            FontStyle.normal),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  error: (error, stackTrace) {
                                    return Center(
                                      child: Text("Error:$error"),
                                    );
                                  },
                                  loading: () {
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  },
                                ),
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
                    height: 182.w,
                    width: 182.w,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 5),
                    ),
                    child: ClipOval(
                      child: Image.network(
                        snap.data.image, // Replace with your image URL
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      error: (err, stack) {
        return Center(
          child: Text(err.toString()),
        );
      },
      loading: () => Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Color(0xFF9088F1),
        child: Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
      ),
    ));
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
