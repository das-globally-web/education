import 'dart:developer';
import 'dart:convert';
import 'package:educationapp/collegeReviews/controller/service/collage.service.dart';
import 'package:educationapp/collegeReviews/model/allmentors.model.dart';
import 'package:educationapp/collegeReviews/model/perticuler.collage.model.dart';
import 'package:educationapp/findmentor/model/allmentors.model.dart';
import 'package:educationapp/home/controller/service/home.service.dart';
import 'package:educationapp/home/controller/service/searchMentorService.dart';
import 'package:educationapp/home/model/mentors.model.dart';
import 'package:educationapp/home/model/searchMentorModel.dart';
import 'package:educationapp/login/views/login.page.dart';
import 'package:educationapp/registerpage/model.register/registerResponseModel.dart';
import 'package:educationapp/splash/models/service.model.dart';
import 'package:educationapp/splash/service/getstart.service.dart';
import 'package:educationapp/trendingskills/controller/service/searchSkillService.dart';
import 'package:educationapp/trendingskills/controller/service/skills.service.dart';
import 'package:educationapp/trendingskills/model/new.skills.model.dart';
import 'package:educationapp/trendingskills/model/searchSkillModel.dart';
import 'package:educationapp/trendingskills/model/skills.model.dart';
import 'package:educationapp/trendingskills/views/model.review/review.model.dart';
import 'package:educationapp/trendingskills/views/service.review/review.service.dart';
import 'package:educationapp/wallet/model.wallet/user.trx.model.body.dart';
import 'package:educationapp/wallet/model.wallet/user.trx.model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:educationapp/wallet/model.wallet/wallet.model.dart';
import 'package:educationapp/wallet/service.wallet/wallet.service.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class ApiController {
  static Future<ServiceModelRes> fetchService(GetStartService service) async {
    return await service.getAllService();
  }

  static Future<AllMentorsModel> fetchMentors(HomeService service) async {
    return await service.allMentors(MentorsModelBody(userType: 'mentor'));
  }

  static Future<SkillsModel> getAllSkilss(SkillService service) async {
    return await service.getALLSiklls();
  }

  static Future<AddReviewModel> getAllReview(
      Map<String, dynamic> params) async {
    AddreviewService service = params['service'];
    String id = params['id'];
    return await service.getAllReview(id);
  }

  static Future<AllUniModel> getallCollage(CollageService service) async {
    return await service.getAllCollages();
  }

  static Future<PerticulerCollageModel> getPerticulerCollage(
      Map<String, dynamic> params) async {
    CollageService service = params['service'];
    String id = params['id'];
    return await service.getPErticulerCollage(id);
  }

  static Future<NewSkillsModel> getNewAllSkills(
      Map<String, dynamic> params) async {
    SkillService service = params['service'];
    String id = params['id'];
    return await service.getNewAllSkills(id);
  }

  static Future<WalletModel> getAllWallet(WalletService service) async {
    return await service.getAlltransaction();
  }

  static Future<SearchSkillModel> searchSkill(
      Map<String, dynamic> params) async {
    SearchSkillService service = params['service'];
    String query = params['query'];
    return await service.getAllSearchSkill(query);
  }

  static Future<SearchMentorModel> searchMentors(
      Map<String, dynamic> params) async {
    SearchMentorService service = params['service'];
    String query = params['query'];
    return await service.getallSearchMentor(query);
  }

  static Future<UserTranctionModel> getUserTrx(WalletService service) async {
    return await service.getUserTrack();
  }

  static Future<UserTranctionResModel> storeTrx(
      Map<String, dynamic> params) async {
    WalletService service = params['service'];
    UserTranctionBodyModel body = params['body'];

    return service.storeTrx(body);
  }

  static Future<RegisterResponseModel> registerUser({
    required XFile imageFile,
    required XFile resumeFile,
    required String fullName,
    required String email,
    required String phoneNumber,
    required String serviceType,
    required String userType,
    required String description,
    required String location,
    required String useridcard,
    required String password,
    required int skillsId,
    required String totlaExperinece,
    required String linkdin_url,
    required String dob,
    required String gender,
    required String userfield,
    required String language_known,
    required dynamic context,
    required Function ifError,
  }) async {
    final Uri url =
        Uri.parse("http://education.globallywebsolutions.com/api/register");

    if (imageFile == null || resumeFile == null) {
      Fluttertoast.showToast(msg: "Please select image and resume");
      throw Exception("Image or resume is missing");
    }

    var request = http.MultipartRequest("POST", url);
    request.headers.addAll({
      // Example Authorization header
      "Content-Type": "application/json",
      "Accept": "application/json", // Ensure content type is correct
      // You can add other custom headers here
    });
    // Attach files
    request.files
        .add(await http.MultipartFile.fromPath('profile_pic', imageFile.path));
    request.files.add(
        await http.MultipartFile.fromPath('resume_upload', resumeFile.path));

    // Add form fields
    request.fields.addAll({
      "user_id": "1",
      "full_name": fullName,
      "email": email,
      "phone_number": phoneNumber,
      "password": password,
      "service_type": serviceType,
      "user_type": userType,
      "description": description,
      "location": location,
      "skills_id": skillsId.toString(),
      "users_field": userfield,
      "total_experience": totlaExperinece,
      "language_known": language_known,
      "linkedin_user": linkdin_url,
      "dob": dob,
      "gender": gender
    });

    try {
      final http.StreamedResponse response = await request.send();

      final responseBody = await response.stream.bytesToString();
      log(responseBody); // Log response for debugging
      Map<String, dynamic> data = jsonDecode(responseBody);
      if (response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("$fullName your account was created ")));
        Navigator.pushAndRemoveUntil(
            context,
            CupertinoDialogRoute(
                builder: (context) => LoginPage(), context: context),
            (route) => false);
        return RegisterResponseModel.fromJson(jsonDecode(responseBody));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("${data["message"].toString()}")));
        ifError();
        throw Exception("Failed to register: ${response.reasonPhrase}");
      }
    } catch (e) {
      throw Exception("Something went wrong: $e");
    }
  }

  static Future<RegisterResponseModel> register({
    required XFile imageFile,
    required String fullName,
    required String email,
    required String phoneNumber,
    required String serviceType,
    required String userType,
    required String description,
    required String location,
    required String password,
    required String dob,
    required String gender,
    required dynamic context,
    required Function ifError,
    required String samester,
  }) async {
    final Uri url =
        Uri.parse("http://education.globallywebsolutions.com/api/register");

    var request = http.MultipartRequest("POST", url);
    request.headers.addAll({
      // Example Authorization header
      "Content-Type": "application/json",
      "Accept": "application/json", // Ensure content type is correct
      // You can add other custom headers here
    });
    // Attach files
    request.files
        .add(await http.MultipartFile.fromPath('profile_pic', imageFile.path));

    // Add form fields
    request.fields.addAll({
      "user_id": "1",
      "full_name": fullName,
      "email": email,
      "phone_number": phoneNumber,
      "password": password,
      "service_type": serviceType,
      "user_type": userType,
      "description": description,
      "location": location,
      "dob": dob,
      "gender": gender,
      "samester": samester,
    });

    try {
      final http.StreamedResponse response = await request.send();

      final responseBody = await response.stream.bytesToString();
      log(responseBody); // Log response for debugging
      Map<String, dynamic> data = jsonDecode(responseBody);
      if (response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("$fullName your account was created ")));
        Navigator.pushAndRemoveUntil(
            context,
            CupertinoDialogRoute(
                builder: (context) => LoginPage(), context: context),
            (route) => false);
        return RegisterResponseModel.fromJson(jsonDecode(responseBody));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("${data["message"].toString()}")));
        ifError();
        throw Exception("Failed to register: ${response.reasonPhrase}");
      }
    } catch (e) {
      throw Exception("Something went wrong: $e");
    }
  }

  static Future<Map> uploadDocuments(
      {required String userid,
      required XFile frontImg,
      required XFile backImage}) async {
    final Uri url =
        Uri.parse("http://education.globallywebsolutions.com/api/documents");

    var request = http.MultipartRequest("POST", url);
    var box = Hive.box('userdata');
    var token = box.get('token');
    request.headers.addAll({
      "Content-Type": "application/json",
      "Accept": "application/json",
      'Authorization': 'Bearer $token',
    });
    request.files
        .add(await http.MultipartFile.fromPath('image_1', frontImg.path));
    request.files
        .add(await http.MultipartFile.fromPath('image_2', frontImg.path));
    request.fields.addAll({
      "user_id": userid,
    });

    try {
      final http.StreamedResponse response = await request.send();
      final responseBody = await response.stream.bytesToString();
      Map<String, dynamic> data = jsonDecode(responseBody);
      if (response.statusCode == 200 || response.statusCode == 201) {
        Fluttertoast.showToast(msg: "Documents Uploded");
        return data;
      } else {
        Fluttertoast.showToast(msg: "Some thing went wrong");
        throw Exception();
      }
    } catch (e) {
      throw Exception();
    }
  }
}
