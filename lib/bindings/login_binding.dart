import 'package:found_heal/export.dart';

class LoginScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
          () => LoginController(),
    );
  }
}