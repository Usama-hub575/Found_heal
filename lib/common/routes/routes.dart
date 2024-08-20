import 'package:found_heal/export.dart';

class AppRoutes {
  final dynamic arg;

  AppRoutes({
    this.arg,
  });

  static List<GetPage> getPage = [
    GetPage(
      name: RouteNames.splashScreen,
      page: () => const SplashScreen(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: RouteNames.loginScreen,
      page: () => const LoginScreen(),
      binding: LoginScreenBinding(),
    ),
    GetPage(
      name: RouteNames.signupScreen,
      page: () => const SignupScreen(),
      binding: SignupBinding(),
    ),
  ];

  static Future<dynamic>? appRoutes(final String routeName, {arg, parameters}) {
    switch (routeName) {
      //push to next
      case RouteNames.loginScreen:
        return Get.toNamed(
          routeName,
          arguments: arg,
          parameters: parameters,
        );
      case RouteNames.loginOrSignupScreen:
        return Get.toNamed(
          routeName,
          arguments: arg,
          parameters: parameters,
        );
      case RouteNames.welcomeBackScreen:
        return Get.toNamed(
          routeName,
          arguments: arg,
          parameters: parameters,
        );
      case RouteNames.signupScreen:
        return Get.toNamed(
          routeName,
          arguments: arg,
          parameters: parameters,
        );
      case RouteNames.stepOneScreen:
        return Get.toNamed(
          routeName,
          arguments: arg,
          parameters: parameters,
        );
      case RouteNames.stepTwoScreen:
        return Get.toNamed(
          routeName,
          arguments: arg,
          parameters: parameters,
        );
      case RouteNames.splashScreen:
      case RouteNames.joinScreen:
        return Get.offAllNamed(routeName);

      //clear all and push with param
      // case RouteNames.registerScreen:
      //   return Get.offAllNamed(
      //     routeName,
      //     arguments: arg,
      //     parameters: parameters,
      //   );
    }
    return null;
  }

// static Future<dynamic>? _errorRoute() {
//   return Get.to(Container());
// }
}
