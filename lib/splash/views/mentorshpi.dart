import 'dart:developer';

import 'package:educationapp/registerpage/views/register.page.dart';
import 'package:educationapp/splash/controller/serviceController.dart';
import 'package:educationapp/splash/models/service.model.dart';
import 'package:educationapp/splash/views/getstart.page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class MentorShipPage extends StatefulWidget {
  const MentorShipPage({super.key});

  @override
  State<MentorShipPage> createState() => _MentorShipPageState();
}

class _MentorShipPageState extends State<MentorShipPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 956,
        width: 440,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            BackGroundImage(),
            MentorshipBody(),
          ],
        ),
      ),
    );
  }
}

class MentorshipBody extends ConsumerStatefulWidget {
  const MentorshipBody({super.key});

  @override
  _MentorshipBodyState createState() => _MentorshipBodyState();
}

class _MentorshipBodyState extends ConsumerState<MentorshipBody> {
  final selectColor = Color(0xFFDCF881);
  final deselectColor = Color(0xFFF1F2F6);
  int selectIndex = 0;

  void sendToNextPage() {
    Navigator.push(
        context, CupertinoPageRoute(builder: (context) => RegisterPage()));
  }

  Set<Datum> selectedOptions = {};

  @override
  Widget build(BuildContext context) {
    final serviceDataProvider = ref.watch(serviceProvider);
    return serviceDataProvider.when(
        data: (snapshot) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(),
              Text(
                UserRegisterDataHold.usertype == "Student"
                    ? "What do you need mentorship for?"
                    : "What do you offer as a mentor?",
                style: GoogleFonts.roboto(
                    color: Colors.black,
                    fontSize: 26.w,
                    fontWeight: FontWeight.w600,
                    letterSpacing: -1.2.h),
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.w),
                child: Wrap(
                  spacing: 8.0, // Space between chips
                  runSpacing: 8,
                  children: snapshot.data.map((option) {
                    return FilterChip(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            50), // Makes the chip fully circular
                        side: const BorderSide(
                            color: Colors
                                .transparent), // Optional: Add border color
                      ),
                      label: Text(
                        option.title,
                        style: GoogleFonts.glory(
                            color: Colors.black, fontSize: 18.w),
                      ),
                      backgroundColor:
                          deselectColor, // Color when chip is not selected
                      selectedColor:
                          Color(0xFFDCF881), // Color when chip is selected
                      disabledColor: deselectColor,
                      selected: selectedOptions.contains(option),
                      onSelected: (isSelected) {
                        setState(() {
                          if (isSelected) {
                            selectedOptions.add(option);
                          } else {
                            selectedOptions.remove(option);
                          }
                        });
                      },
                    );
                  }).toList(),
                ),
              ),

              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   crossAxisAlignment: CrossAxisAlignment.center,
              //   children: [
              //     GestureDetector(
              //       onTap: () {
              //         setState(() {
              //           selectIndex = 2;
              //           UserRegisterDataHold.usertype =
              //               UserRegisterDataHold.usertype;
              //           UserRegisterDataHold.serviceType =
              //               "📚 Course Selection";
              //         });
              //         sendToNextPage();
              //       },
              //       child: Container(
              //         height: 46.h,
              //         width: 178.w,
              //         decoration: BoxDecoration(
              //             borderRadius: BorderRadius.circular(40.r),
              //             color: selectIndex == 2
              //                 ? Color(0xFFDCF881)
              //                 : deselectColor),
              //         child: Center(
              //             child: Text(
              //           "📚 Course Selection",
              //           style: GoogleFonts.roboto(
              //               fontWeight: FontWeight.w400,
              //               fontSize: 15.w,
              //               letterSpacing: -0.95),
              //         )),
              //       ),
              //     ),
              //     SizedBox(
              //       width: 10.w,
              //     ),
              //     GestureDetector(
              //       onTap: () {

              //       },
              //       child: Container(
              //         height: 46.h,
              //         width: 166.w,
              //         decoration: BoxDecoration(
              //             borderRadius: BorderRadius.circular(40.r),
              //             color: selectIndex == 3
              //                 ? Color(0xFFDCF881)
              //                 : deselectColor),
              //         child: Center(
              //             child: Text(
              //           "🤔 General Advice",
              //           style: GoogleFonts.roboto(
              //               fontWeight: FontWeight.w400,
              //               fontSize: 15.w,
              //               letterSpacing: -0.95),
              //         )),
              //       ),
              //     ),
              //   ],
              // ),
              Spacer(),

              ElevatedButton(
                onPressed: () {
                  // Your action here
                  String serviceValue = "";
                  List<Datum> selectedList = selectedOptions.toList();
                  for (int i = 0; i < selectedOptions.length; i++) {
                    setState(() {
                      serviceValue = serviceValue == ""
                          ? selectedList[i].title
                          : "$serviceValue, ${selectedList[i].title}";
                    });
                  }
                  log(serviceValue);
                  setState(() {
                    UserRegisterDataHold.usertype =
                        UserRegisterDataHold.usertype;
                    UserRegisterDataHold.serviceType = serviceValue;
                  });
                  sendToNextPage();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      const Color(0xFFDCF881), // Same background color
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(40.r), // Same rounded border
                  ),
                  fixedSize: Size(400.w, 52.h), // Same width and height
                  elevation: 0, // Remove shadow if needed
                ),
                child: Text(
                  "Continue",
                  style: GoogleFonts.roboto(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    letterSpacing: -0.4,
                    fontSize: 14.4.w,
                  ),
                ),
              ),
              SizedBox(
                height: 80.h,
              ),
            ],
          );
        },
        error: (err, stack) {
          return SizedBox();
        },
        loading: () => Center(
              child: CircularProgressIndicator(),
            ));
  }
}
//
