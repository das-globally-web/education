import 'package:educationapp/findmentor/view/findmentor.page.dart';
import 'package:educationapp/trendingskills/controller/service/searchSkillController.dart';
import 'package:educationapp/trendingskills/controller/sikllscontroller.dart';
import 'package:educationapp/trendingskills/views/skills.page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TrendingSkilsPage extends ConsumerStatefulWidget {
  const TrendingSkilsPage({super.key});

  @override
  ConsumerState<TrendingSkilsPage> createState() => _TrendingSkilsPageState();
}

class _TrendingSkilsPageState extends ConsumerState<TrendingSkilsPage> {
  bool isSearching = false;
  final _searchController = TextEditingController();
  String searchskill = '';
  @override
  Widget build(BuildContext context) {
    final searchskillprovider = ref.watch(searchSkillProvider(searchskill));
    return Scaffold(
      backgroundColor: Color(0xFF1B1B1B),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
                        padding: const EdgeInsets.only(left: 4),
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
                !isSearching
                    ? Row(
                        children: [
                          Text(
                            "Trending ",
                            style: GoogleFonts.roboto(
                                fontSize: 24.w,
                                color: Color.fromARGB(255, 144, 136, 241)),
                          ),
                          Text(
                            "Skills",
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
                                searchskill = value;
                              });
                            },
                            textAlign: TextAlign.start,
                            controller: _searchController,
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
                        _searchController.clear();
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
              height: 20.h,
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
                    children: [],
                  ),
                )
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(30.r)),
              child: Column(
                children: [
                  if (!isSearching) ...[
                    TrendingSkillsBody(),
                  ] else ...[
                    Expanded(
                      child: searchskillprovider.when(
                        data: (trandingSkill) => trandingSkill.data.isNotEmpty
                            ? GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, // Number of items per row
                                  crossAxisSpacing:
                                      20, // Spacing between columns
                                  mainAxisSpacing: 20, // Spacing between rows
                                ),
                                itemCount:
                                    trandingSkill.data.length, // Total items
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                padding: EdgeInsets.all(10),
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          CupertinoPageRoute(
                                              builder: (context) =>
                                                  SkillListPage(
                                                    name: trandingSkill
                                                        .data[index].title,
                                                    subtitle: trandingSkill
                                                        .data[index].subTitle,
                                                    description: trandingSkill
                                                        .data[index]
                                                        .description,
                                                    id: trandingSkill
                                                        .data[index].id
                                                        .toString(),
                                                    image: trandingSkill
                                                        .data[index].image
                                                        .toString(),
                                                  )));
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 241, 242, 246),
                                        borderRadius:
                                            BorderRadius.circular(20.w),
                                      ),
                                      alignment: Alignment.center,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: 58.h,
                                            width: 58.w,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: NetworkImage(
                                                      "http://education.globallywebsolutions.com/public/${trandingSkill.data[index].image.toString()}"),
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10.r),
                                                color: Color.fromARGB(
                                                    0, 145, 136, 241)),
                                          ),
                                          SizedBox(
                                            height: 5.h,
                                          ),
                                          Text(
                                            trandingSkill.data[index].title,
                                            style: GoogleFonts.montserrat(
                                                color: Color.fromARGB(
                                                    255, 0, 0, 0),
                                                fontSize: 16.w,
                                                fontWeight: FontWeight.w600,
                                                letterSpacing: -0.95),
                                          ),
                                          SizedBox(
                                            height: 5.h,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 5.w, right: 5.w),
                                            child: Text(
                                              textAlign: TextAlign.center,
                                              trandingSkill
                                                  .data[index].subTitle,
                                              style: GoogleFonts.montserrat(
                                                  color: Color(0xFF9088F1),
                                                  fontSize: 13.w,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              )
                            : Center(
                                child: Text("No trending skills"),
                              ),
                        error: (error, stackTrace) => Text("Error:$error"),
                        loading: () =>
                            Center(child: CircularProgressIndicator()),
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

class TrendingSkillsBody extends ConsumerStatefulWidget {
  const TrendingSkillsBody({super.key});

  @override
  _TrendingSkillsBodyState createState() => _TrendingSkillsBodyState();
}

class _TrendingSkillsBodyState extends ConsumerState<TrendingSkillsBody> {
  @override
  Widget build(BuildContext context) {
    final skilsProvider = ref.watch(skilssProvide);
    return Padding(
      padding: EdgeInsets.only(top: 15.h, right: 10.w, left: 10.w),
      child: skilsProvider.when(
          data: (snapshot) {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of items per row
                crossAxisSpacing: 20, // Spacing between columns
                mainAxisSpacing: 20, // Spacing between rows
              ),
              itemCount: snapshot.data.length, // Total items
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.all(10),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => SkillListPage(
                                  name: snapshot.data[index].title,
                                  subtitle: snapshot.data[index].subTitle,
                                  description: snapshot.data[index].description,
                                  id: snapshot.data[index].id.toString(),
                                  image: snapshot.data[index].image.toString(),
                                )));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 241, 242, 246),
                      borderRadius: BorderRadius.circular(20.w),
                    ),
                    alignment: Alignment.center,
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
                                      "http://education.globallywebsolutions.com/public/${snapshot.data[index].image.toString()}")),
                              borderRadius: BorderRadius.circular(10.r),
                              color: Color.fromARGB(0, 145, 136, 241)),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          snapshot.data[index].title,
                          style: GoogleFonts.montserrat(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 16.w,
                              fontWeight: FontWeight.w600,
                              letterSpacing: -0.95),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5.w, right: 5.w),
                          child: Text(
                            textAlign: TextAlign.center,
                            snapshot.data[index].subTitle,
                            style: GoogleFonts.montserrat(
                                color: Color(0xFF9088F1),
                                fontSize: 13.w,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
          error: (err, stack) => Center(
                child: Text(err.toString()),
              ),
          loading: () => Center(
                child: CircularProgressIndicator(),
              )),
    );
  }
}
