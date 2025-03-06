import 'dart:developer';
import 'package:educationapp/CORE/api_controller.dart';
import 'package:educationapp/collegeReviews/controller/collage.controller.dart';
import 'package:educationapp/config/preety.dio.dart';
import 'package:educationapp/findmentor/model/allmentors.model.dart';
import 'package:educationapp/home/controller/service/home.service.dart';
import 'package:educationapp/home/model/userprofile.model.dart';
import 'package:educationapp/trendingskills/controller/sikllscontroller.dart';
import 'package:educationapp/wallet/walletController.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

final apiClientProvider = FutureProvider.autoDispose<HomeService>((ref) async {
  final dio = await ref.watch(dioProvider.future);
  return HomeService(dio);
});

final homeMentorsProvider = FutureProvider.autoDispose
    .family<AllMentorsModel, String>((ref, body) async {
  final client = await ref.watch(apiClientProvider.future);
  return await compute(
      ApiController.fetchMentors, {"service": client, "query": body});
});

final companyReviewProvider = FutureProvider.autoDispose((ref) async {
  final companyreviewservice = HomeService(await createDio());
  return companyreviewservice.getAllcompanyReview();
});

class HomeMentorsNotifier extends StateNotifier<AsyncValue<AllMentorsModel>> {
  final Ref ref;
  final String body;

  HomeMentorsNotifier(this.ref, this.body) : super(const AsyncValue.loading()) {
    fetchMentors();
  }

