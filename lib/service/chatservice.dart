import 'package:educationapp/findmentor/model/allmentors.model.dart';
import 'package:educationapp/home/model/companyReviewModel.dart';
import 'package:educationapp/home/model/mentors.model.dart';
import 'package:educationapp/home/model/userprofile.model.dart';
import 'package:educationapp/service/chatresmodel.dart';

import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart' hide Headers;
part 'chatservice.g.dart';

@RestApi(baseUrl: 'https://seahorse-app-bl4sq.ondigitalocean.app')
abstract class Chatservice {
  factory Chatservice(Dio dio, {String baseUrl}) = _Chatservice;
  @GET('/messages/{userid}/{rescUserid}?limit=1000')
  Future<ChatResponseModel> chatHestory(@Path('userid') String userid, @Path('rescUserid') String rescUserid);
}


