import 'package:educationapp/collegeReviews/view/allcollage.page.dart';
import 'package:educationapp/findmentor/view/findmentor.page.dart';
import 'package:educationapp/home/controller/homeController.dart';
import 'package:educationapp/trendingskills/controller/sikllscontroller.dart';
import 'package:educationapp/trendingskills/views/trendingskills.page.dart';
import 'package:educationapp/wallet/views/wallet.page.dart';
import 'package:educationapp/wallet/walletController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final userState = ref.watch(userDataProvider);
    final skilsProvider = ref.watch(skilssProvide);
    final wallteserviceProvider = ref.watch(walletProvider);

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color(0xFF1B1B1B),
      drawer: Padding(
        padding: const EdgeInsets.all(23.0),
        child: Expanded(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: 280,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(30.r)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 240.h,
                  width: 289.w,
                  decoration: BoxDecoration(
                      color: Color(0xFF9088F1),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.r),
                          topRight: Radius.circular(30.r))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 13.w,
                          ),
                          Container(
                            height: 50.h,
                            width: 50.w,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(25, 255, 255, 255),
                                borderRadius: BorderRadius.circular(500.r),
                                image: DecorationImage(
                                    image: AssetImage("assets/Ellipse2.png"))),
                          ),
                          Spacer(),
                          Container(
                            height: 38,
                            decoration: BoxDecoration(
                                color: Color(0xFFDCF881),
                                borderRadius: BorderRadius.circular(40.r)),
                            child: Center(
                              child: Padding(
                                padding:
                                    EdgeInsets.only(left: 12.w, right: 12.w),
                                child: Text(
                                  "Edit Profile",
                                  style: GoogleFonts.roboto(
                                      color: Color(0xFF1B1B1B), fontSize: 12.w),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 13.w,
                          ),
                        ],
                      ),
                      Expanded(
                        child: ListView(
                          children: [
                            ListTile(
                              leading: Icon(Icons.school),
                              title: Text("Find a Mentor"),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) =>
                                            FindMentorPage()));
                              },
                            ),
                            ListTile(
                              leading: Icon(Icons.trending_up),
                              title: Text("Trending Skills"),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) =>
                                            TrendingSkilsPage()));
                              },
                            ),
                            ListTile(
                              leading: Icon(Icons.rate_review),
                              title: Text("Explore College Reviews"),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) => AllCollage()));
                              },
                            ),
                            ListTile(
                              leading: Icon(Icons.account_balance_wallet),
                              title: Text("Wallet"),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) => WalletPage()));
                              },
                            ),
                            ListTile(
                              leading: Icon(Icons.settings),
                              title: Text("Settings"),
                              onTap: () {},
                            ),
                          ],
                        ),
                      ),
                      Divider(),
                      ListTile(
                        leading: Icon(Icons.logout),
                        title: Text("Logout"),
                        onTap: () async {
                          // Logout logic
                          var box = await Hive.openBox('userdata');
                          await box.clear();
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
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
                      _scaffoldKey.currentState?.openDrawer();
                    },
                    child: Container(
                      height: 50.h,
                      width: 44.w,
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
                  Text(
                    "Logo",
                    style: GoogleFonts.roboto(
                        fontSize: 18.w,
                        color: Color.fromARGB(255, 144, 136, 241)),
                  ),
                  Text(
                    "Name",
                    style: GoogleFonts.roboto(
                        fontSize: 18.w,
                        color: Color.fromARGB(255, 220, 248, 129)),
                  ),
                  Spacer(),
                  IconButton(
                      onPressed: () {},
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
                            image: AssetImage("assets/Ellipse2.png"))),
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
                            "${userState.name}!",
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
                    width: 30.w,
                  ),
                ],
              ),
              SizedBox(
                height: 40.h,
              ),
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => FindMentorPage()));
                    },
                    child: Container(
                      height: 440,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 144, 136, 241),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(45.r),
                              topRight: Radius.circular(45.r))),
                      child: Column(
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
                                width: 20.w,
                              ),
                              Container(
                                height: 45.h,
                                width: 45.w,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(500.r)),
                                child: Image.asset(
                                    'assets/fluent-emoji-high-contrast_man-teacher.png'),
                              ),
                              SizedBox(
                                width: 15.w,
                              ),
                              Text(
                                "Find a Mentor",
                                style: GoogleFonts.roboto(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.w),
                              ),
                              Spacer(),
                              Container(
                                height: 45.h,
                                width: 45.w,
                                decoration: BoxDecoration(
                                    color: Colors.white24,
                                    borderRadius: BorderRadius.circular(500.r)),
                                child: Center(
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.white,
                                    size: 18.h,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20.w,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => TrendingSkilsPage()));
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 90.h),
                      height: 440,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 220, 248, 129),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(45.r),
                              topRight: Radius.circular(45.r))),
                      child: Column(
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
                                width: 20.w,
                              ),
                              Container(
                                height: 45.h,
                                width: 45.w,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(500.r)),
                                child: Image.asset(
                                    'assets/mingcute_code-fill.png'),
                              ),
                              SizedBox(
                                width: 15.w,
                              ),
                              Text(
                                "Trending Skills",
                                style: GoogleFonts.roboto(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.w),
                              ),
                              Spacer(),
                              Container(
                                height: 45.h,
                                width: 45.w,
                                decoration: BoxDecoration(
                                    color: Colors.black12,
                                    borderRadius: BorderRadius.circular(500.r)),
                                child: Center(
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.black,
                                    size: 18.h,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20.w,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => AllCollage(),
                          ));
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 90 * 2.h),
                      height: 440,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Color(0xFF1B1B1B),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(45.r),
                              topRight: Radius.circular(45.r))),
                      child: Column(
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
                                width: 20.w,
                              ),
                              Container(
                                height: 45.h,
                                width: 45.w,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(500.r)),
                                child: Image.asset('assets/carbon_review.png'),
                              ),
                              SizedBox(
                                width: 15.w,
                              ),
                              Text(
                                "Explore College Reviews",
                                style: GoogleFonts.roboto(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.w),
                              ),
                              Spacer(),
                              Container(
                                height: 45.h,
                                width: 45.w,
                                decoration: BoxDecoration(
                                    color: Colors.white24,
                                    borderRadius: BorderRadius.circular(500.r)),
                                child: Center(
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.white,
                                    size: 18.h,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20.w,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 90 * 3.h),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(30.r)),
                    child: HomePageBody(),
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
                height: 20.h,
              ),
              skilsProvider.when(
                data: (snapshot) {
                  return SizedBox(
                    height: 150.h,
                    width: 440.w,
                    child: Padding(
                      padding: EdgeInsets.only(left: 25.w),
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(right: 10.w),
                              child: Container(
                                height: 145.h,
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
                                          color: Colors.white10,
                                          borderRadius:
                                              BorderRadius.circular(500.r)),
                                      child:
                                          Image.asset("assets/Mask group.png"),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Text(
                                      snapshot.data[index].subTitle,
                                      style: GoogleFonts.roboto(
                                          color: Color.fromARGB(
                                              255, 144, 136, 241),
                                          fontSize: 11.w),
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
                height: 50.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomePageBody extends ConsumerStatefulWidget {
  const HomePageBody({super.key});

  @override
  _HomePageBodyState createState() => _HomePageBodyState();
}

class _HomePageBodyState extends ConsumerState<HomePageBody> {
  int curenttabindex = 0;
  @override
  Widget build(BuildContext context) {
    final mentorsProvider = ref.watch(homeMentorsProvider);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 25.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 25.w,
            ),
            Text(
              "Suggested Mentors",
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
                    title: "Placements",
                    callBack: () {
                      setState(() {
                        curenttabindex = 0;
                      });
                    },
                    currentIndex: curenttabindex,
                    index: 0,
                  ),
                  Upertabs(
                    title: "Carer",
                    callBack: () {
                      setState(() {
                        curenttabindex = 1;
                      });
                    },
                    currentIndex: curenttabindex,
                    index: 1,
                  ),
                  Upertabs(
                    title: "Opportunities",
                    callBack: () {
                      setState(() {
                        curenttabindex = 2;
                      });
                    },
                    currentIndex: curenttabindex,
                    index: 2,
                  ),
                  Upertabs(
                    title: "Development",
                    callBack: () {
                      setState(() {
                        curenttabindex = 3;
                      });
                    },
                    currentIndex: curenttabindex,
                    index: 3,
                  ),
                  Upertabs(
                    title: "Growth",
                    callBack: () {
                      setState(() {
                        curenttabindex = 4;
                      });
                    },
                    currentIndex: curenttabindex,
                    index: 4,
                  ),
                ],
              ),
            )
          ],
        ),
        ///// Tab is here
        ///
        ///
        ///

        mentorsProvider.when(
            data: (snapshot) {
              return ListView.builder(
                  itemCount: 5,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
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
                  });
            },
            error: (err, stack) => Center(
                  child: Text(err.toString()),
                ),
            loading: () => Center(
                  child: CircularProgressIndicator(),
                )),

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
  const UserTabs(
      {super.key,
      required this.id,
      required this.fullname,
      required this.dec,
      required this.servicetype});

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
                    }),
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
