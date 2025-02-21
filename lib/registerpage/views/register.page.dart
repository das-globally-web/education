import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:educationapp/CORE/api_controller.dart';
import 'package:educationapp/registerpage/model.register/registerResponseModel.dart';
import 'package:educationapp/splash/views/getstart.page.dart';
import 'package:educationapp/trendingskills/controller/sikllscontroller.dart';
import 'package:educationapp/trendingskills/model/skills.model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomCenter,
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
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.w),
                      topRight: Radius.circular(40.w))),
              child: RegisterForm(),
            )
          ],
        ),
      ),
    );
  }
}

class RegisterForm extends ConsumerStatefulWidget {
  const RegisterForm({super.key});

  @override
  ConsumerState<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends ConsumerState<RegisterForm> {
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();
  final languageKnownController = TextEditingController();
  final locationController = TextEditingController();
  final descriptionController = TextEditingController();
  final totalExperienceController = TextEditingController();
  final dateofBrithController = TextEditingController();
  final genderController = TextEditingController();
  final addressController = TextEditingController();
  final linkedinController = TextEditingController();
  String _selectedItem = "Select stream";

  final List<String> _dropdownItems = [
    'Select stream',
    'IT',
    'Electrical',
    'Electronics',
    'Mechanical',
    'Mechatronics',
    'Civil',
    'Instrumentation',
    'Metallurgy',
    'Chemical',
  ];

  XFile? imageFile;

  getImageFromGallery() async {
    final ImagePicker _picker = ImagePicker();
    setState(() async {
      imageFile = await _picker.pickImage(source: ImageSource.gallery);
    });
  }

  getImageFromCamera() async {
    final ImagePicker _picker = ImagePicker();
    setState(() async {
      imageFile = await _picker.pickImage(source: ImageSource.camera);
    });
  }

  Future showImage() async {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context);
              getImageFromGallery();
            },
            child: Text("Gallery"),
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

  Future<MultipartFile?> getMultipartFile(File? imageFile) async {
    if (imageFile == null) return null;
    return await MultipartFile.fromFile(
      imageFile.path,
      filename: imageFile.path.split('/').last, // सही फाइल नाम सुनिश्चित करें
    );
  }

