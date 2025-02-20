import 'package:educationapp/CORE/api_controller.dart';
import 'package:educationapp/config/preety.dio.dart';
import 'package:educationapp/home/controller/homeController.dart';
import 'package:educationapp/wallet/model.wallet/user.trx.model.dart';
import 'package:educationapp/wallet/model.wallet/wallet.model.dart';
import 'package:educationapp/wallet/service.wallet/wallet.service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final walletClientProvider = FutureProvider<WalletService>((ref) async {
  final dio = await ref.watch(dioProvider.future);
  return WalletService(dio);
});

final walletProvider = FutureProvider<WalletModel>((ref) async {
  final client = await ref.watch(walletClientProvider.future);
  return await compute(ApiController.getAllWallet, client);
});

final userTrxProvider = FutureProvider<UserTranctionModel>((ref) async {
  final clinet = await ref.watch(walletClientProvider.future);
  return await compute(ApiController.getUserTrx, clinet);
});

// final walletProvider = FutureProvider<WalletModel>((ref) async {
//   final wallteservice = WalletService(await createDio());
//   return wallteservice.getAlltransaction();
// });
