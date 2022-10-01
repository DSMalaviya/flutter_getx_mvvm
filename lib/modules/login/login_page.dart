import 'package:flutter/material.dart';
import 'package:flutter_application_architect/modules/login/login_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  static const String routeName = "/login";

  final LoginController _loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login",
          style: TextStyle(fontSize: 14.sp),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            TextField(
              controller: _loginController.emailController,
              decoration: const InputDecoration(label: Text("email")),
            ),
            SizedBox(
              height: 20.h,
            ),
            TextField(
              controller: _loginController.passwordController,
              decoration: const InputDecoration(label: Text("password")),
            ),
            SizedBox(
              height: 20.h,
            ),
            ElevatedButton(
                onPressed: _loginController.onLoginClick,
                child: const Text("Login"))
          ],
        ),
      ),
    );
  }
}