  Future<void> fetchMentors() async {
    try {
      final client = await ref.read(apiClientProvider.future);
      final result = await compute(ApiController.fetchMentors, {"service": client, "query": body});
      state = AsyncValue.data(result);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  void refresh() {
    state = const AsyncValue.loading(); // Set loading state
    fetchMentors(); // Fetch fresh data
  }
}
final homeMentorsProviderState = StateNotifierProvider.family<HomeMentorsNotifier, AsyncValue<AllMentorsModel>, String>(
  (ref, body) => HomeMentorsNotifier(ref, body),
);

// final saveUserProfileDataToLocalProvider =
//     FutureProvider.autoDispose.family<bool, String>((ref, token) async {
//   return true;
// });

class StoreData {
  static Future<bool> logic(String token) async {
    if (!Hive.isBoxOpen('userdata')) {
      await Hive.openBox('userdata');
    }
    var box = Hive.box('userdata');
    await box.put('token', token);
    await StoreData.fsavedata();
    return true;
  }

  static Future<void> fsavedata() async {
    log("Saveing data to local");
    final homeService = HomeService(await createDio());
    USerProfieModel profiledata = await homeService.userProfileGet();
    if (!Hive.isBoxOpen('userdata')) {
      await Hive.openBox('userdata');
    }
    var box = Hive.box('userdata');
    await box.put(
      "name",
      profiledata.data.fullName,
    );
    await box.put("email", profiledata.data.email);
    await box.put("pic", profiledata.data.profilePic);
    await box.put("id", profiledata.data.id);
  }

  static Future<void> clearData() async {
    final cacheDir = await getTemporaryDirectory();
    if (cacheDir.existsSync()) {
      cacheDir.deleteSync(recursive: true);
    }

    // Clear app storage
    final appDir = await getApplicationSupportDirectory();
    if (appDir.existsSync()) {
      appDir.deleteSync(recursive: true);
    }

    log("App data cleared");
    final container = ProviderContainer();
    container.dispose();
    container.invalidate(skilssProvide);
    container.invalidate(walletProvider);
    container.invalidate(homeMentorsProvider);
    container.invalidate(callagesProviders);
    container.invalidate(companyReviewProvider);
    var box = Hive.box('userdata');
    await box.clear();
  }
}


// homementrosprovider.when(
//                         data: (homementor) {
//                           return Padding(
//                             padding: EdgeInsets.only(bottom: 20.h),
//                             child: ListView.builder(
//                               scrollDirection: Axis.horizontal,
//                               itemCount: homementor.data.length,
//                               itemBuilder: (context, index) {
//                                 return GestureDetector(
//                                   onTap: () {
//                                     Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                         builder: (context) => Newskilllistpage(
//                                           id: homementor.data[index].id
//                                               .toString(),
//                                         ),
//                                       ),
//                                     );
//                                   },
//                                   child: Container(
//                                     margin:
//                                         EdgeInsets.only(bottom: 0, left: 20.w),
//                                     width: 190.w,
//                                     decoration: BoxDecoration(
//                                       border: Border.all(
//                                         width: 1,
//                                         color: Color.fromARGB(24, 11, 2, 2),
//                                       ),
//                                       borderRadius: BorderRadius.circular(20),
//                                     ),
//                                     child: Padding(
//                                       padding: EdgeInsets.only(bottom: 8.h),
//                                       child: Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.center,
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.start,
//                                         children: [
//                                           SizedBox(
//                                             height: 8.h,
//                                           ),
//                                           Container(
//                                             width: 174.w,
//                                             height: 112.h,
//                                             child:
//                                                 // Image.asset("assets/pic.png"),
//                                                 ClipRRect(
//                                               borderRadius:
//                                                   BorderRadius.circular(15),
//                                               child: Image.network(
//                                                 homementor.data[index]
//                                                         .profilePic ??
//                                                     "https://placehold.co/600x400?text=Profile+Pic",
//                                                 width: 174.w,
//                                                 height: 112.h,
//                                                 fit: BoxFit.cover,
//                                               ),
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             height: 10.h,
//                                           ),
//                                           Padding(
//                                             padding: EdgeInsets.only(
//                                                 left: 10.w, right: 10.w),
//                                             child: Column(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.center,
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.start,
//                                               children: [
//                                                 Text(
//                                                   // "Jennifer Johns",
//                                                   homementor
//                                                       .data[index].fullName,
//                                                   style: GoogleFonts.roboto(
//                                                     fontWeight: FontWeight.w600,
//                                                     fontSize: 16,
//                                                     color: Color.fromARGB(
//                                                         255, 27, 27, 27),
//                                                   ),
//                                                 ),
//                                                 SizedBox(
//                                                   height: 6.h,
//                                                 ),
//                                                 Text(
//                                                   // "Helping students land their dre...",
//                                                   homementor
//                                                       .data[index].description
//                                                       .toString(),
//                                                   overflow:
//                                                       TextOverflow.ellipsis,
//                                                   style: GoogleFonts.roboto(
//                                                     fontWeight: FontWeight.w400,
//                                                     fontSize: 12,
//                                                     color: Color.fromARGB(
//                                                         255, 102, 102, 102),
//                                                   ),
//                                                 ),
//                                                 Container(
//                                                   margin: EdgeInsets.only(
//                                                       top: 10.h),
//                                                   width: 170.w,
//                                                   height: 30.h,
//                                                   decoration: BoxDecoration(
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             70),
//                                                     color: Color.fromARGB(
//                                                         255, 144, 136, 241),
//                                                   ),
//                                                   child: Center(
//                                                     child: Text(
//                                                       "Contact me",
//                                                       style: GoogleFonts.roboto(
//                                                         fontSize: 11,
//                                                         fontWeight:
//                                                             FontWeight.w400,
//                                                         color: Colors.white,
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 );
//                               },
//                             ),
//                           );
//                         },
//                         error: (error, stackTrace) {
//                           // Fluttertoast.showToast(
//                           //     msg: "Your session was expired");
//                           // StoreData.clearData();
//                           // Navigator.pushAndRemoveUntil(
//                           //     context,
//                           //     CupertinoPageRoute(
//                           //         builder: (context) => SplashScreen()),
//                           //     (route) => false);
//                           return SizedBox(
//                             child: Center(
//                               child: Text(error.toString()),
//                             ),
//                           );
//                         },
//                         loading: () => Center(
//                           child: CircularProgressIndicator(),
//                         ),
//                       )