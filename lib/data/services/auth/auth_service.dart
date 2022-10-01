import 'package:get/get.dart';

//user auth related service
class AuthService extends GetxService {
  RxString authToken = "".obs;

  Future<AuthService> init() async {
    return this;
  }
}
