import 'package:flutter_application_architect/modules/list_users/list_user_controller.dart';
import 'package:flutter_application_architect/modules/list_users/list_user_repository.dart';
import 'package:get/get.dart';

class ListUserBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(ListUserController(ListUserRepository()));
  }
}
