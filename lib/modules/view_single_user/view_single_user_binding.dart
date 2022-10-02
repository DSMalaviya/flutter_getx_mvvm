import 'package:flutter_application_architect/modules/view_single_user/view_single_user_controller.dart';
import 'package:flutter_application_architect/modules/view_single_user/view_single_user_repository.dart';
import 'package:get/get.dart';

class ViewSingleUserBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(ViewSingleUserController(ViewSingleUserRespository()));
  }
}
