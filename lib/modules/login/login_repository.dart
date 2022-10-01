import 'package:flutter_application_architect/data/data_provider/api_handler.dart';
import 'package:flutter_application_architect/data/models/login_model.dart';
import 'package:get/get.dart';

class LoginRepository {
  late final ApiProvider _apiHandler = Get.find<ApiProvider>();

  Future<LoginModel> login(String email, String password) async {
    try {
      var res = await _apiHandler.postLogin(email, password);
      return LoginModel.fromJson(res);
    } catch (e) {
      rethrow;
    }
  }
}
