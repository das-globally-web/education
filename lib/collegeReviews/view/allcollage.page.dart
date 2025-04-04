import 'dart:developer';
import 'package:educationapp/collegeReviews/controller/collage.controller.dart';
import 'package:educationapp/collegeReviews/controller/service/searchCollageController.dart';
import 'package:educationapp/collegeReviews/view/perticuler.collage.dart';
import 'package:educationapp/findmentor/view/findmentor.page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AllCollage extends ConsumerStatefulWidget {
  const AllCollage({super.key});

  @override
  ConsumerState<AllCollage> createState() => _AllCollageState();
}

class _AllCollageState extends ConsumerState<AllCollage> {
  final searchCollageController = TextEditingController();
  String searchCollage = "";
  bool isSearching = false;
  String? selectedValue; // Store selected value
  @override
  Widget build(BuildContext context) {
    final searchcollageprovider =
        ref.watch(searchCollageProvider(searchCollageController.text));
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
                        ],
                      )
                    : Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Container(
                          width: 250.w,
                          height: 50.h,
                          child: TextField(
                            onChanged: (value) {
                              setState(() {
                                searchCollage = value;
                              });
                            },
                            textAlign: TextAlign.start,
                            controller: searchCollageController,
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
                // Text(
                //   "College Review",
                //   style: GoogleFonts.roboto(
                //       fontSize: 18.w,
                //       color: Color.fromARGB(255, 220, 248, 129)),
                // ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isSearching = !isSearching;
                      if (!isSearching) {
                        searchCollageController.clear();
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

                // SizedBox(
                //   height: 30.h,
                //   width: 440.w - 11.h,
                //   child: ListView(
                //     scrollDirection: Axis.horizontal,
                //     shrinkWrap: true,
                //     children: [
                //       MyOption(
                //         nowIndex: tabindex,
                //         title: "Filters",
                //         callBack: () {
                //           setState(() {
                //             tabindex = 0;
                //             query = 'Filters';
                //           });
                //         },
                //         currentIndex: Icons.arrow_drop_down_outlined,
                //         index: 0,
                //       ),
                //       MyOption(
                //         nowIndex: tabindex,
                //         title: "Skills",
                //         callBack: () {
                //           setState(() {
                //             tabindex = 1;
                //             query = 'Skills';
                //           });
                //         },
                //         currentIndex: Icons.arrow_drop_down_outlined,
                //         index: 1,
                //       ),
                //       MyOption(
                //         nowIndex: tabindex,
                //         title: "Rating",
                //         callBack: () {
                //           setState(() {
                //             tabindex = 2;
                //             query = 'Rating';
                //           });
                //         },
                //         currentIndex: Icons.arrow_drop_down_outlined,
                //         index: 2,
                //       ),
                //       MyOption(
                //         nowIndex: tabindex,
                //         title: "Location",
                //         callBack: () {
                //           setState(() {
                //             tabindex = 3;
                //             query = 'Location';
                //           });
                //         },
                //         currentIndex: Icons.arrow_drop_down_outlined,
                //         index: 3,
                //       ),
                //     ],
                //   ),
                // )
                // DropdownButton<String>(
                //   value: selectedValue,
                //   items: [
                //     DropdownMenuItem(
                //       child: Text("Flutter Developer"),
                //     ),
                //     DropdownMenuItem(
                //       child: Text("Laravel Developer"),
                //     ),
                //     DropdownMenuItem(
                //       child: Text("Web Designer"),
                //     ),
                //   ],

                // FiltterDropdown(
                //   title: 'Skills',
                //   callback: () {
                //     DropdownButton<String>(
                //       value: selectedValue,
                //       hint: Text("Select an option"),
                //       icon: Icon(Icons.keyboard_arrow_down_rounded,
                //           color: Colors.white),
                //       dropdownColor:
                //           Colors.grey[800], // Change dropdown background color
                //       items: [
                //         DropdownMenuItem(
                //             value: "Setting", child: Text("Setting")),
                //         DropdownMenuItem(value: "Home", child: Text("Home")),
                //       ],
                //       onChanged: (value) {
                //         setState(() {
                //           selectedValue = value;
                //         });
                //         print("Selected: $value");
                //       },
                //     );
                //     // final selectedValue = showMenu(
                //     //   context: context,
                //     //   position: RelativeRect.fromLTRB(
                //     //       100, 100, 0, 0), // Adjust position
                //     //   items: [
                //     //     PopupMenuItem(
                //     //       value: "Setting",
                //     //       child: Text("Setting"),
                //     //     ),
                //     //     PopupMenuItem(
                //     //       value: "Home",
                //     //       child: Text("Home"),
                //     //     ),
                //     //   ],
                //     // );

                //     // if (selectedValue != null) {
                //     //   print("Selected: $selectedValue");
                //     // }
                //   },
                // ),
                // FiltterDropdown(
                //   title: 'Rating',
                //   callback: () {},
                // ),
                // FiltterDropdown(
                //   title: 'Location',
                //   callback: () {},
                //),
                // GestureDetector(
                //   onTap: () async {
                //     final selectedValue = await showMenu(
                //       context: context,
                //       position: RelativeRect.fromLTRB(
                //           100, 100, 0, 0), // Adjust position
                //       items: [
                //         PopupMenuItem(
                //           value: "Setting",
                //           child: Text("Setting"),
                //         ),
                //         PopupMenuItem(
                //           value: "Home",
                //           child: Text("Home"),
                //         ),
                //       ],
                //     );

                //     if (selectedValue != null) {
                //       print("Selected: $selectedValue");
                //     }
                //   },
                //   child: Icon(
                //     Icons.keyboard_arrow_down_rounded,
                //     color: Colors.white,
                //     size: 30,
                //   ),
                // ),
              ],
            ),
            SizedBox(
              height: 0.h,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(30.r)),
              child: Column(
                children: [
                  if (!isSearching) ...[
                    AllCollageBody(),
                  ] else ...[
                    searchcollageprovider.when(
                      data: (collage) => collage.data.isNotEmpty
                          ? ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: collage.data.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                          builder: (context) =>
                                              PerticulerCollagePage(
                                            collage.data[index].id.toString(),
                                          ),
                                        ),
                                      );
                                    },
                                    child: UniversityTab(
                                      name: collage.data[index].collageName
                                          .toString(),
                                      city: collage.data[index].city.toString(),
                                      description: collage
                                          .data[index].collageDescription
                                          .toString(),
                                      rating: collage.data[index].id.toString(),
                                      image:
                                          collage.data[index].image.toString(),
                                    ),
                                  ),
                                );
                              },
                            )
                          : Center(
                              child: Text("No mentors found"),
                            ),
                      error: (error, stackTrace) => SizedBox(
                        height: MediaQuery.of(context).size.height / 1.1,
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: Text(
                            "Collage not found",
                            style: GoogleFonts.montserrat(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      loading: () => SizedBox(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    ),
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

class FiltterDropdown extends StatefulWidget {
  final String title;
  final Function callback;
  const FiltterDropdown(
      {super.key, required this.title, required this.callback});

  @override
  State<FiltterDropdown> createState() => _FiltterDropdownState();
}

class _FiltterDropdownState extends State<FiltterDropdown> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 4.w, right: 8.w),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          height: 30.h,
          decoration: BoxDecoration(
              color:
                  // ? Colors.white
                  Colors.transparent,
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
                  GestureDetector(
                    onTap: () {
                      widget.callback();
                    },
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.white,
                    ),
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
                                builder: (context) => PerticulerCollagePage(
                                      snapshot.data[index].id.toString(),
                                    )));
                      },
                      child: UniversityTab(
                        name: snapshot.data[index].collageName,
                        city: snapshot.data[index].city,
                        description: snapshot.data[index].collageDescription,
                        rating: snapshot.data[index].avgRating.toString(),
                        image: snapshot.data[index].image.toString(),
                      )),
                );
              });
        },
        error: (err, stack) {
          return Text(err.toString());
        },
        loading: () => SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ));
  }
}

class UniversityTab extends StatefulWidget {
  final String name;
  final String city;
  final String rating;
  final String description;
  final String image;
  const UniversityTab(
      {super.key,
      required this.name,
      required this.city,
      required this.rating,
      required this.description,
      required this.image});

  @override
  State<UniversityTab> createState() => _UniversityTabState();
}

class _UniversityTabState extends State<UniversityTab> {
  @override
  Widget build(BuildContext context) {
    log(widget.image);
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
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.r),
                image: DecorationImage(
                    image: NetworkImage("${widget.image}"), fit: BoxFit.fill),
              ),
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
                height: 20.h,
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
                            ),
                          ),
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
              Container(
                width: 246.w,
                child: Text(
                  widget.name,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontSize: 16.w,
                      fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Container(
                width: 246.w,
                child: Text(
                  widget.description,
                  overflow: TextOverflow.ellipsis,
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
