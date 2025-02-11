import 'package:educationapp/collegeReviews/controller/collage.controller.dart';
import 'package:educationapp/collegeReviews/view/perticuler.collage.dart';
import 'package:educationapp/findmentor/view/findmentor.page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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

class AllCollageBody extends ConsumerStatefulWidget {
  const AllCollageBody({super.key});

  @override
  _AllCollageBodyState createState() => _AllCollageBodyState();
}

class _AllCollageBodyState extends ConsumerState<AllCollageBody> {
  int curenttabindex = 7;
  @override
  Widget build(BuildContext context) {
    final collages = ref.watch(callagesProviders);
    return collages.when(
        data: (snapshot) {
          return ListView.builder(
              itemCount: snapshot.data.length,
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
                                builder: (context) => PerticulerCollagePage(snapshot.data[index].id.toString())));
                      },
                      child: UniversityTab(
                        name: snapshot.data[index].collageName,
                        city: snapshot.data[index].city,
                        description: snapshot.data[index].collageDescription,
                        rating: snapshot.data[index].avgRating.toString(),
                      )),
                );
              });
        },
        error: (err, stack) {
          return Text(err.toString());
        },
        loading: () => Center(
              child: CircularProgressIndicator(),
            ));
  }
}

class UniversityTab extends StatefulWidget {
  final String name;
  final String city;
  final String rating;
  final String description;
  const UniversityTab(
      {super.key,
      required this.name,
      required this.city,
      required this.rating,
      required this.description});

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
                              widget.city,
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
                                "${widget.rating} Review",
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
                widget.name,
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
                  widget.description,
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
