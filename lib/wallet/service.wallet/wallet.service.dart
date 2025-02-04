import 'package:dio/dio.dart';
import 'package:educationapp/wallet/model.wallet/wallet.model.dart';
import 'package:retrofit/retrofit.dart';

part 'wallet.service.g.dart';

@RestApi(baseUrl: 'http://education.globallywebsolutions.com')
abstract class WalletService {
  factory WalletService(Dio dio, {String baseUrl}) = _WalletService;

  @GET('/api/get-user-transaction')
  Future<WalletModel> getAlltransaction();
}
