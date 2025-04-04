import 'package:educationapp/home/controller/homeController.dart';
import 'package:educationapp/home/controller/service/searchMentorController.dart';
import 'package:educationapp/home/views/home.page.dart';
import 'package:educationapp/trendingskills/views/newskillListPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class FindMentorPage extends ConsumerStatefulWidget {
  const FindMentorPage({super.key});

  @override
  ConsumerState<FindMentorPage> createState() => _FindMentorPageState();
}

class _FindMentorPageState extends ConsumerState<FindMentorPage> {
  final searchController = TextEditingController();
  String searchquery = "";
  bool isSearching = false;
  int tabindex = 0;
  String query = "";
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
                          width: 250.w,
                          height: 50.h,
                          child: TextField(
                            onChanged: (value) {
                              setState(() {
                                searchquery = value;
                              });
                            },
                            controller: searchController,
                            decoration: InputDecoration(
                              suffixIcon: Icon(Icons.search),
                              filled: true,
                              fillColor: Colors.white,
                              hintText: "Search",
                              hintStyle: TextStyle(
                                color: Colors.black,
                                height: 2.3.h,
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
                        nowIndex: tabindex,
                        title: "All",
                        callBack: () {
                          setState(() {
                            tabindex = 0;
                            query = "";
                          });
                        },
                        currentIndex: Icons.arrow_drop_down_outlined,
                        index: 0,
                      ),
                      MyOption(
                        nowIndex: tabindex,
                        title: "Placements",
                        callBack: () {
                          setState(() {
                            tabindex = 1;
                            query = "/Placements";
                          });
                        },
                        currentIndex: Icons.arrow_drop_down_outlined,
                        index: 1,
                      ),
                      MyOption(
                        nowIndex: tabindex,
                        title: "Career",
                        callBack: () {
                          setState(() {
                            tabindex = 2;
                            query = "/Career";
                          });
                        },
                        currentIndex: Icons.arrow_drop_down_outlined,
                        index: 2,
                      ),
                      MyOption(
                        nowIndex: tabindex,
                        title: "Development",
                        callBack: () {
                          setState(() {
                            tabindex = 3;
                            query = "/Development";
                          });
                        },
                        currentIndex: Icons.arrow_drop_down_outlined,
                        index: 3,
                      ),
                      MyOption(
                        nowIndex: tabindex,
                        title: "Growth",
                        callBack: () {
                          setState(() {
                            tabindex = 4;
                            query = "/Growth";
                          });
                        },
                        currentIndex: Icons.arrow_drop_down_outlined,
                        index: 4,
                      ),
                      MyOption(
                        nowIndex: tabindex,
                        title: "Opportunities",
                        callBack: () {
                          setState(() {
                            tabindex = 5;
                            query = "/Opportunities";
                          });
                        },
                        currentIndex: Icons.arrow_drop_down_outlined,
                        index: 5,
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
                    FindMEntorBoduy(
                      query: query,
                    ),
                  ] else ...[
                    Expanded(
                      child: searchmentorprovider.when(
                        data: (mentors) => mentors.data.isNotEmpty
                            ? ListView.builder(
                                itemCount: mentors.data.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  Newskilllistpage(
                                                id: mentors.data[index].id
                                                    .toString(),
                                              ),
                                            ));
                                      },
                                      child: UserTabs(
                                        image: mentors.data[index].profilePic,
                                        id: mentors.data[index].id,
                                        fullname: mentors.data[index].fullName,
                                        dec: mentors.data[index].description,
                                        servicetype: mentors
                                            .data[index].serviceType
                                            .split(', '),
                                      ),
                                    ),
                                  );
                                },
                              )
                            : Center(
                                child: Text("No mentors found"),
                              ),
                        error: (error, stackTrace) => Center(
                          child: Text("Error: $error"),
                        ),
                        loading: () => SizedBox(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      ),
                    ),
                  ]
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
  final String query;
  const FindMEntorBoduy({super.key, required this.query});

  @override
  ConsumerState<FindMEntorBoduy> createState() => _FindMEntorBoduyState();
}

class _FindMEntorBoduyState extends ConsumerState<FindMEntorBoduy> {
  int curenttabindex = 7;

  @override
  Widget build(BuildContext context) {
    final mentorProvider = ref.watch(homeMentorsProvider(widget.query));
    return mentorProvider.when(
      data: (snapshot) {
        return Expanded(
          child: ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Newskilllistpage(
                            id: snapshot.data[index].id.toString(),
                          ),
                        ));
                  },
                  child: UserTabs(
                    image: snapshot.data[index].profilePic!,
                    id: snapshot.data[index].id,
                    fullname: snapshot.data[index].fullName.toString(),
                    dec: snapshot.data[index].description.toString(),
                    servicetype: snapshot.data[index].serviceType,
                  ),
                ),
              );
            },
          ),
        );
      },
      error: (err, stack) => Center(
          child: Center(
        child: Text(
          "Mentors not found",
          style: GoogleFonts.montserrat(color: Colors.black),
        ),
      )),
      loading: () => SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

class MyOption extends StatefulWidget {
  final String title;
  final Function callBack;
  final IconData currentIndex;
  final int nowIndex;
  final int index;
  const MyOption(
      {super.key,
      required this.title,
      required this.callBack,
      required this.currentIndex,
      required this.index,
      required this.nowIndex});

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
              color: widget.index == widget.nowIndex
                  ? Colors.white
                  : Colors.transparent,
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
                        color: widget.index == widget.nowIndex
                            ? Colors.black
                            : Colors.white),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Icon(
                    widget.currentIndex,
                    color: Colors.transparent,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
