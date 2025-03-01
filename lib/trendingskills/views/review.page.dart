import 'package:educationapp/trendingskills/views/addreview.page.dart';
import 'package:educationapp/trendingskills/views/controller.review/reviewController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vertical_barchart/vertical-barchart.dart';
import 'package:vertical_barchart/vertical-barchartmodel.dart';

class ReviewPage extends ConsumerStatefulWidget {
  final String id;
  const ReviewPage(this.id, {super.key});

  @override
  ConsumerState<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends ConsumerState<ReviewPage> {
  List<VBarChartModel> bardata = [
    VBarChartModel(
      index: 0,
      label: "⭐5",
      colors: [
        Color.fromARGB(255, 220, 248, 129),
        Color.fromARGB(255, 220, 248, 129)
      ],
      jumlah: 560,
      tooltip: "626",
    ),
    VBarChartModel(
      index: 1,
      label: "⭐4",
      colors: [
        Color.fromARGB(255, 220, 248, 129),
        Color.fromARGB(255, 220, 248, 129)
      ],
      jumlah: 400,
      tooltip: "125",
    ),
    VBarChartModel(
      index: 2,
      label: "⭐3",
      colors: [
        Color.fromARGB(255, 220, 248, 129),
        Color.fromARGB(255, 220, 248, 129)
      ],
      jumlah: 100,
      tooltip: "40",
    ),
    VBarChartModel(
      index: 3,
      label: "⭐2",
      colors: [
        Color.fromARGB(255, 220, 248, 129),
        Color.fromARGB(255, 220, 248, 129)
      ],
      jumlah: 50,
      tooltip: "20",
    ),
    VBarChartModel(
      index: 4,
      label: "⭐1",
      colors: [
        Color.fromARGB(255, 220, 248, 129),
        Color.fromARGB(255, 220, 248, 129)
      ],
      jumlah: 20,
      tooltip: "5",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    final reviewProvider = ref.watch(addreviewProvider(widget.id));
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
                SizedBox(
                  width: 50.w,
                ),
                Spacer(),
                Text(
                  "All ",
                  style: GoogleFonts.roboto(
                      fontSize: 18.w,
                      color: Color.fromARGB(255, 144, 136, 241)),
                ),
                Text(
                  "Reviews",
                  style: GoogleFonts.roboto(
                      fontSize: 18.w,
                      color: Color.fromARGB(255, 220, 248, 129)),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => AddReviewPage(
                                  id: widget.id,
                                )));
                  },
                  child: Container(
                    height: 44.h,
                    width: 99.w,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(225, 220, 248, 129),
                      borderRadius: BorderRadius.circular(500.r),
                    ),
                    child: Center(
                        child: Text(
                      "Add Review",
                      style: GoogleFonts.roboto(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 12.w),
                    )),
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
            Container(
              width: 400.w,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 38, 38, 38),
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 30,
                        ),
                        Icon(
                          Icons.star,
                          color: Color.fromARGB(255, 243, 202, 18),
                          size: 30.w,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          "4.5",
                          style: GoogleFonts.roboto(
                              color: Color.fromARGB(255, 144, 136, 241),
                              fontSize: 30.w),
                        ),
                        Spacer(),
                        Text(
                          "6296 Ratings",
                          style: GoogleFonts.roboto(
                              color: Colors.white, fontSize: 14.w),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      color: Colors.white24,
                      height: 1.5,
                    ),
                    Center(
                      child: VerticalBarchart(
                        tooltipColor: Colors.white,
                        labelColor: Colors.white,
                        background: Color.fromARGB(255, 38, 38, 38),
                        backdropColor: Color.fromARGB(12, 255, 255, 255),
                        maxX: 626,
                        data: bardata,
                        legendPosition: LegendPosition.TOP,
                        showLegend: true,
                        alwaysShowDescription: true,
                        showBackdrop: true,
                        legend: [],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.r),
                      topRight: Radius.circular(40.r)),
                  color: Colors.white),
              child: Padding(
                padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: reviewProvider.when(
                  data: (data) {
                    return ListView.builder(
                        itemCount: data.data.length,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(bottom: 15.h),
                            child: Container(
                              width: 400,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.r),
                                  color: Color.fromARGB(255, 241, 242, 246)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                      data.data[index].collageDescription,
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
                                      "-${data.data[index].description}",
                                      style: GoogleFonts.roboto(
                                          color: Color.fromARGB(255, 0, 0, 0),
                                          fontSize: 13.w,
                                          fontStyle: FontStyle.normal),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
                  },
                  error: (err, stack) {
                    return Center(
                      child: Text("Error :$err"),
                    );
                  },
                  loading: () {
                    return Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
