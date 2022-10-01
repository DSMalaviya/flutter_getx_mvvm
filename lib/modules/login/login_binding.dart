import 'package:flutter_application_architect/modules/login/login_controller.dart';
import 'package:flutter_application_architect/modules/login/login_repository.dart';
import 'package:get/get.dart';

class LoginBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginController(LoginRepository()));
  }
}
