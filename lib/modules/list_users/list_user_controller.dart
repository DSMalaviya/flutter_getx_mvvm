import 'package:flutter_application_architect/core/utils/helpers/response_status.dart';
import 'package:flutter_application_architect/data/models/list_user_model.dart';
import 'package:flutter_application_architect/modules/list_users/list_user_repository.dart';
import 'package:get/get.dart';

class ListUserController extends GetxController {
  final ListUserRepository listUserRepository;

  ListUserController(this.listUserRepository);

  static ListUserController get to => Get.find();

  Rx<ListUserModel> listusermodel = ListUserModel().obs;
  Rx<ResponseStatus> responseStatus = ResponseStatus.loading().obs;

  loadUsers() async {
    responseStatus(ResponseStatus.loading());
    try {
      ListUserModel data = await listUserRepository.getListusers();
      listusermodel(data);
      responseStatus(ResponseStatus.sucess());
    } catch (e) {
      responseStatus(ResponseStatus.error(errormsg: e.toString()));
    }
  }

  @override
  void onInit() {
    loadUsers();
    super.onInit();
  }
}
