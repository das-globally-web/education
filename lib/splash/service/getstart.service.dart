import 'package:dio/dio.dart';
import 'package:educationapp/splash/models/service.model.dart';
import 'package:retrofit/retrofit.dart';

part 'getstart.service.g.dart';

@RestApi(baseUrl: 'http://education.globallywebsolutions.com')
abstract class GetStartService {
  factory GetStartService(Dio dio, {String baseUrl}) = _GetStartService;

  @GET('/api/services')
  Future<ServiceModelRes> getAllService();
}
