import 'package:educationapp/config/preety.dio.dart';
import 'package:educationapp/findmentor/model/allmentors.model.dart';
import 'package:educationapp/home/controller/homeController.dart';
import 'package:educationapp/home/controller/service/home.service.dart';
import 'package:educationapp/home/controller/service/searchMentorController.dart';
import 'package:educationapp/home/model/mentors.model.dart';
import 'package:educationapp/home/model/userprofile.model.dart';
import 'package:educationapp/home/views/home.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';

class FindMentorPage extends ConsumerStatefulWidget {
  const FindMentorPage({super.key});

  @override
  ConsumerState<FindMentorPage> createState() => _FindMentorPageState();
}

class _FindMentorPageState extends ConsumerState<FindMentorPage> {
  final searchController = TextEditingController();
  String searchquery = "";
  bool isSearching = false;
  @override
  Widget build(BuildContext context) {
    final searchmentorprovider = ref.watch(searchMentorProvider(searchquery));
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
                !isSearching
                    ? Row(
                        children: [
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
                        ],
                      )
                    : Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Container(
                          width: 200.w,
                          height: 40.w,
                          child: TextField(
                            onChanged: (value) {
                              setState(() {
                                searchquery = value;
                              });
                            },
                            textAlign: TextAlign.start,
                            controller: searchController,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: () {
                                 setState(() {
                                    searchquery = searchController.text;
                                 });
                                },
                                icon: Icon(Icons.search),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              hintText: "Search",
                              hintStyle: TextStyle(
                                color: Colors.black,
                                height: 1.8,
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                        ),
                      ),

                // Text(
                //   "Mentor",
                //   style: GoogleFonts.roboto(
                //       fontSize: 24.w,
                //       color: Color.fromARGB(255, 220, 248, 129)),
                // ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isSearching = !isSearching;
                      if (!isSearching) {
                        searchController.clear();
                      }
                    });
                  },
                  child: Container(
                    height: 44.h,
                    width: 44.w,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(25, 255, 255, 255),
                      borderRadius: BorderRadius.circular(500.r),
                    ),
                    child: Center(
                      child: Icon(
                        isSearching ? Icons.close : Icons.search,
                        color: Colors.white,
                      ),
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
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(30.r)),
              child: Column(
                children: [
                  if (!isSearching) ...[
                    FindMEntorBoduy(),
                  ] else ...[
                    Expanded(
                      child: searchmentorprovider.when(
                        data: (mentors) => mentors.data.isNotEmpty
                            ? ListView.builder(
                                itemCount: mentors.data.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: UserTabs(
                                      id: mentors.data[index].id,
                                      fullname: mentors.data[index].fullName,
                                      dec: mentors.data[index].description,
                                      servicetype: [],
                                    ),
                                  );
                                },
                              )
                            : Center(
                                child: Text(
                                    "No mentors found")), // अगर कोई डेटा नहीं मिला
                        error: (error, stackTrace) => Center(
                          child: Text("Error: $error"),
                        ),
                        loading: () => Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    )
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FindMEntorBoduy extends ConsumerStatefulWidget {
  const FindMEntorBoduy({super.key});

  @override
  ConsumerState<FindMEntorBoduy> createState() => _FindMEntorBoduyState();
}

class _FindMEntorBoduyState extends ConsumerState<FindMEntorBoduy> {
  int curenttabindex = 7;

  @override
  Widget build(BuildContext context) {
    final mentorProvider = ref.watch(homeMentorsProvider);
    return mentorProvider.when(
      data: (snapshot) {
        return Expanded(
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: UserTabs(
                  id: snapshot.data[index].id,
                  fullname: snapshot.data[index].fullName.toString(),
                  dec: snapshot.data[index].description.toString(),
                  servicetype: snapshot.data[index].serviceType,
                ),
              );
            },
          ),
        );
      },
      error: (err, stack) => Center(
        child: Text(err.toString()),
      ),
      loading: () => Center(
        child: CircularProgressIndicator(),
      ),
    );
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
