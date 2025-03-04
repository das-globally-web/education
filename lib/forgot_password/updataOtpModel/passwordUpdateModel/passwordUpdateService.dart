import 'package:dio/dio.dart';
import 'package:educationapp/forgot_password/updataOtpModel/passwordUpdateModel/passwordUpdateModel.dart';
import 'package:educationapp/forgot_password/updataOtpModel/passwordUpdateModel/passwordUpdateResModel.dart';
import 'package:retrofit/retrofit.dart';

part 'passwordUpdateService.g.dart';

@RestApi(baseUrl: 'http://education.globallywebsolutions.com')
abstract class PasswordUpdateService {
  factory PasswordUpdateService(Dio dio, {String baseUrl}) =
      _PasswordUpdateService;

  @POST('/api/update-password')
  Future<PasswordUpdateResModel> passwordUpdate(
      @Body() MyPasswordUpdateModel body);
}
