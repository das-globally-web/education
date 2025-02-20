// import 'dart:io';

// import 'package:dio/dio.dart';
// import 'package:educationapp/config/preety.dio.dart';
// import 'package:educationapp/registerpage/model.register/registerResponseModel.dart';
// import 'package:educationapp/registerpage/service.register/register.service.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// final registerProvider =
//     FutureProvider.family<RegisterResponseModel, registerBodyModel>(
//         (ref, registerBodyModel) async {
//   final registerservice = RegisterService(await createDio());
//   return registerservice.register(data: {
//     "fullname": registerBodyModel.fullName,
//     "email": registerBodyModel.email,
//     "phonenumber": registerBodyModel.phoneNumber,
//     "password": registerBodyModel.password,
//     "cnfirmpassword": registerBodyModel.confirmpassword,
//     "language": registerBodyModel.languageKnow,
//     "experience": registerBodyModel.totlaExperinece,
//     "servicetype": registerBodyModel.serviceType,
//     "profilepic": registerBodyModel.profilePic,
//     "skillsId": registerBodyModel.skillsId,
//     "usertype": registerBodyModel.userType,
//     "description": registerBodyModel.description,
//     "locaiton": registerBodyModel.location
//   }
//       // registerBodyModel.fullName,
//       // registerBodyModel.email,
//       // registerBodyModel.phoneNumber,
//       // registerBodyModel.password,
//       // registerBodyModel.confirmpassword,
//       // registerBodyModel.languageKnow,
//       // registerBodyModel.totlaExperinece,
//       // registerBodyModel.serviceType,
//       // registerBodyModel.profilePic,
//       // registerBodyModel.skillsId,
//       // registerBodyModel.userType,
//       // registerBodyModel.description,
//       // registerBodyModel.location,

//       );
// });

// class registerBodyModel {
//   final String fullName;
//   final String email;
//   final String phoneNumber;
//   final String password;
//   final String confirmpassword;
//   final String languageKnow;
//   final String totlaExperinece;
//   final String serviceType;
//   final MultipartFile? profilePic;
//   final String skillsId;
//   final String userType;
//   final String description;
//   final String location;

//   registerBodyModel({
//     required this.fullName,
//     required this.email,
//     required this.phoneNumber,
//     required this.password,
//     required this.confirmpassword,
//     required this.languageKnow,
//     required this.totlaExperinece,
//     required this.serviceType,
//     required this.profilePic,
//     required this.skillsId,
//     required this.userType,
//     required this.description,
//     required this.location,
//   });
// }
