import 'package:educationapp/wallet/model.wallet/user.trx.model.body.dart';
import 'package:educationapp/wallet/views/walletUpdate/walletUpdateBodyModel.dart';
import 'package:educationapp/wallet/views/walletUpdate/walletUpdateController.dart';
import 'package:educationapp/wallet/walletController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';

class WalletPage extends ConsumerStatefulWidget {
  const WalletPage({super.key});

  @override
  ConsumerState<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends ConsumerState<WalletPage> {
  int voletId = 0;
  int currentBalance = 0;
  @override
  Widget build(BuildContext context) {
    final wallteserviceProvider = ref.watch(walletProvider);
    final userTrxProviderdata = ref.watch(userTrxProvider);
    return Scaffold(
      backgroundColor: Color(0xFF1B1B1B),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 70.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 30.w,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 44.h,
                    width: 44.w,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(39, 255, 255, 255),
                        borderRadius: BorderRadius.circular(500.r)),
                    child: Center(
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Color.fromARGB(255, 248, 248, 248),
                        size: 15.w,
                      ),
                    ),
                  ),
                ),
                Spacer(),
                Text(
                  "Wallet",
                  style: GoogleFonts.roboto(
                      fontSize: 18.w,
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 144, 136, 241)),
                ),
                Spacer(),
                Container(
                  height: 44.h,
                  width: 44.w,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(39, 255, 255, 255),
                    borderRadius: BorderRadius.circular(500.r),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.search,
                      color: const Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ),
                SizedBox(
                  width: 30.w,
                ),
              ],
            ),
            SizedBox(
              height: 25.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 30.w,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Balance",
                      style: GoogleFonts.roboto(
                          fontSize: 14.w,
                          color: Colors.white,
                          fontWeight: FontWeight.w400),
                    ),
                    wallteserviceProvider.when(
                      data: (snapshot) {
                        setState(() {
                          voletId = snapshot.data.id;
                          currentBalance = int.parse(
                              double.tryParse(snapshot.data.balance)!
                                  .toStringAsFixed(0)
                                  .toString());
                        });
                        return Text(
                          "${double.tryParse(snapshot.data.balance)!.toStringAsFixed(0)} Coins",
                          style: GoogleFonts.roboto(
                              fontSize: 24.w,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        );
                      },
                      error: (error, stackTrace) {
                        return Center(
                          child: Text("Error:$error"),
                        );
                      },
                      loading: () {
                        return Container();
                      },
                    ),
                  ],
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled:
                          true, // Makes the bottom sheet full-screen draggable
                      builder: (context) {
                        return DraggableBottomSheetContent(
                          callback: () {
                            setState(() {
                              ref.refresh(walletProvider);
                              ref.refresh(userTrxProvider);
                            });
                          },
                          voletid: voletId.toString(),
                          currentBalance: currentBalance,
                        );
                      },
                    );
                  },
                  child: Container(
                    height: 44.h,
                    width: 106.w,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 220, 248, 129),
                        borderRadius: BorderRadius.circular(40.r)),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add,
                            color: Colors.black,
                            size: 16.w,
                          ),
                          SizedBox(
                            width: 3.w,
                          ),
                          Text(
                            "Add Coin",
                            style: GoogleFonts.roboto(
                                fontSize: 12.w, fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 30.w,
                ),
              ],
            ),
            SizedBox(
              height: 18.h,
            ),
            Container(
              width: 400.w,
              height: 70.h,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 38, 38, 38),
                  borderRadius: BorderRadius.circular(20.r)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 16.w,
                  ),
                  Container(
                    height: 35.h,
                    width: 35.w,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/logos_mastercard.png"),
                            fit: BoxFit.contain)),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Your Payment Method",
                        style: GoogleFonts.roboto(
                            fontSize: 11.w,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                      Text(
                        "8799 4566 XXXX",
                        style: GoogleFonts.roboto(
                            fontSize: 18.w,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      )
                    ],
                  ),
                  Spacer(),
                  Container(
                    height: 44.h,
                    width: 44.w,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(39, 255, 255, 255),
                      borderRadius: BorderRadius.circular(500.r),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16.w,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.r),
                      topRight: Radius.circular(40.r))),
              child: Padding(
                padding: EdgeInsets.all(19.0.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Payment Transaction ",
                          style: GoogleFonts.roboto(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 20.w),
                        )
                      ],
                    ),
                    userTrxProviderdata.when(
                      data: (snapshot) {
                        return SizedBox(
                          height: 10 > snapshot.data.length
                              ? 100.h * 10
                              : 100.h * snapshot.data.length,
                          child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.only(bottom: 15.h),
                                  child: Container(
                                    height: 68.h,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 241, 242, 246),
                                        borderRadius:
                                            BorderRadius.circular(15.r)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        Container(
                                          height: 44,
                                          width: 44,
                                          decoration: BoxDecoration(
                                              color: Color.fromARGB(
                                                  40, 144, 136, 241),
                                              borderRadius:
                                                  BorderRadius.circular(40.r)),
                                        ),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${snapshot.data[index].message ?? "Payment"}",
                                              style: GoogleFonts.roboto(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 18.w),
                                            ),
                                            Text(
                                              "Paid to ${snapshot.data[index].userName}",
                                              style: GoogleFonts.roboto(
                                                color: Colors.grey.shade600,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 11.w,
                                              ),
                                            )
                                          ],
                                        ),
                                        Spacer(),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              snapshot.data[index].amount,
                                              style: GoogleFonts.roboto(
                                                  color: Color.fromARGB(
                                                      255, 144, 136, 241),
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 18.w),
                                            ),
                                            Text(
                                              "150 coins",
                                              style: GoogleFonts.roboto(
                                                color: Colors.grey.shade600,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 11.w,
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        );
                      },
                      error: (error, stackTrace) {
                        return Center(
                          child: Text("Error : $error"),
                        );
                      },
                      loading: () {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DraggableBottomSheetContent extends ConsumerStatefulWidget {
  final int currentBalance;
  final String voletid;
  final Function callback;

  DraggableBottomSheetContent(
      {super.key,
      required this.callback,
      required this.voletid,
      required this.currentBalance});

  @override
  ConsumerState<DraggableBottomSheetContent> createState() =>
      _DraggableBottomSheetContentState();
}

class _DraggableBottomSheetContentState
    extends ConsumerState<DraggableBottomSheetContent> {
  final coinsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.r), topRight: Radius.circular(40.r))),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.7, // Customize height
      child: Padding(
        padding: EdgeInsets.all(15.0.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 5.h,
              width: 50.w,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Add Coins",
                  style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 18.w),
                )
              ],
            ),
            SizedBox(
              height: 8.h,
            ),
            TextFormField(
              controller: coinsController,
              keyboardType:
                  TextInputType.numberWithOptions(signed: true, decimal: true),
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Choose Payment Method",
                  style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontSize: 16.w,
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              width: 400.w,
              height: 70.h,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 241, 242, 246),
                  borderRadius: BorderRadius.circular(20.r)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 16.w,
                  ),
                  Container(
                    height: 35.h,
                    width: 35.w,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/logos_mastercard.png"),
                            fit: BoxFit.contain)),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Your Payment Method",
                        style: GoogleFonts.roboto(
                            fontSize: 11.w,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      ),
                      Text(
                        "8799 4566 XXXX",
                        style: GoogleFonts.roboto(
                            fontSize: 18.w,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      )
                    ],
                  ),
                  Spacer(),
                  Container(
                    height: 44.h,
                    width: 44.w,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(30, 38, 50, 56),
                      borderRadius: BorderRadius.circular(500.r),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: const Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16.w,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            GestureDetector(
              onTap: () {
                var box = Hive.box('userdata');
                ref.watch(storeuserTrxProvider(UserTranctionBodyModel(
                    userId: box.get('id').toString(),
                    voliteId: widget.voletid,
                    amount: coinsController.text)));
                final walletUpdateData = ref.watch(
                  walletUpdateProvider(
                    WalletUpdateBodyModel(
                      userId: box.get('id'),
                      balance: int.parse(coinsController.text.toString()) +
                          widget.currentBalance,
                    ),
                  ),
                );
                widget.callback();
                Navigator.pop(context);
                if (walletUpdateData != null) {
                  Fluttertoast.showToast(msg: "Wallet Update Successful");
                } else {
                  Fluttertoast.showToast(msg: "Updata Failed");
                }
              },
              child: Container(
                height: 52.h,
                width: 400.w,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 220, 248, 129),
                    borderRadius: BorderRadius.circular(40.r)),
                child: Center(
                  child: Text(
                    "Continue",
                    style: GoogleFonts.roboto(
                        color: Colors.black,
                        fontSize: 16.w,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
