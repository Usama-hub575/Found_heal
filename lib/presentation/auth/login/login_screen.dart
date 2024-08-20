import 'package:found_heal/export.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.darkWhite,
      body: Obx(
        () => Column(
          children: [
            verticalSpacer(40),
            customAppBar(
              onBackPress: () {
                Navigator.of(context).pop();
              },
              title: "Login",
            ),
            verticalSpacer(20),
            Expanded(
              child: Container(
                height: sizes.height,
                width: sizes.width,
                decoration: const BoxDecoration(
                  color: ColorName.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(28),
                    topRight: Radius.circular(28),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  child: Form(
                    key: controller.loginFormKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          controller: controller.userInputController,
                          validatorText: "Please Enter User Name",
                          onValidate: (value) {},
                          label: "User Name",
                          hintText: "UserName",
                          validator: (value) {
                            if (value == "") {
                              return "Enter Your User Name";
                            } else {
                              return null;
                            }
                          },
                        ),
                        verticalSpacer(20),
                        CustomTextField(
                          controller: controller.passwordController,
                          validatorText: "Please Enter Password",
                          onValidate: (value) {},
                          label: "Password",
                          hintText: "Password",
                          obscureText: !controller.showPassword.value,
                          suffixIcon: GestureDetector(
                            onTap: () {
                              controller.showPassword.value =
                                  !controller.showPassword.value;
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                              ),
                              child: SvgPicture.asset(
                                controller.showPassword.value
                                    ? Assets.images.svg.shownPassword
                                    : Assets.images.svg.hiddenPassword,
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value == "") {
                              return "Enter Password";
                            } else {
                              return null;
                            }
                          },
                        ),
                        const Spacer(),
                        Text(
                          "Don't have an account?",
                          style: TextStyle(
                            fontFamily: FontFamily.redHatDisplay,
                            fontWeight: FontWeight.w800,
                            fontSize: sizes.fontRatio * 14,
                            color: ColorName.black,
                          ),
                        ),
                        verticalSpacer(10),
                        InkWell(
                          onTap: () => controller.navigateToLoginOrSignup(),
                          child: Text(
                            "Create Account",
                            style: TextStyle(
                              fontFamily: FontFamily.redHatDisplay,
                              fontWeight: FontWeight.w800,
                              fontSize: sizes.fontRatio * 14,
                              color: ColorName.primaryColor,
                            ),
                          ),
                        ),
                        verticalSpacer(10),
                        CustomButton(
                          isLoading: controller.showLoading.value,
                          onPressed: () {
                            if (controller.loginFormKey.currentState!
                                .validate()) {
                              FocusScope.of(context).requestFocus(
                                FocusNode(),
                              );
                              controller.checkEmail();
                              controller.login(context: context);
                            }
                          },
                          title: 'Login',
                          buttonColor: ColorName.primaryColor,
                          labelColor: ColorName.white,
                          isEnabled: true,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
