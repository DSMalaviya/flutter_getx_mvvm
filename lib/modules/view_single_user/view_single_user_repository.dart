import 'package:flutter_application_architect/data/models/single_user_model.dart';
import 'package:get/get.dart';

import '../../data/data_provider/api_handler.dart';

class ViewSingleUserRespository {
  late final ApiProvider _apiHandler = Get.find<ApiProvider>();

  Future<SingleUserModel> getSingleUser(String userId) async {
    try {
      var res = await _apiHandler.getSingleUser(userId);
      return SingleUserModel.fromJson(res);
    } catch (e) {
      rethrow;
    }
  }
}
