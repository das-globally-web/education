import 'dart:math';
import 'package:educationapp/trendingskills/views/addreview.page/addreviewBodyModel.dart';
import 'package:educationapp/trendingskills/views/addreview.page/addreviewpageController.dart';
import 'package:educationapp/trendingskills/views/controller.review/reviewController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';

class AddReviewPage extends ConsumerStatefulWidget {
  final String id;
  const AddReviewPage({super.key, required this.id});

  @override
  ConsumerState<AddReviewPage> createState() => _AddReviewPageState();
}

class _AddReviewPageState extends ConsumerState<AddReviewPage> {
  final descriptionController = TextEditingController();
  int revieCount = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFF1B1B1B),
      body: Column(
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
                "Add ",
                style: GoogleFonts.roboto(
                    fontSize: 18.w, color: Color.fromARGB(255, 144, 136, 241)),
              ),
              Text(
                "Review",
                style: GoogleFonts.roboto(
                    fontSize: 18.w, color: Color.fromARGB(255, 220, 248, 129)),
              ),
              Spacer(),
              SizedBox(
                width: 62.w,
              ),
            ],
          ),
          SizedBox(
            height: 30.h,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.r),
                      topRight: Radius.circular(40.r))),
              child: Padding(
                padding: EdgeInsets.all(20.0.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Fill out the details",
                          style: GoogleFonts.roboto(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 20.w),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        RatingBar.builder(
                          initialRating: 3,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: 24.w,
                          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Color.fromARGB(255, 144, 136, 241),
                            size: 24.w,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                            setState(() {
                              revieCount = int.parse(rating.toStringAsFixed(0));
                            });
                          },
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Review Title",
                          style: GoogleFonts.roboto(
                              color: Colors.black,
                              fontSize: 13.w,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Description",
                          style: GoogleFonts.roboto(
                              color: Colors.black,
                              fontSize: 13.w,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    TextFormField(
                      controller: descriptionController,
                      maxLines: 8,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () async {
                        // Navigator.push(context, CupertinoPageRoute(builder: (context) => GetStartPAge()));
                        if (!Hive.isBoxOpen('userdata')) {
                          await Hive.openBox('userdata');
                        }
                        var box = Hive.box('userdata');
                        final addreviewpageData = ref.watch(
                          addreviewpageProvider(
                            AddReviewBodyModel(
                              userId: int.parse(box.get('id').toString()),
                              count: revieCount,
                              description: descriptionController.text,
                              collageId: int.parse(widget.id),
                              skillsId: 1,
                            ),
                          ),
                        );
                        if (addreviewpageData != null) {
                          Fluttertoast.showToast(msg: "Review add successful");
                          Navigator.pop(context);
                        } else {
                          Fluttertoast.showToast(msg: "Review faliled");
                        }
                      },
                      child: Container(
                        height: 52.h,
                        width: 400.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40.r),
                            color: Color(0xFFDCF881)),
                        child: Center(
                          child: Text(
                            "Save Review",
                            style: GoogleFonts.roboto(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                letterSpacing: -0.4,
                                fontSize: 14.4.w),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
