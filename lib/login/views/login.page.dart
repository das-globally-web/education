import 'package:educationapp/config/helpers.dart';
import 'package:educationapp/config/preety.dio.dart';
import 'package:educationapp/home/views/home.page.dart';
import 'package:educationapp/localstorage/db.dart';
import 'package:educationapp/localstorage/localdb.dart';
import 'package:educationapp/login/controller/login.controller.dart';
import 'package:educationapp/login/controller/service/login.service.dart';
import 'package:educationapp/login/model/login.body.model.dart';
import 'package:educationapp/login/model/login.rsponse.model.dart';
import 'package:educationapp/registerpage/views/register.page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF9088F1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              flex: 1,
              child: Stack(
                alignment: AlignmentDirectional.topCenter,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 343.h,
                        width: 392.w,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/childcuate.png"))),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 250.h,
                        width: 250.w,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                  "assets/whitevector.png",
                                ),
                                fit: BoxFit.fill)),
                      )
                    ],
                  ),
                ],
              )),
          Expanded(
            flex: 1,
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.w),
                      topRight: Radius.circular(40.w))),
              child: RegisterForm(),
            ),
          )
        ],
      ),
    );
  }
}

class RegisterForm extends ConsumerStatefulWidget {
  const RegisterForm({super.key});

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends ConsumerState<RegisterForm> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 30.h,
          ),
          Text(
            "Welcome Back !",
            style: GoogleFonts.roboto(
                fontWeight: FontWeight.w600,
                fontSize: 26.w,
                letterSpacing: -0.95),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Don’t have an account? ",
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w700,
                  fontSize: 15.w,
                  letterSpacing: -0.50,
                ),
              ),
              Text(
                "Sign up",
                style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w700,
                    fontSize: 15.w,
                    letterSpacing: -0.50,
                    color: Color(0xFF9088F1)),
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 30.w, right: 30.w),
            child: Divider(
              height: 1,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          RegisterField(
            controller: emailController,
            lable: 'Email Address',
          ),
          RegisterField(
            controller: passwordController,
            lable: 'Password',
          ),
          SizedBox(
            height: 20.h,
          ),
          GestureDetector(
            onTap: () async {
              Navigator.push(context,
                  CupertinoPageRoute(builder: (context) => HomePage()));

              // ignore: unused_result

              try {
                ref
                    .watch(loginControllerProvider(LoginBodyModel(
                      email: emailController.text,
                      password: passwordController.text,
                    )))
                    .when(
                      data: (response) {

                        final userBox = Hive.box<User>('mybox');
                        userBox.put(
                            'user1',
                            User(response.data.email.toString(),
                                response.data.token.toString()));
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => HomePage()));
                      },
                      loading: () => (),
                      error: (err, stack) {
                        Helpers.errorString("Email & Password was wrong");
                      },
                    );
              } catch (e) {
                Helpers.errorString("Some thing went wrong!");
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
                  "Login",
                  style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.4,
                      fontSize: 14.4.w),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
