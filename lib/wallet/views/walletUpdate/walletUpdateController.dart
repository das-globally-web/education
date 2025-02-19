import 'package:educationapp/config/preety.dio.dart';
import 'package:educationapp/wallet/views/walletUpdate/walletUpdateBodyModel.dart';
import 'package:educationapp/wallet/views/walletUpdate/walletUpdateResponseModel.dart';
import 'package:educationapp/wallet/views/walletUpdate/walletUpdateService.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final walletUpdateProvider =
    FutureProvider.family<WalletUpdateResponseModel, WalletUpdateBodyModel>(
        (ref, body) async {
  final walletupdateservice = WalletUpdateService(await createDio());
  return walletupdateservice.allWalletUpdate(body);
});
