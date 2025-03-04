import 'package:educationapp/config/preety.dio.dart';
import 'package:educationapp/forgot_password/updataOtpModel/passwordUpdateModel/passwordUpdateController.dart';
import 'package:educationapp/forgot_password/updataOtpModel/passwordUpdateModel/passwordUpdateModel.dart';
import 'package:educationapp/forgot_password/updataOtpModel/passwordUpdateModel/passwordUpdateModelphoneBody.dart';
import 'package:educationapp/forgot_password/updataOtpModel/updateOtpService.dart';
import 'package:educationapp/login/views/login.page.dart';
import 'package:educationapp/main.dart';
import 'package:educationapp/splash/views/getstart.page.dart';
import 'package:educationapp/splash/views/splash.page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class CreatePin extends ConsumerStatefulWidget {
  final String forgetType;
  const CreatePin({super.key, required this.forgetType});

  @override
  ConsumerState<CreatePin> createState() => _CreatePinState();
}

class _CreatePinState extends ConsumerState<CreatePin> {
  final passwordControllet = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool lodar = false;
  @override
  Widget build(BuildContext context) {
    final passwordModel = ref.watch(updatePasswordProvider);
    final passwordNotifier = ref.read(updatePasswordProvider.notifier);
    return Scaffold(
      body: Container(
        height: 956.h,
        width: 440.w,
        child: Stack(
          // alignment: AlignmentDirectional.center,
          children: [
            BackGroundImage(),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                margin: EdgeInsets.only(top: 60.h, left: 20.w),
                height: 37.h,
                width: 37.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40.r),
                  color: Colors.white,
                ),
                child: Center(
                  child: Icon(
                    Icons.arrow_back,
                    size: 16.41.h,
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 25.w, left: 25.w),
                  child: Column(
                    children: [
                      Text(
                        "Create New Password",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      // Text(
                      //   "Please enter the OTP send to your email",
                      //   style: TextStyle(
                      //     fontSize: 15,
                      //     color: Colors.black,
                      //     fontWeight: FontWeight.normal,
                      //   ),
                      // ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 50.h, right: 28.w, left: 28.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 5.w),
                        child: Text(
                          "Password",
                          style: GoogleFonts.roboto(
                            fontSize: 15.w,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF4D4D4D),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      TextFormField(
                        controller: passwordControllet,
                        decoration: InputDecoration(
                          hintText: "password",
                          hintStyle: TextStyle(
                            fontSize: 15.w,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF4D4D4D),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(40.r),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(40.r),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(40.r),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 5.w, top: 20.h),
                        child: Text(
                          "Confirm Password",
                          style: GoogleFonts.roboto(
                            fontSize: 15.w,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF4D4D4D),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      TextFormField(
                        controller: confirmPasswordController,
                        decoration: InputDecoration(
                          hintText: "Confirm password",
                          hintStyle: TextStyle(
                            fontSize: 15.w,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF4D4D4D),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(40.r),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(40.r),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(40.r),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 25.w, left: 25.w),
                  child: GestureDetector(
                    onTap: () async {
                      setState(() {
                        lodar = true;
                      });

                      // ref
                      //     .read(updatePasswordProvider.notifier)
                      //     .updateEmail("hdrak6336@gmail.com");
                      // ref
                      //     .read(updatePasswordProvider.notifier)
                      //     .updataOpt("12345678");
                      // Navigator.push(
                      //     context,
                      //     CupertinoPageRoute(
                      //       builder: (context) => LoginPage(),
                      //     ));
                      if (widget.forgetType == "phone") {
                        final service = UpdateOtpService(await createDio());
                        try {
                          UpdatePhonePasswordResponse res = await service
                              .updatePassworad(UpdatePasswordPhoneModel(
                                  newPassword: passwordControllet.text,
                                  newPasswordConfirmation:
                                      confirmPasswordController.text,
                                  phoneNumber: passwordModel.email));
                          Fluttertoast.showToast(msg: "Password Update succes");
                          Navigator.pushAndRemoveUntil(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => SplashScreen()),
                              (route) => false);
                        } catch (e) {
                          Fluttertoast.showToast(msg: "Something went wrong");
                          setState(() {
                            lodar = false;
                          });
                        }
                      }
                    },
                    child: Container(
                      height: 52.h,
                      width: 400.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40.r),
                          color: Color(0xFFDCF881)),
                      child: Center(
                        child: lodar == true
                            ? Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircularProgressIndicator(),
                              )
                            : Text(
                                "Update Password",
                                style: GoogleFonts.roboto(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: -0.4,
                                    fontSize: 14.4.w),
                              ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
