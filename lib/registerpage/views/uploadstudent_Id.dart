import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:educationapp/login/views/login.page.dart';
import 'package:educationapp/splash/views/getstart.page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:image_picker/image_picker.dart';

class UploadStudentId extends StatefulWidget {
  const UploadStudentId({super.key});

  @override
  State<UploadStudentId> createState() => _UploadStudentIdState();
}

class _UploadStudentIdState extends State<UploadStudentId> {
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
            Column(
              children: [
                SizedBox(
                  height: 80.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 20.w,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 37.h,
                        width: 37.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40.r),
                            color: Color(0xFFECEDF4)),
                        child: Center(
                          child: Icon(
                            Icons.arrow_back,
                            size: 16.41.h,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(height: 50.h),
                    Container(
                      child: Text(
                        "Verify your student ID",
                        style: GoogleFonts.roboto(
                          fontSize: 26,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 27, 27, 27),
                        ),
                      ),
                    ),
                    SizedBox(height: 40.h),
                    MyImagePicker(txt: "Upload Front Side"),
                    SizedBox(height: 10.h),
                    MyImagePicker(txt: "Upload Back Side"),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ));
                    },
                    child: Container(
                      height: 52.h,
                      width: 400.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40.r),
                          color: Color(0xFFDCF881)),
                      child: Center(
                        child: Text(
                          "Submit",
                          style: GoogleFonts.roboto(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              letterSpacing: -0.4,
                              fontSize: 14.4.w),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            BackGroundImage(),
          ],
        ),
      ),
    );
  }
}

class MyImagePicker extends StatefulWidget {
  final String txt;
  const MyImagePicker({super.key, required this.txt});

  @override
  State<MyImagePicker> createState() => _MyImagePickerState();
}

class _MyImagePickerState extends State<MyImagePicker> {
  File? image;
  final picker = ImagePicker();

  Future getImageFromGallary() async {
    final PickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (PickedFile != null) {
        image = File(PickedFile.path);
      }
    });
  }

  Future getImageFromCamera() async {
    final PickedFile = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      if (PickedFile != null) {
        image = File(PickedFile.path);
      }
    });
  }

  showImage() {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context);
              getImageFromGallary();
            },
            child: Text("Gallary"),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context);
              getImageFromCamera();
            },
            child: Text("Camera"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.only(left: 30.w, right: 30.w, top: 20.h, bottom: 20.h),
          child: DottedBorder(
            color: Color.fromARGB(255, 144, 136, 241), // Color of the border
            strokeWidth: 2, // Width of the dots
            dashPattern: [6, 6], // Length and spacing of the dashes
            borderType:
                BorderType.RRect, // Shape of the border (RRect, Circle, etc.)
            radius: Radius.circular(12), // Border radius for rounded rectangles
            child: SizedBox(
              width: 400.w,
              height: 220.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      showImage();
                    },
                    child: image == null
                        ? Column(
                            children: [
                              Icon(
                                Icons.file_upload_outlined,
                                size: 30,
                                color: Color.fromARGB(255, 144, 136, 241),
                              ),
                              Text(
                                widget.txt,
                                style: GoogleFonts.roboto(
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 77, 77, 77),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.file(
                              image!,
                              width: 400.w,
                              height: 220.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
