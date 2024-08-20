import 'dart:io';
import 'package:found_heal/export.dart';

class SignupController extends GetxController
    with StateMixin<SignupController> {
  final ScrollController scrollController = ScrollController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController interestController = TextEditingController();
  TextEditingController categoriesController = TextEditingController();
  TextEditingController educationController = TextEditingController();
  TextEditingController drivingLicenseController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode nameFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode interestFocusNode = FocusNode();
  FocusNode categoriesFocusNode = FocusNode();
  FocusNode educationFocusNode = FocusNode();
  FocusNode drivingLicenseFocusNode = FocusNode();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();
  RxBool showPassword = false.obs;
  Rx<XFile?> imageFile = Rx<XFile?>(null);
  RxInt currentStep = 1.obs;
  RxString cv = "".obs;
  RxInt totalSteps = 2.obs;
  RxBool showLoading = false.obs;
  AuthUseCase authUseCase = AuthUseCase(
    authRepo: di<AuthRepo>(),
  );

  void pickImage() async {
    final XFile? pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      imageFile.value = pickedImage;
    }
  }

  void pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path!);
      cv.value = file.path;
    } else {
      // User canceled the picker
    }
  }

  Future signup({
    required BuildContext context,
  }) async {
    showLoading.value = true;
    final response = await authUseCase.signup(
      userName: nameController.text,
      password: passwordController.text,
      email: emailController.text,
    );
    return response.fold(
      (l) {
        showLoading.value = false;
        showInformativeToast(
          message: "Account Created Successfully",
          context: context,
        );
        navigateToStepOneScreen();
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

  void navigateToStepOneScreen() {
    AppRoutes.appRoutes(RouteNames.stepOneScreen);
  }

  void navigateToStepTwoScreen() {
    AppRoutes.appRoutes(RouteNames.stepTwoScreen);
  }
}
