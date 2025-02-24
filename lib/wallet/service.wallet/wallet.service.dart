import 'package:dio/dio.dart';
import 'package:educationapp/wallet/model.wallet/user.trx.model.body.dart';
import 'package:educationapp/wallet/model.wallet/user.trx.model.dart';
import 'package:educationapp/wallet/model.wallet/wallet.model.dart';
import 'package:retrofit/retrofit.dart';

part 'wallet.service.g.dart';

@RestApi(baseUrl: 'http://education.globallywebsolutions.com')
abstract class WalletService {
  factory WalletService(Dio dio, {String baseUrl}) = _WalletService;

  @GET('/api/get-volite')
  Future<WalletModel> getAlltransaction();
  @GET('/api/get-user-transaction')
  Future<UserTranctionModel> getUserTrack();
  @POST('/api/store-transaction')
  Future<UserTranctionResModel> storeTrx(@Body() UserTranctionBodyModel body);
}
