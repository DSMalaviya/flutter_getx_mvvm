import 'package:flutter_application_architect/data/models/list_user_model.dart';
import 'package:get/get.dart';

import '../../data/data_provider/api_handler.dart';

class ListUserRepository {
  late final ApiProvider _apiHandler = Get.find<ApiProvider>();

  Future<ListUserModel> getListusers() async {
    try {
      var res = await _apiHandler.getUserList();
      return ListUserModel.fromJson(res);
    } catch (e) {
      rethrow;
    }
  }
}
