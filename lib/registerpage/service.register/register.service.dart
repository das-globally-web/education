// import 'package:dio/dio.dart';
// import 'package:educationapp/registerpage/model.register/registerResponseModel.dart';
// import 'package:retrofit/retrofit.dart';

// part 'register.service.g.dart';

// @RestApi(baseUrl: 'http://education.globallywebsolutions.com/')
// abstract class RegisterService {
//   factory RegisterService(Dio dio, {String baseUrl}) = _RegisterService;

//   @POST('api/register')
//   @MultiPart()
//   Future<RegisterResponseModel> register(
//     @Part(name: 'full_name') String fullName,
//     @Part(name: 'email') String email,
//     @Part(name: 'phone_number') String phoneNumber,
//     @Part(name: 'password') String password,
//     @Part(name: 'service_type') String serviceType,
//     @Part(name: 'user_type') String userType,
//     @Part(name: 'description') String description,
//     @Part(name: 'location') String location,
//     @Part(name: 'user_id') String userId,
//     @Part(name: 'skills_id') int skillsId,
//     @Part(name: 'profile_pic') MultipartFile profilePic, // No JSON serialization needed
//   );
// }