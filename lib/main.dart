import 'package:flutter/cupertino.dart';
import 'package:flutter_application_architect/data/data_provider/api_handler.dart';
import 'package:flutter_application_architect/data/services/app_config/app_config_service.dart';
import 'package:flutter_application_architect/data/services/auth/auth_service.dart';
import 'package:flutter_application_architect/modules/login/login_page.dart';
import 'package:flutter_application_architect/routes/pages.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(
    () => AuthService().init(),
  );
  await Get.putAsync(() => AppConfigService().init());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, _) {
        return GetMaterialApp(
          initialBinding: InitialBindings(),
          getPages: AppPages.pages,
          initialRoute: LoginPage.routeName,
        );
      },
    );
  }
}

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApiProvider());
  }
}
