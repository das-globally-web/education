import 'package:educationapp/config/preety.dio.dart';
import 'package:educationapp/wallet/model.wallet/wallet.model.dart';
import 'package:educationapp/wallet/service.wallet/wallet.service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final walletProvider = FutureProvider<WalletModel>((ref) async {
  final wallteservice = WalletService(await createDio());
  return wallteservice.getAlltransaction();
});
