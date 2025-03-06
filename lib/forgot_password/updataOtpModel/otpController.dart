import 'package:educationapp/config/preety.dio.dart';
import 'package:educationapp/forgot_password/updataOtpModel/updataOtpBodyModel.dart';
import 'package:educationapp/forgot_password/updataOtpModel/updateOptResModel.dart';
import 'package:educationapp/forgot_password/updataOtpModel/updateOtpService.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final otpUpdataProvider =
    FutureProvider.autoDispose.family<UpdataOtpResModel, UpdataOtpBodyModel>(
        (ref, body) async {
  final updateotpservice = UpdateOtpService(await createDio());
  return updateotpservice.sendotp(body);
});
