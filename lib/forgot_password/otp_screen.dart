import 'package:educationapp/forgot_password/create_pin.dart';
import 'package:educationapp/forgot_password/updataOtpModel/otpController.dart';
import 'package:educationapp/forgot_password/updataOtpModel/passwordUpdateModel/passwordUpdateModel.dart';
import 'package:educationapp/splash/views/getstart.page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otpify/otpify.dart';

class OtpScreen extends ConsumerStatefulWidget {
  final String forgetType;
  const OtpScreen({super.key, required this.forgetType});

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends ConsumerState<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    final savedData = ref.watch(updatePasswordProvider);

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
                        "Verification code",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        "Please enter the OTP send to your email",
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
                  padding: EdgeInsets.only(top: 50),
                  child: Otpify(
                    fields: 6,
                    resendSecond: 10,
                    width: 50,
                    height: 50,
                    borderRadius: BorderRadius.circular(15),
                    fieldColor: Colors.white,
                    fieldTextColor: Colors.black,
                    borderColor: Colors.grey,
                    focusedBorderColor: Colors.black,
                    resendAlignment: ResendAlignment.start,
                    resendText: "Resend code",
                    resendFontWeight: FontWeight.normal,
                    // resendFontSize: 20,
                    resendColor: Colors.black,

                    onChanged: (value) {},
                    onResend: () {},
                    onCompleted: (value) {
                      ref
                          .read(updatePasswordProvider.notifier)
                          .updataOpt(value);
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => CreatePin(
                            forgetType: 'email',
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
      ),
    );
  }
}
