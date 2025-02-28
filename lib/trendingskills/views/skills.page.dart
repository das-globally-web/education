import 'package:educationapp/home/controller/homeController.dart';
import 'package:educationapp/home/views/home.page.dart';
import 'package:educationapp/trendingskills/controller/sikllscontroller.dart';
import 'package:educationapp/trendingskills/views/newskillListPage.dart';
import 'package:educationapp/trendingskills/views/perticulertrending.page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SkillListPage extends ConsumerStatefulWidget {
  final String id;
  final String name;
  final String subtitle;
  final String description;
  final String image;
  const SkillListPage(
      {super.key,
      required this.id,
      required this.name,
      required this.subtitle,
      required this.image,
      required this.description});

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
                          // color: Color(0xFF9088F1),
                          borderRadius: BorderRadius.circular(100.r),
                          image: DecorationImage(
                              image: NetworkImage(
                                  'http://education.globallywebsolutions.com/public/${widget.image}')),
                        ),
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${widget.name}",
                            style: GoogleFonts.roboto(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 16.w),
                          ),
                          SizedBox(
                            width: 280.w,
                            child: Text(
                              "${widget.subtitle}",
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.roboto(
                                  fontSize: 11.w,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF9088F1)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  //   crossAxisAlignment: CrossAxisAlignment.center,
                  //   children: [
                  //     Padding(
                  //       padding:
                  //           EdgeInsets.only(left: 20.w, right: 20.w, top: 10.h),
                  //       child: Text(
                  //         "${widget.description}",
                  //         style: GoogleFonts.roboto(
                  //             fontWeight: FontWeight.w400,
                  //             fontSize: 12.w,
                  //             color: Colors.white),
                  //       ),
                  //     )
                  //   ],
                  // )
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
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
                          width: 12.w,
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
                            padding: EdgeInsets.only(bottom: 8.h),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Newskilllistpage(
                                      id: data.data[index].id.toString(),
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                height: 127.h,
                                width: 400.w,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20.r),
                                    border: Border.all(
                                        color: Color.fromARGB(25, 0, 0, 0),
                                        width: 1)),
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
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(12.r),
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  "http://education.globallywebsolutions.com/public/${data.data[index].image}"),
                                              fit: BoxFit.fill),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        Text(
                                          data.data[index].fullName,
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
                                            overflow: TextOverflow.ellipsis,
                                            data.data[index].description,
                                            style: GoogleFonts.roboto(
                                                color: Colors.black,
                                                fontSize: 12.w,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5.h,
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
                                        SizedBox(
                                          height: 30.h,
                                          width: 280.w,
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: 0.w, right: 8.w),
                                                child: Container(
                                                  height: 26.h,
                                                  decoration: BoxDecoration(
                                                    color: Color.fromARGB(
                                                        225, 222, 221, 236),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50.r),
                                                  ),
                                                  child: Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 10.w,
                                                        right: 10.w),
                                                    child: Center(
                                                      child: Text(
                                                        data.data[index].title,
                                                        style:
                                                            GoogleFonts.roboto(
                                                                fontSize: 12.w,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                letterSpacing:
                                                                    -0.30,
                                                                color: Colors
                                                                    .black),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: 0.w, right: 8.w),
                                                child: Container(
                                                  height: 26.h,
                                                  decoration: BoxDecoration(
                                                    color: Color.fromARGB(
                                                        225, 222, 221, 236),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50.r),
                                                  ),
                                                  width: 130.w,
                                                  child: Center(
                                                    child: Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 10.w,
                                                          right: 10.w),
                                                      child: Text(
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        data.data[index]
                                                            .description,
                                                        style:
                                                            GoogleFonts.roboto(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 12.w,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
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
