import 'package:flutter_application_architect/modules/list_users/list_user_binding.dart';
import 'package:flutter_application_architect/modules/list_users/list_user_page.dart';
import 'package:flutter_application_architect/modules/login/login_binding.dart';
import 'package:flutter_application_architect/modules/login/login_page.dart';
import 'package:flutter_application_architect/modules/view_single_user/view_single_user_binding.dart';
import 'package:flutter_application_architect/modules/view_single_user/view_single_user_page.dart';
import 'package:get/get.dart';

abstract class AppPages {
  static final List<GetPage> pages = [
    GetPage(
        name: LoginPage.routeName,
        page: () => LoginPage(),
        binding: LoginBindings()),
    GetPage(
        name: ListUserPage.routeName,
        page: () => const ListUserPage(),
        binding: ListUserBindings()),
    GetPage(
        name: ViewSingleUserPage.routeName,
        page: () => ViewSingleUserPage(),
        binding: ViewSingleUserBindings())
  ];
}
