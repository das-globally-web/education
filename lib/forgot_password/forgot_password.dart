import 'dart:developer';

import 'package:educationapp/forgot_password/create_pin.dart';
import 'package:educationapp/forgot_password/otp_screen.dart';
import 'package:educationapp/forgot_password/updataOtpModel/otpController.dart';
import 'package:educationapp/forgot_password/updataOtpModel/passwordUpdateModel/passwordUpdateModel.dart';
import 'package:educationapp/forgot_password/updataOtpModel/updataOtpBodyModel.dart';
import 'package:educationapp/splash/views/getstart.page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otpless_flutter/otpless_flutter.dart';

class ForgotPassword extends ConsumerStatefulWidget {
  const ForgotPassword({super.key});

  @override
  ConsumerState<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends ConsumerState<ForgotPassword> {
  final emailControlelr = TextEditingController();
  bool sendotp = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 956.h,
        width: 440.w,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
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
                        "Forgot Your Password?",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        "Enter your email address and we will send you OTP to reset your password",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 50.h, right: 28.w, left: 28.w),
                  child: TextFormField(
                    controller: emailControlelr,
                    decoration: InputDecoration(
                      hintText: "Enter Email",
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
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.h, right: 28.w, left: 28.w),
                  child: InkWell(
                    onTap: () async {
                      setState(() {
                        sendotp = true;
                      });

                      try {
                        final updateOtpData = await ref.watch(otpUpdataProvider(
                          UpdataOtpBodyModel(email: emailControlelr.text),
                        ));
                        ref
                            .read(updatePasswordProvider.notifier)
                            .updateEmail(emailControlelr.text);
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => OtpScreen(
                                forgetType: 'email',
                              ),
                            ));
                      } catch (E) {
                        Fluttertoast.showToast(msg: "Something went wrong");
                        setState(() {
                          sendotp = false;
                        });
                      }
                    },
                    child: Container(
                      height: 52.h,
                      width: 400.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40.r),
                          color: Color(0xFFDCF881)),
                      child: Center(
                        child: sendotp == false
                            ? Text(
                                "Send OTP",
                                style: GoogleFonts.roboto(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: -0.4,
                                    fontSize: 14.4.w),
                              )
                            : Padding(
                                padding: EdgeInsets.all(4.0.w),
                                child: CircularProgressIndicator(),
                              ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50.h,
                ),
                GestureDetector(
                    onTap: () {
                      final _otplessFlutterPlugin = Otpless();
                      var arg = {
                        'appId': 'JYFU6ID218T8YLYRVQFC',
                      };
                      _otplessFlutterPlugin.openLoginPage((result) {
                        var message = "";
                        if (result['data'] != null) {
                          log(result.toString());

                          String number =
                              result['data']['identities'][0]['identityValue'];
                          ref
                              .read(updatePasswordProvider.notifier)
                              .updateEmail(number.substring(2));
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => CreatePin(
                                forgetType: "phone",
                              ),
                            ),
                          );
                        } else {
                          message = result['errorMessage'];
                          Fluttertoast.showToast(
                              msg: "${result["errorMessage"]}");
                        }
                      }, arg);
                    },
                    child: Text(
                      "Forget password using phone no.",
                      style: GoogleFonts.montserrat(color: Colors.black),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
