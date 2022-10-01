import 'package:dio/dio.dart' as dio;
import 'package:flutter_application_architect/core/values/api_endpoints.dart';
import 'package:flutter_application_architect/data/services/api/dio_client.dart';
import 'package:get/get.dart';

class ApiProvider extends GetxService {
  late final DioClient _dioClient = DioClient(dio.Dio());

  Future<dynamic> postLogin(String email, String password) async {
    try {
      dio.Response response = await _dioClient
          .post(Endpoints.login, data: {"email": email, "password": password});
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> getUserList() async {
    try {
      dio.Response response = await _dioClient.get(
        Endpoints.listUsers,
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
