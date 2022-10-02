import 'dart:ffi';

import 'package:flutter_application_architect/core/utils/helpers/response_status.dart';
import 'package:flutter_application_architect/data/models/single_user_model.dart';
import 'package:flutter_application_architect/modules/view_single_user/view_single_user_repository.dart';
import 'package:get/get.dart';

class ViewSingleUserController extends GetxController {
  String? userId;
  final ViewSingleUserRespository viewSingleUserRespository;

  ViewSingleUserController(this.viewSingleUserRespository);

  @override
  void onInit() {
    userId = (Get.arguments).toString();
    fetchSingleUser(userId ?? "");
    super.onInit();
  }

  Rx<ResponseStatus> responseStatus = ResponseStatus.loading().obs;
  Rx<SingleUserModel> singleUserModel = SingleUserModel().obs;

  fetchSingleUser(String userId) async {
    responseStatus(ResponseStatus.loading());
    try {
      SingleUserModel data =
          await viewSingleUserRespository.getSingleUser(userId);
      singleUserModel(data);
      responseStatus(ResponseStatus.sucess());
    } catch (e) {
      responseStatus(ResponseStatus.error(errormsg: e.toString()));
    }
  }
}
