import 'package:found_heal/export.dart';

class LoginController extends GetxController with StateMixin<LoginScreen> {
  TextEditingController userInputController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  AuthUseCase authUseCase = AuthUseCase(
    authRepo: di<AuthRepo>(),
  );
  RxBool showLoading = false.obs;
  RxBool showPassword = false.obs;

  void checkEmail() {
    if (userInputController.text.contains('@')) {
      emailController.text = userInputController.text;
    } else {
      userNameController.text = userInputController.text;
    }
  }

  Future login({
    required BuildContext context,
  }) async {
    showLoading.value = true;
    final response = await authUseCase.login(
      userName: userNameController.text,
      password: passwordController.text,
      email: emailController.text,
    );
    return response.fold(
      (l) {
        showLoading.value = false;
        showInformativeToast(
          message: "Logged In",
          context: context,
        );
        Get.to(
          const LoginScreen(),
        );
      },
      (r) {
        showLoading.value = false;
        showErrorToast(
          message: r.message,
          context: context,
        );
      },
    );
  }

  void navigateToLoginOrSignup() {
    AppRoutes.appRoutes(RouteNames.loginOrSignupScreen);
  }
}
