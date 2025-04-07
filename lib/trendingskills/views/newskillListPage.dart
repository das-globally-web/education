import 'package:educationapp/onlinePage.dart';
import 'package:educationapp/trendingskills/views/newskillListPage/service.newskillListPage/controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';

class Newskilllistpage extends ConsumerStatefulWidget {
  final String id;
  const Newskilllistpage({
    super.key,
    required this.id,
  });

  @override
  ConsumerState<Newskilllistpage> createState() => _NewskilllistpageState();
}

class _NewskilllistpageState extends ConsumerState<Newskilllistpage> {
  @override
  Widget build(BuildContext context) {
    final newskillListpageData = ref.watch(newskillListPageProvider(widget.id));
    return newskillListpageData.when(
      data: (data) {
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
                              child: Padding(
                                padding: const EdgeInsets.only(left: 4),
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  color: Color.fromARGB(255, 4, 0, 0),
                                  size: 16.w,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Spacer(),
                        Text(
                          "Mentor ",
                          style: GoogleFonts.roboto(
                              fontSize: 18.w,
                              color: Color.fromARGB(255, 255, 255, 255)),
                        ),
                        Spacer(),
                        Container(
                          height: 44.w,
                          width: 44.w,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 255, 255, 255),
                              borderRadius: BorderRadius.circular(500.r)),
                          child: Center(
                            child: Icon(
                              Icons.search,
                              color: Color(0xFF262626),
                              size: 30.w,
                            ),
                          ),
                        ),
                        // Spacer(),
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 111.h,
                          ),
                          Center(
                            child: Text(
                              data.data.fullName,
                              style: GoogleFonts.roboto(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: -0.95),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 100.w, right: 100.w),
                            child: Center(
                              child: Text(
                                data.data.description,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.roboto(
                                    color: Color(0xFF666666),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: -0.55),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 93,
                                height: 26,
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 222, 221, 236),
                                    borderRadius: BorderRadius.circular(40.r)),
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 8, right: 8),
                                    child: Text(
                                      data.data.serviceType.first,
                                      style: GoogleFonts.roboto(fontSize: 8.sp),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Container(
                                width: 76,
                                height: 26,
                                decoration: BoxDecoration(
                                    color: Color(0xFFDEDDEC),
                                    borderRadius: BorderRadius.circular(40.r)),
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 8, right: 8),
                                    child: Text(
                                      data.data.serviceType.last,
                                      style: GoogleFonts.roboto(
                                        fontSize: 8.sp,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Container(
                                width: 78,
                                height: 26,
                                decoration: BoxDecoration(
                                  color: Color(0xFFDEDDEC),
                                  borderRadius: BorderRadius.circular(40.r),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 6, right: 6),
                                    child: Row(
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
                                          style: GoogleFonts.roboto(
                                              fontSize: 8.sp),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () async {
                                  var box = Hive.box('userdata');
                                  // final storeMentordata = ref.watch(
                                  //   storeMentorProvider(
                                  //     StoreMentorBodyModel(
                                  //         userId: data.data.id,
                                  //         mentorIds: box.get('id').toString()),
                                  //   ).future,
                                  // );
                                  // if (storeMentordata != null) {
                                  //   Navigator.push(
                                  //       context,
                                  //       MaterialPageRoute(
                                  //         builder: (context) =>
                                  //             YourMentorPage(),
                                  //       ));
                                  // } else {
                                  //   ScaffoldMessenger.of(context)
                                  //       .showSnackBar(SnackBar(
                                  //     content:
                                  //         Text("failed to store mentor data!"),
                                  //   ));
                                  // }
                                  Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                          builder: (context) => OnlinePage(
                                                id: data.data.id.toString(),
                                                name: data.data.fullName,
                                              )));
                                },
                                child: Container(
                                  width: 157,
                                  height: 46,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 220, 248, 129),
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding:
                                          EdgeInsets.only(left: 10, right: 10),
                                      child: Text(
                                        "Contact me",
                                        style: GoogleFonts.roboto(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color:
                                              Color.fromARGB(255, 27, 27, 27),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 9),
                              Container(
                                width: 160,
                                height: 46,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(40),
                                  border: Border.all(
                                    width: 1,
                                    color: Color.fromARGB(255, 144, 136, 241),
                                  ),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding:
                                        EdgeInsets.only(left: 10, right: 10),
                                    child: Text(
                                      "Ask Referral ",
                                      style: GoogleFonts.roboto(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color:
                                            Color.fromARGB(255, 144, 136, 241),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 40.h,
                          ),
                          Divider(
                            color: Colors.grey.shade300,
                            height: 2,
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            child: Padding(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "About ${data.data.fullName}",
                                    style: GoogleFonts.roboto(
                                      fontSize: 15,
                                      color: Color.fromARGB(255, 27, 27, 27),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 7),
                                    child: Text(
                                      data.data.description,
                                      style: GoogleFonts.roboto(
                                        fontSize: 13,
                                        color:
                                            Color.fromARGB(255, 102, 102, 102),
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Divider(
                            color: Colors.grey.shade300,
                            height: 2,
                          ),
                          Container(
                            height: 0.13.sh,
                            width: MediaQuery.of(context).size.width,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 10.w, right: 10.w, top: 10.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Skills and Expertise",
                                    style: GoogleFonts.roboto(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Color.fromARGB(255, 27, 27, 27),
                                    ),
                                  ),
                                  SizedBox(height: 15.r),
                                  Container(
                                    height: 60.h,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                        color: Colors.transparent),
                                    child: ListView.builder(
                                        physics: NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        itemCount: data.data.serviceType.length,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: MySkillsContainer(
                                              txt: data.data.serviceType[index],
                                            ),
                                          );
                                        }),
                                  ),
                                  SizedBox(height: 10.r),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          Divider(
                            color: Colors.grey.shade300,
                            height: 2,
                          ),
                          SizedBox(
                            height: 10.h,
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
                                  crossAxisAlignment: CrossAxisAlignment.center,
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
                                        // Navigator.push(
                                        //     context,
                                        //     CupertinoPageRoute(
                                        //         builder: (context) =>
                                        //             ReviewPage(widget.id)));
                                      },
                                      child: Text(
                                        "View All",
                                        style: GoogleFonts.roboto(
                                            fontSize: 11.w,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xFF9088F1),
                                            textBaseline:
                                                TextBaseline.ideographic),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  bottom: 15.h, left: 10, right: 10),
                              child: Container(
                                width: 400,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.r),
                                    color: Color.fromARGB(255, 241, 242, 246)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
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
                                      Text(
                                        // "Rahul helped me prepare for my TCS interview, and I got the job! His tips are spot-on!",
                                        data.data.description,
                                        style: GoogleFonts.roboto(
                                            color: Color.fromARGB(
                                                255, 102, 102, 102),
                                            fontSize: 13.w,
                                            fontStyle: FontStyle.italic),
                                      ),
                                      SizedBox(
                                        height: 8.h,
                                      ),
                                      Text(
                                        // "- Vinod Shyam ",
                                        data.data.fullName,
                                        style: GoogleFonts.roboto(
                                            color: Color.fromARGB(255, 0, 0, 0),
                                            fontSize: 13.w,
                                            fontStyle: FontStyle.normal),
                                      )
                                    ],
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
                        "${data.data.profilePic}",
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
      error: (error, stackTrace) => Center(
        child: Text("Error : $error"),
      ),
      loading: () => Container(
        color: Color(0xFF9088F1),
        child: Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class MySkillsContainer extends StatefulWidget {
  final String txt;
  const MySkillsContainer({super.key, required this.txt});

  @override
  State<MySkillsContainer> createState() => _MySkillsContainerState();
}

class _MySkillsContainerState extends State<MySkillsContainer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 130,
          height: 32,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: Color.fromARGB(255, 222, 221, 236),
          ),
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(left: 6, right: 6),
              child: Text(
                widget.txt,
                style: GoogleFonts.roboto(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(255, 46, 46, 46),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