  Datum? _selectedSkill = Datum(
      id: 0,
      title: "Select Skill",
      subTitle: "",
      image: "",
      description: "",
      createdAt: DateTime.now(),
      updatedAt: DateTime.now());
  @override
  Widget build(BuildContext context) {
    final skilsProvider = ref.watch(skilssProvide);
    return skilsProvider.when(
        data: (snapshot) {
          return Column(
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
              RegisterField(
                controller: fullNameController,
                lable: 'Full Name',
              ),
              RegisterField(
                controller: emailController,
                lable: 'Email Address',
              ),
              SizedBox(
                height: 18.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 30.w,
                  ),
                  Text(
                    "Phone Number",
                    style: GoogleFonts.roboto(
                        fontSize: 13.w,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF4D4D4D)),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 28.w, right: 28.w, top: 10.h),
                child: IntlPhoneField(
                  controller: phoneController,
                  decoration: InputDecoration(
                    hintText: "XXXXXXXXXXX",
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
                  initialCountryCode: 'IN',
                  onChanged: (phone) {
                    print(phone.completeNumber);
                  },
                ),
              ),
              RegisterField(
                controller: passwordController,
                lable: 'Password',
              ),
              RegisterField(
                controller: confirmpasswordController,
                lable: 'Confirm Password',
              ),
              RegisterField(
                controller: dateofBrithController,
                lable: 'Date of Birth',
              ),
              RegisterField(
                controller: genderController,
                lable: 'Gender',
              ),
              RegisterField(
                controller: addressController,
                lable: 'Address',
              ),
              if (UserRegisterDataHold.usertype == "Mentor") ...[
                RegisterField(
                  controller: languageKnownController,
                  lable: 'Languages known',
                ),
                RegisterField(
                  controller: linkedinController,
                  lable: 'LinkedIn Url ',
                ),
                RegisterField(
                  controller: descriptionController,
                  lable: 'description',
                ),
                RegisterField(
                  controller: totalExperienceController,
                  lable: 'Total Experience',
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 30.w,
                    ),
                    Text(
                      "Works Stream",
                      style: GoogleFonts.roboto(
                          fontSize: 13.w,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF4D4D4D)),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 28.w, right: 28.w, top: 10.h),
                  child: DropdownButtonFormField<String>(
                    value: _selectedItem,
                    items: _dropdownItems.map((String item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: GoogleFonts.roboto(
                              fontSize: 13.w,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF4D4D4D)),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedItem = newValue!;
                      });
                    },
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      enabledBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(40.r), // Circular radius
                        borderSide: BorderSide(
                          color: Colors.grey, // Border color
                          width: 1, // Border width
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40.r),
                        borderSide: BorderSide(
                          color: Colors.grey, // Focused border color
                          width: 1,
                        ),
                      ),
                      filled: true,
                      fillColor:
                          Colors.white, // Background color of the dropdown
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
                    SizedBox(
                      width: 30.w,
                    ),
                    Text(
                      "Expertise / Skills",
                      style: GoogleFonts.roboto(
                          fontSize: 13.w,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF4D4D4D)),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 28.w, right: 28.w, top: 10.h),
                  child: DropdownButtonFormField<Datum>(
                    value: snapshot.data.contains(_selectedSkill)
                        ? _selectedSkill
                        : null,
                    items: snapshot.data.toSet().toList().map((Datum item) {
                      return DropdownMenuItem<Datum>(
                        value: item,
                        child: Text(
                          item.title,
                          style: GoogleFonts.roboto(
                              fontSize: 13.w,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF4D4D4D)),
                        ),
                      );
                    }).toList(),
                    onChanged: (Datum? newValue) {
                      setState(() {
                        _selectedSkill = newValue!;
                      });
                    },
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      enabledBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(40.r), // Circular radius
                        borderSide: BorderSide(
                          color: Colors.grey, // Border color
                          width: 1, // Border width
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40.r),
                        borderSide: BorderSide(
                          color: Colors.grey, // Focused border color
                          width: 1,
                        ),
                      ),
                      filled: true,
                      fillColor:
                          Colors.white, // Background color of the dropdown
                    ),
                  ),
                ),
              ],
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 30.w,
                  ),
                  Text(
                    "Upload Profile Pic",
                    style: GoogleFonts.roboto(
                        fontSize: 13.w,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF4D4D4D)),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: 30.w, right: 30.w, top: 20.h, bottom: 20.h),
                child: DottedBorder(
                  color: Colors.blue, // Color of the border
                  strokeWidth: 2, // Width of the dots
                  dashPattern: [6, 3], // Length and spacing of the dashes
                  borderType: BorderType
                      .RRect, // Shape of the border (RRect, Circle, etc.)
                  radius: Radius.circular(
                      12), // Border radius for rounded rectangles
                  child: GestureDetector(
                    onTap: () {
                      showImage();
                      Future.delayed(Duration(seconds: 1), () {
                        setState(() {
                          ref.refresh(skilssProvide);
                        });
                      });
                    },
                    child: Container(
                      height: 150,
                      width: 400.w,
                      alignment: Alignment.center,
                      child: imageFile == null
                          ? Text(
                              'Upload Image +',
                              style: GoogleFonts.roboto(color: Colors.black),
                            )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.file(
                                File(imageFile!.path),
                                height: 150,
                                width: 400.w,
                                fit: BoxFit.cover,
                              ),
                            ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () async {
                  // Check if any field is empty
                  if (fullNameController.text.isEmpty ||
                      emailController.text.isEmpty ||
                      phoneController.text.isEmpty ||
                      passwordController.text.isEmpty ||
                      confirmpasswordController.text.isEmpty ||
                      languageKnownController.text.isEmpty ||
                      totalExperienceController.text.isEmpty ||
                      descriptionController.text.isEmpty ||
                      locationController.text.isEmpty) {
                    // Show error toast
                    Fluttertoast.showToast(
                      msg: "Please fill in the box",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                    );
                    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    //   content: Text("Please fill in the box"),
                    // ));
                    return; // Stop further execution
                  }

                  // Check if password and confirm password match
                  if (passwordController.text !=
                      confirmpasswordController.text) {
                    Fluttertoast.showToast(
                      msg: "password not match ",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                    );
                    return;
                  }
                  // Navigator.push(context, CupertinoPageRoute(builder: (context) => GetStartPAge()));
                  // final multipartImage = await getMultipartFile(_image);

                  // final registerprovider = ref.watch(
                  //   registerProvider(
                  //     registerBodyModel(
                  //       fullName: fullNameController.text,
                  //       email: emailController.text,
                  //       phoneNumber: phoneController.text.toString(),
                  //       password: passwordController.text.toString(),
                  //       confirmpassword: confirmpasswordController.text.toString(),
                  //       languageKnow: languageKnownController.text,
                  //       totlaExperinece: totalExperienceController.text.toString(),
                  //       serviceType: '',
                  //       profilePic: multipathfile,
                  //       skillsId: '',
                  //       userType: '',
                  //       description: descriptionController.text,
                  //       location: locationController.text,
                  //     ),
                  //   ),
                  // );
                  // if (registerprovider != null) {
                  //   Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //         builder: (context) => HomePage(),
                  //       ));
                  // } else {
                  //   // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  //   //   content: Text("Register Failed"),
                  //   // ));
                  //   Fluttertoast.showToast(msg: "Register Failed");
                  // }
                  RegisterResponseModel res = await ApiController.registerUser(
                      imageFile: imageFile!,
                      fullName: fullNameController.text,
                      email: emailController.text,
                      phoneNumber: phoneController.text,
                      serviceType: '',
                      userType: 'userType',
                      description: descriptionController.text,
                      location: locationController.text,
                      useridcard: 'useridcard',
                      password: passwordController.text,
                      skillsId: 1);
                },
                child: Container(
                  height: 52.h,
                  width: 400.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40.r),
                      color: Color(0xFFDCF881)),
                  child: Center(
                    child: Text(
                      "Register Now",
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
          );
        },
        error: (err, stack) {
          return Center();
        },
        loading: () => SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ));
  }
}

class RegisterField extends StatelessWidget {
  final String lable;
  final TextEditingController controller;
  const RegisterField(
      {super.key, required this.lable, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h, right: 28.w, left: 28.w),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "$lable",
                style: GoogleFonts.roboto(
                    fontSize: 13.w,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF4D4D4D)),
              ),
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
          ),
        ],
      ),
    );
  }
}
