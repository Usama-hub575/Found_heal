import 'package:found_heal/export.dart';

class SplashController extends GetxController with StateMixin<SplashScreen> {
  bool isInitialized = false;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Future.delayed(
      const Duration(seconds: 3),
      () {
        AppRoutes.appRoutes(RouteNames.joinScreen);
      },
    );
  }

  void initAppResources(BuildContext context) {
    if (!isInitialized) {
      isInitialized = true;
      initializeResources(context: context);
    }
  }
}
