import 'package:dio/dio.dart';
import 'package:educationapp/wallet/views/walletUpdate/walletUpdateBodyModel.dart';
import 'package:educationapp/wallet/views/walletUpdate/walletUpdateResponseModel.dart';
import 'package:retrofit/retrofit.dart';

part 'walletUpdateService.g.dart';

@RestApi(baseUrl: 'http://education.globallywebsolutions.com')
abstract class WalletUpdateService {
  factory WalletUpdateService(Dio dio, {String baseUrl}) = _WalletUpdateService;

  @POST('/api/volite-update')
  Future<WalletUpdateResponseModel> allWalletUpdate(
      @Body() WalletUpdateBodyModel body);
}
