import 'package:flutter/material.dart';
import 'package:flutter_application_architect/core/values/enums.dart';

import 'package:flutter_application_architect/modules/view_single_user/view_single_user_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ViewSingleUserPage extends StatelessWidget {
  ViewSingleUserPage({super.key});

  static const String routeName = "/viewSingleUser";

  final ViewSingleUserController _viewSingleUserController =
      Get.find<ViewSingleUserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("view single User"),
      ),
      body: Obx(() {
        switch (_viewSingleUserController.responseStatus.value.resType) {
          case ResponseType.loading:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case ResponseType.success:
            var data = _viewSingleUserController.singleUserModel.value.data;
            return SizedBox(
              child: Column(
                children: [
                  SizedBox(
                    height: 200.h,
                    width: 1.sw,
                    child: Image.network(
                      data?.avatar ?? "",
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(data?.firstName ?? ""),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(data?.email ?? "")
                ],
              ),
            );
          case ResponseType.error:
            return Center(
              child: Text(
                  _viewSingleUserController.responseStatus.value.msg ?? ""),
            );
          default:
            return const SizedBox();
        }
      }),
    );
  }
}
