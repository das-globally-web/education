import 'package:dio/dio.dart';
import 'package:educationapp/forgot_password/updataOtpModel/passwordUpdateModel/passwordUpdateModelphoneBody.dart';
import 'package:educationapp/forgot_password/updataOtpModel/updataOtpBodyModel.dart';
import 'package:educationapp/forgot_password/updataOtpModel/updateOptResModel.dart';
import 'package:retrofit/retrofit.dart';

part 'updateOtpService.g.dart';

@RestApi(baseUrl: 'http://education.globallywebsolutions.com')
abstract class UpdateOtpService {
  factory UpdateOtpService(Dio dio, {String baseUrl}) = _UpdateOtpService;

  @POST('/api/send-password-update-otp')
  Future<UpdataOtpResModel> sendotp(@Body() UpdataOtpBodyModel body);
  @POST('/api/update-phone-password')
  Future<UpdatePhonePasswordResponse> updatePassworad(
      @Body() UpdatePasswordPhoneModel body);
}
