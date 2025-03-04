import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyPasswordUpdateModel {
  final String email;
  final String otp;

  MyPasswordUpdateModel({
    required this.email,
    required this.otp,
  });

  MyPasswordUpdateModel copyWith({
    String? email,
    String? otp,
  }) {
    return MyPasswordUpdateModel(
      email: email ?? this.email,
      otp: otp ?? this.otp,
    );
  }
}

class MyPasswordNotifier extends StateNotifier<MyPasswordUpdateModel> {
  MyPasswordNotifier() : super(MyPasswordUpdateModel(email: '', otp: ''));

  void updateEmail(String email) {
    state = state.copyWith(email: email);
  }

  void updataOpt(String otp) {
    state = state.copyWith(otp: otp);
  }
}

final updatePasswordProvider =
    StateNotifierProvider<MyPasswordNotifier, MyPasswordUpdateModel>((ref) {
  return MyPasswordNotifier();
});
