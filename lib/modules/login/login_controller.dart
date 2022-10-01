import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_application_architect/core/utils/functions/custom_loader.dart';
import 'package:flutter_application_architect/core/utils/functions/custom_toast.dart';
import 'package:flutter_application_architect/data/models/login_model.dart';
import 'package:flutter_application_architect/modules/list_users/list_user_page.dart';
import 'package:flutter_application_architect/modules/login/login_repository.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  final LoginRepository loginRepository;

  LoginController(this.loginRepository);

  onLoginClick() async {
    Get.focusScope?.unfocus();
    if (emailController.text.trim().isEmpty ||
        passwordController.text.trim().isEmpty) {
      Get.showSnackbar(const GetSnackBar(
        message: "Please enter values",
      ));
      return;
    }

    onLoading();
    try {
      LoginModel loginModel = await loginRepository.login(
          emailController.text.trim(), passwordController.text.trim());
      if (loginModel.token != null && loginModel.token!.isNotEmpty) {
        Get.offAllNamed(ListUserPage.routeName);
        return;
      }
    } catch (e) {
      log(e.toString());
      makeToast(toastData: e.toString());
    }

    Get.back();
  }

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
