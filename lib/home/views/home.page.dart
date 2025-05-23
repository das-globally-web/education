import 'dart:collection';
import 'dart:developer';
import 'package:educationapp/collegeReviews/controller/collage.controller.dart';
import 'package:educationapp/collegeReviews/view/allcollage.page.dart';
import 'package:educationapp/collegeReviews/view/perticuler.collage.dart';
import 'package:educationapp/findmentor/view/findmentor.page.dart';
import 'package:educationapp/home/controller/homeController.dart';
import 'package:educationapp/home/views/chatInbox.dart';
import 'package:educationapp/splash/views/splash.page.dart';
import 'package:educationapp/trendingskills/controller/sikllscontroller.dart';
import 'package:educationapp/trendingskills/views/newskillListPage.dart';
import 'package:educationapp/trendingskills/views/trendingskills.page.dart';
import 'package:educationapp/wallet/views/wallet.page.dart';
import 'package:educationapp/wallet/walletController.dart';
import 'package:educationapp/yourMentorController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String? _username;
  String filterQuery = "";
  @override
  void initState() {
    super.initState();

    // Read the providers once when the page loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.invalidate(skilssProvide);
      ref.invalidate(walletProvider);
      ref.invalidate(homeMentorsProvider(filterQuery));
      ref.invalidate(callagesProviders);
      ref.invalidate(companyReviewProvider);
      ref.invalidate(yourMentorProvider('46'));
    });
  }

  String limitString(String text, int limit) {
    if (text.length <= limit) return text;
    return '${text.substring(0, limit)}..';
  }

  @override
  Widget build(BuildContext context) {
    var box = Hive.box('userdata');
    final skilsProvider = ref.watch(skilssProvide);
    final wallteserviceProvider = ref.watch(walletProvider);
    final homementrosprovider = ref.watch(homeMentorsProvider(filterQuery));
    final collages = ref.watch(callagesProviders);
    final companyreviewData = ref.watch(companyReviewProvider);

    final yourmentorData = ref.watch(yourMentorProvider('46'));
    // ref.invalidate(skilssProvide);
    // ref.invalidate(walletProvider);
    // ref.invalidate(homeMentorsProvider);
    // ref.invalidate(callagesProviders);
    // ref.invalidate(companyReviewProvider);
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color(0xFF1B1B1B),
      drawer: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: 280,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(30.r)),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 250.h,
                width: 280,
                // width: 289.w,
                decoration: BoxDecoration(
                  color: Color(0xFF9088F1),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.r),
                    topRight: Radius.circular(30.r),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 20, top: 20),
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Icon(
                              Icons.arrow_back_ios,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 25, left: 10),
                            height: 50.h,
                            width: 50.w,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(25, 255, 255, 255),
                                borderRadius: BorderRadius.circular(500.r),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage("${box.get('pic')}"))),
                          ),
                          // Container(
                          //   margin: EdgeInsets.only(top: 25),
                          //   height: 38,
                          //   decoration: BoxDecoration(
                          //       color: Color(0xFFDCF881),
                          //       borderRadius: BorderRadius.circular(40.r)),
                          //   child: Center(
                          //     child: Padding(
                          //       padding:
                          //           EdgeInsets.only(left: 12.w, right: 12.w),
                          //       child: Text(
                          //         "Edit Profile",
                          //         style: GoogleFonts.roboto(
                          //             color: Color(0xFF1B1B1B), fontSize: 12.w),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 10, left: 10),
                          child: Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              "${box.get('name')}",
                              style: GoogleFonts.roboto(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              "${box.get('email')}",
                              style: GoogleFonts.roboto(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FindMentorPage(),
                      ));
                },
                leading: Container(
                  child: Image.asset("assets/cartoon.png"),
                ),
                title: Text(
                  "Find a Mentor",
                  style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color.fromARGB(255, 27, 27, 27),
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => TrendingSkilsPage()));
                },
                leading: Container(
                  child: Image.asset("assets/cartoon.png"),
                ),
                title: Text(
                  "Trending Skills",
                  style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color.fromARGB(255, 27, 27, 27),
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AllCollage(),
                      ));
                },
                leading: Container(
                  child: Image.asset("assets/cartoon.png"),
                ),
                title: Text(
                  "Explore College Reviews",
                  style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color.fromARGB(255, 27, 27, 27),
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WalletPage(),
                      ));
                },
                leading: Container(
                  child: Image.asset("assets/cartoon.png"),
                ),
                title: Text(
                  "Wallet",
                  style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color.fromARGB(255, 56, 18, 18),
                  ),
                ),
              ),
              Divider(),
              ListTile(
                leading: Icon(
                  Icons.logout,
                  color: Color.fromARGB(255, 27, 27, 27),
                ),
                title: Text(
                  "Logout",
                  style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color.fromARGB(255, 27, 27, 27),
                  ),
                ),
                onTap: () async {
                  log("Clearing data ......");
                  await StoreData.clearData(ref);
                  Navigator.pushAndRemoveUntil(
                      context,
                      CupertinoPageRoute(builder: (context) => SplashScreen()),
                      (route) => false);
                  Fluttertoast.showToast(msg: "Logout Succesfuliy");
                },
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
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
                      _scaffoldKey.currentState?.openDrawer();
                    },
                    child: Container(
                      height: 50.w,
                      width: 50.w,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(25, 255, 255, 255),
                          borderRadius: BorderRadius.circular(500.r)),
                      child: Center(
                        child: Icon(
                          Icons.dashboard_outlined,
                          color: Color.fromARGB(255, 117, 111, 190),
                          size: 18.w,
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  SizedBox(
                    width: 45.w,
                  ),
                  Container(
                    child: Image.asset(
                      "assets/edulogo.png",
                      width: 100,
                    ),
                  ),
                  Spacer(),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => Chatinbox(),
                            ));
                      },
                      icon: Icon(
                        Icons.notifications_active_outlined,
                        color: Colors.white,
                        size: 19.w,
                      )),
                  SizedBox(
                    width: 3.w,
                  ),
                  Container(
                    height: 44.h,
                    width: 44.w,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(25, 255, 255, 255),
                      borderRadius: BorderRadius.circular(500.r),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          "${box.get('pic')}",
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
                height: 25.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 30.w,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Welcome, ",
                            style: GoogleFonts.roboto(
                                fontSize: 24.w,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                          Text(
                            "${box.get("name")}!",
                            style: GoogleFonts.roboto(
                                fontSize: 24.w,
                                fontWeight: FontWeight.w600,
                                color: Color.fromARGB(255, 220, 248, 129)),
                          )
                        ],
                      ),
                      Text(
                        "Let’s plan your bright future.",
                        style: GoogleFonts.roboto(
                            fontSize: 14.w,
                            fontWeight: FontWeight.w400,
                            color: Color.fromARGB(255, 204, 204, 204)),
                      )
                    ],
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => WalletPage()));
                    },
                    child: Container(
                      height: 36.h,
                      width: 94.w,
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(500.r),
                          border: Border.all(
                            color: Color.fromARGB(255, 220, 248, 129),
                          )),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.wallet_outlined,
                            color: Color.fromARGB(255, 220, 248, 129),
                            size: 15.5.w,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          wallteserviceProvider.when(
                            data: (snapshot) {
                              return Text(
                                "${double.tryParse(snapshot.data.balance)!.toStringAsFixed(0)} Coins",
                                style: GoogleFonts.roboto(
                                    color: Color.fromARGB(255, 220, 248, 129),
                                    fontSize: 12.w),
                              );
                            },
                            error: (error, stackTrace) {
                              return Center(
                                child: Text("Error:$error"),
                              );
                            },
                            loading: () {
                              return Container();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20.w,
                  )
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              Container(
                child: Padding(
                  padding: EdgeInsets.only(left: 20.w),
                  child: Row(
                    children: [
                      Container(
                        width: 190.w,
                        height: 86.h,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 38, 38, 38),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 15.w,
                            ),
                            Container(
                              width: 50.w,
                              height: 50.h,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 144, 136, 241),
                                shape: BoxShape.circle,
                              ),
                              child: Image.asset(
                                "assets/Mask group.png",
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            yourmentorData.when(
                              data: (data) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Your Mentors",
                                      style: GoogleFonts.inter(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w400,
                                        color:
                                            Color.fromARGB(255, 144, 136, 241),
                                      ),
                                    ),
                                    Text(
                                      // "04",
                                      data.data.mentors.length.toString(),
                                      style: GoogleFonts.roboto(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                );
                              },
                              error: (error, stackTrace) => Center(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Your Mentors",
                                    style: GoogleFonts.inter(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w400,
                                      color: Color.fromARGB(255, 144, 136, 241),
                                    ),
                                  ),
                                  Text(
                                    "0",
                                    // data.data.mentors.length.toString(),,
                                    style: GoogleFonts.roboto(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              )),
                              loading: () => Center(
                                child: SizedBox(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Container(
                        width: 190.w,
                        height: 86.h,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 38, 38, 38),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 15.w,
                            ),
                            Container(
                              width: 50.w,
                              height: 50.h,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 144, 136, 241),
                                shape: BoxShape.circle,
                              ),
                              child: Image.asset(
                                "assets/Mask group.png",
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "New Requests",
                                  style: GoogleFonts.roboto(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromARGB(255, 144, 136, 241),
                                  ),
                                ),
                                Text(
                                  "20",
                                  style: GoogleFonts.roboto(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(30.r)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    HomePageBody(
                      callBack: (value) async {
                        log(value);

                        if (value == "All") {
                          setState(() {
                            filterQuery = "";
                          });
                        } else {
                          setState(() {
                            filterQuery = "/$value";
                          });
                        }
                      },
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    SizedBox(
                      height: 280.h,
                      width: MediaQuery.of(context).size.width,
                      child: homementrosprovider.when(
                          data: (snaphot) {
                            return Padding(
                              padding: EdgeInsets.only(bottom: 20.h),
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: snaphot!.data.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              Newskilllistpage(
                                            id: snaphot!.data[index].id
                                                .toString(),
                                          ),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          bottom: 0, left: 20.w),
                                      width: 190.w,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 1,
                                          color: Color.fromARGB(24, 11, 2, 2),
                                        ),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.only(bottom: 8.h),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 8.h,
                                            ),
                                            Container(
                                              width: 174.w,
                                              height: 112.h,
                                              child:
                                                  // Image.asset("assets/pic.png"),
                                                  ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                child: Image.network(
                                                  snaphot!.data[index]
                                                          .profilePic ??
                                                      "https://placehold.co/600x400?text=Profile+Pic",
                                                  width: 174.w,
                                                  height: 112.h,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10.h,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: 10.w, right: 10.w),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    // "Jennifer Johns",
                                                    limitString(
                                                        snaphot!.data[index]
                                                            .fullName,
                                                        15),
                                                    style: GoogleFonts.roboto(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 16,
                                                      color: Color.fromARGB(
                                                          255, 27, 27, 27),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 6.h,
                                                  ),
                                                  Text(
                                                    // "Helping students land their dre...",
                                                    snaphot
                                                        .data[index].description
                                                        .toString(),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: GoogleFonts.roboto(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 12,
                                                      color: Color.fromARGB(
                                                          255, 102, 102, 102),
                                                    ),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        top: 10.h),
                                                    width: 170.w,
                                                    height: 30.h,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              70),
                                                      color: Color.fromARGB(
                                                          255, 144, 136, 241),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        "Contact me",
                                                        style:
                                                            GoogleFonts.roboto(
                                                          fontSize: 11,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                          error: (err, stack) {
                            return SizedBox(
                              child: Center(
                                child: Text(
                                  "Mentors not found",
                                  style: GoogleFonts.montserrat(
                                      color: Colors.black),
                                ),
                              ),
                            );
                          },
                          loading: () => Center(
                                child: CircularProgressIndicator(),
                              )),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 25.w,
                  ),
                  Text(
                    "Explore Trending Skills",
                    style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 20.w,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              SizedBox(
                height: 17.h,
              ),
              skilsProvider.when(
                data: (snapshot) {
                  return SizedBox(
                    height: 200.h,
                    width: 440.w,
                    child: Padding(
                      padding: EdgeInsets.only(left: 0.w),
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(left: 12.w, right: 12),
                              child: Container(
                                width: 120.w,
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 38, 38, 38),
                                    borderRadius: BorderRadius.circular(20.w)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 58.h,
                                      width: 58.w,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  "http://education.globallywebsolutions.com/public/${snapshot.data[index].image}")),
                                          color: Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(10.r)),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 5.w),
                                      child: Text(
                                        snapshot.data[index].subTitle,
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.roboto(
                                            color: Color.fromARGB(
                                                255, 144, 136, 241),
                                            fontSize: 11.w),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    Text(
                                      snapshot.data[index].title,
                                      style: GoogleFonts.roboto(
                                          color: Color.fromARGB(
                                              255, 255, 255, 255),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16.w),
                                    )
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                  );
                },
                error: (Object error, StackTrace stackTrace) => SizedBox(),
                loading: () => SizedBox(),
              ),
              SizedBox(
                height: 40.h,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(30.r),
                ),
                child: Padding(
                  padding: EdgeInsets.only(bottom: 8.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 20.h),
                      Container(
                        margin: EdgeInsets.only(left: 20.h),
                        child: Text(
                          "Explore College Review ",
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            color: Color.fromARGB(255, 27, 27, 27),
                          ),
                        ),
                      ),
                      SizedBox(height: 16.h),
                      SizedBox(
                        height: 280.h,
                        width: MediaQuery.of(context).size.width,
                        child: collages.when(
                          data: (collagedata) {
                            return ListView.builder(
                              itemCount: collagedata.data.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                          builder: (context) =>
                                              PerticulerCollagePage(
                                            collagedata.data[index].id
                                                .toString(),
                                          ),
                                        ));
                                  },
                                  child: Container(
                                    margin:
                                        EdgeInsets.only(bottom: 20, left: 20.w),
                                    width: 192.w,
                                    height: 215.h,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 1,
                                        color: Color.fromARGB(24, 11, 2, 2),
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 8.h,
                                        ),
                                        Container(
                                          width: 174.w,
                                          height: 112.h,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            child:
                                                //
                                                // Image.network(
                                                //   " http://education.globallywebsolutions.com/public/images/34AIzKRsdRfBkQGPysiptOA0nHORmhhNzMep48wt.jfif${collagedata.data[index].image.toString()}",
                                                //   width: 174.w,
                                                //   height: 112.h,
                                                //   fit: BoxFit.cover,
                                                // ),
                                                Image.network(
                                              "${collagedata.data[index].image}",
                                              width: 176.w,
                                              height: 111.h,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 16.h,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 10.w),
                                          child: Row(
                                            children: [
                                              Container(
                                                height: 26.h,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(40),
                                                  color: Color.fromARGB(
                                                      255, 222, 221, 236),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10.w),
                                                  child: Center(
                                                    child: Text(
                                                      // "Jaipur",
                                                      collagedata
                                                          .data[index].city,
                                                      style: GoogleFonts.roboto(
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: Color.fromARGB(
                                                            255, 46, 46, 46),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 7.w,
                                              ),
                                              Container(
                                                height: 26.h,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(40),
                                                  color: Color.fromARGB(
                                                      255, 222, 221, 236),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 8.w),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        Icons.star,
                                                        size: 12,
                                                        color: Color.fromARGB(
                                                            255, 144, 136, 241),
                                                      ),
                                                      Text(
                                                        // "4.5 Review",
                                                        "${collagedata.data[index].avgRating ?? "4"}",
                                                        style:
                                                            GoogleFonts.roboto(
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: Color.fromARGB(
                                                              255, 46, 46, 46),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        Container(
                                          width: 176,
                                          height: 1,
                                          decoration: BoxDecoration(
                                            color: Colors.black12,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 10.w),
                                          child: SizedBox(
                                            width: 192.w,
                                            height: 67.h,
                                            child: Text(
                                              // "James Parlour Collage ",
                                              collagedata!
                                                  .data[index].collageName,
                                              overflow: TextOverflow.fade,
                                              style: GoogleFonts.roboto(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                                color: Color.fromARGB(
                                                    255, 27, 27, 27),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          error: (error, stackTrace) {
                            // Fluttertoast.showToast(
                            //     msg: "Your session was expired");
                            // StoreData.clearData();
                            // Navigator.pushAndRemoveUntil(
                            //     context,
                            //     CupertinoPageRoute(
                            //         builder: (context) => SplashScreen()),
                            //     (route) => false);
                            return SizedBox();
                          },
                          loading: () => Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color.fromARGB(25, 0, 0, 0),
                  borderRadius: BorderRadius.circular(30.r),
                ),
                child: Padding(
                  padding: EdgeInsets.only(bottom: 8.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 20.h),
                      Container(
                        margin: EdgeInsets.only(left: 20.h),
                        child: Text(
                          "Company Reviews",
                          style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                              color: Colors.white),
                        ),
                      ),
                      SizedBox(height: 16.h),
                      SizedBox(
                        height: 280.h,
                        width: MediaQuery.of(context).size.width,
                        child: companyreviewData.when(
                          data: (companydata) {
                            return ListView.builder(
                              itemCount: companydata.data.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                          builder: (context) =>
                                              PerticulerCollagePage(companydata
                                                  .data[index].id
                                                  .toString()),
                                        ));
                                  },
                                  child: Container(
                                    margin:
                                        EdgeInsets.only(bottom: 20, left: 20.w),
                                    width: 192.w,
                                    height: 215.h,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 1,
                                        color: Colors.white10,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 8.h,
                                        ),
                                        Container(
                                          width: 174.w,
                                          height: 112.h,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            child: Image.network(
                                              companydata.data[index].image
                                                      .toString()
                                                      .replaceFirst(
                                                          "/public/", "") ??
                                                  "https://placehold.co/600x400/png",
                                              width: 176.w,
                                              height: 111.h,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 16.h,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 10.w),
                                          child: Row(
                                            children: [
                                              Container(
                                                height: 26.h,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(40),
                                                  color: Color.fromARGB(
                                                      255, 38, 38, 38),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10.w),
                                                  child: Center(
                                                    child: Text(
                                                      // "Jaipur",
                                                      companydata
                                                          .data[index].city,
                                                      style: GoogleFonts.roboto(
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 7.w,
                                              ),
                                              Container(
                                                height: 26.h,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(40),
                                                  color: Color.fromARGB(
                                                      255, 38, 38, 38),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10.w),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        Icons.star,
                                                        size: 12,
                                                        color: Color.fromARGB(
                                                            255, 144, 136, 241),
                                                      ),
                                                      Text(
                                                        "${companydata.data[index].avgRating ?? 4}",
                                                        style:
                                                            GoogleFonts.roboto(
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: Colors.white,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        Container(
                                          width: 176,
                                          height: 1,
                                          decoration: BoxDecoration(
                                            color: Colors.white10,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 10.w),
                                          child: Text(
                                            // "James Parlour Collage ",
                                            companydata.data[index].collageName,
                                            style: GoogleFonts.roboto(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          error: (error, stackTrace) {
                            Fluttertoast.showToast(
                                msg: "Your session was expired");
                            StoreData.clearData(ref);
                            Navigator.pushAndRemoveUntil(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => SplashScreen()),
                                (route) => false);
                          },
                          loading: () => Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class HomePageBody extends ConsumerStatefulWidget {
  final Function callBack;
  const HomePageBody({super.key, required this.callBack});

  @override
  _HomePageBodyState createState() => _HomePageBodyState();
}

class _HomePageBodyState extends ConsumerState<HomePageBody> {
  int curenttabindex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 20.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 25.w,
            ),
            Text(
              "Find Mentors",
              style: GoogleFonts.roboto(
                  color: Colors.black,
                  fontSize: 20.w,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
        SizedBox(
          height: 15.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 20.h,
            ),
            SizedBox(
              height: 30.h,
              width: 440.w - 20.h,
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: [
                  Upertabs(
                    title: "All",
                    callBack: () {
                      setState(() {
                        curenttabindex = 0;
                      });
                      widget.callBack("All");
                    },
                    currentIndex: curenttabindex,
                    index: 0,
                  ),
                  Upertabs(
                    title: "Placements",
                    callBack: () {
                      setState(() {
                        curenttabindex = 1;
                      });
                      widget.callBack("Placements");
                    },
                    currentIndex: curenttabindex,
                    index: 1,
                  ),
                  Upertabs(
                    title: "Carer",
                    callBack: () {
                      setState(() {
                        curenttabindex = 2;
                      });
                      widget.callBack("Carer");
                    },
                    currentIndex: curenttabindex,
                    index: 2,
                  ),
                  Upertabs(
                    title: "Opportunities",
                    callBack: () {
                      setState(() {
                        curenttabindex = 3;
                      });
                      widget.callBack("Opportunities");
                    },
                    currentIndex: curenttabindex,
                    index: 3,
                  ),
                  Upertabs(
                    title: "Development",
                    callBack: () {
                      setState(() {
                        curenttabindex = 4;
                      });
                      widget.callBack("Development");
                    },
                    currentIndex: curenttabindex,
                    index: 4,
                  ),
                  Upertabs(
                    title: "Growth",
                    callBack: () {
                      setState(() {
                        curenttabindex = 5;
                      });
                      widget.callBack("Growth");
                    },
                    currentIndex: curenttabindex,
                    index: 5,
                  ),
                ],
              ),
            )
          ],
        ),
        // mentorsProvider.when(
        //     data: (snapshot) {
        //       return ListView.builder(
        //           itemCount: snapshot.data.length,
        //           shrinkWrap: true,
        //           physics: NeverScrollableScrollPhysics(),
        //           itemBuilder: (context, index) {
        //             return Padding(
        //               padding: const EdgeInsets.all(8.0),
        //               child: UserTabs(
        //                 id: snapshot.data[index].id,
        //                 fullname: snapshot.data[index].fullName.toString(),
        //                 dec: snapshot.data[index].description.toString(),
        //                 servicetype: snapshot.data[index].serviceType,
        //               ),
        //             );
        //           });
        //     },
        //     error: (err, stack) => Center(
        //           child: Text(err.toString()),
        //         ),
        //     loading: () => SizedBox(
        //           width: MediaQuery.of(context).size.width,
        //           height: MediaQuery.of(context).size.height / 3,
        //           child: Center(
        //             child: CircularProgressIndicator(),
        //           ),
        //         )),
        SizedBox(
          height: 10.h,
        )
      ],
    );
  }
}

class UserTabs extends StatefulWidget {
  final int id;
  final String fullname;
  final String dec;
  final List<dynamic> servicetype;
  final String image;
  const UserTabs(
      {super.key,
      required this.id,
      required this.fullname,
      required this.dec,
      required this.servicetype,
      required this.image});

  @override
  State<UserTabs> createState() => _UserTabsState();
}

class _UserTabsState extends State<UserTabs> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 127.h,
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
                      image: NetworkImage(widget.image), fit: BoxFit.cover)),
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
              Text(
                "${widget.fullname}",
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
                  "${widget.dec}",
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
                child: ListView.builder(
                  itemCount: widget.servicetype.length,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
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
                                "${widget.servicetype[index].toString()}",
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
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Upertabs extends StatefulWidget {
  final String title;
  final Function callBack;
  final int currentIndex;
  final int index;
  const Upertabs(
      {super.key,
      required this.title,
      required this.callBack,
      required this.currentIndex,
      required this.index});

  @override
  State<Upertabs> createState() => _UpertabsState();
}

class _UpertabsState extends State<Upertabs> {
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
              color: widget.currentIndex == widget.index
                  ? Color.fromARGB(255, 144, 136, 241)
                  : Color.fromARGB(225, 222, 221, 236),
              borderRadius: BorderRadius.circular(50.r)),
          child: Padding(
            padding: EdgeInsets.only(left: 10.w, right: 10.w),
            child: Center(
              child: Text(
                widget.title,
                style: GoogleFonts.roboto(
                    fontSize: 12.w,
                    fontWeight: FontWeight.w400,
                    letterSpacing: -0.30,
                    color: widget.currentIndex == widget.index
                        ? Colors.white
                        : Colors.black),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
