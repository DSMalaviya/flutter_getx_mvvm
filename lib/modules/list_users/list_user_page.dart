import 'package:flutter/material.dart';
import 'package:flutter_application_architect/core/values/enums.dart';
import 'package:flutter_application_architect/modules/list_users/list_user_controller.dart';
import 'package:flutter_application_architect/modules/view_single_user/view_single_user_page.dart';
import 'package:get/get.dart';

class ListUserPage extends StatelessWidget {
  const ListUserPage({super.key});

  static const String routeName = "/listuser";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("users"),
      ),
      body: GetX<ListUserController>(
        builder: (controller) {
          switch (controller.responseStatus.value.resType) {
            case ResponseType.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case ResponseType.success:
              return SizedBox(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    var data = controller.listusermodel.value.data![index];
                    return ListTile(
                      onTap: () {
                        Get.toNamed(ViewSingleUserPage.routeName,
                            arguments: data.id ?? "");
                      },
                      title: Text(data.firstName ?? ""),
                      leading: CircleAvatar(
                        child: Image.network(data.avatar ?? ""),
                      ),
                    );
                  },
                  itemCount: controller.listusermodel.value.data!.length,
                ),
              );
            case ResponseType.error:
              return Center(
                child: Text(
                  controller.responseStatus.value.msg.toString(),
                ),
              );
            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
