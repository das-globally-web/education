import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF9088F1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 200.h,
                    width: 323.w,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/grouppc.png"))),
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
            flex: 3,
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

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController =TextEditingController();
  final confirmpasswordController = TextEditingController();
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
            "Create Your Account",
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
                "Already have an account? ",
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w700,
                  fontSize: 15.w,
                  letterSpacing: -0.50,
                ),
              ),
              Text(
                "Login",
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
         RegisterField(controller: fullNameController, lable: 'Full Name',),
         RegisterField(controller: emailController, lable: 'Email Address',),
         RegisterField(controller: phoneController, lable: 'Phone Number',),
         RegisterField(controller: passwordController, lable: 'Password',),
         RegisterField(controller: confirmpasswordController, lable: 'Confirm Password',),
         SizedBox(
          height: 20.h,
         ),
         GestureDetector(
              onTap: (){
                // Navigator.push(context, CupertinoPageRoute(builder: (context) => GetStartPAge()));
              },
              child: Container(
                height: 52.h,
                width: 400.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40.r),
                  color: Color(0xFFDCF881)
                ),
                child: Center(
                  child: Text("Register Now", style: GoogleFonts.roboto(color: Colors.black, fontWeight: FontWeight.w500, letterSpacing: -0.4, fontSize: 14.4.w  ),),
                ),
              ),
            ),
        ],
      ),
    );
  }
}


class RegisterField extends StatelessWidget {
  final String lable;
  final TextEditingController controller;
  const RegisterField({super.key, required this.lable, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top: 10.h, right: 28.w, left: 28.w),
      child: Column(children: [
         Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("$lable", style: GoogleFonts.roboto(fontSize: 13.w, fontWeight: FontWeight.w400,
              color: Color(0xFF4D4D4D)
              ),)
            ],
          ),
          SizedBox( 
            height: 10.h,
          ),
          TextFormField(
            controller: controller,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(40.r),
              ),
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(40.r),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(40.r),
              ),
            ),
          )
      ],),
    );
  }
}