import 'package:found_heal/export.dart';

class SignupBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignupController>(
          () => SignupController(),
    );
  }
}