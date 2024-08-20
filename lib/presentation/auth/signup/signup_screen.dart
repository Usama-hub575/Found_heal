import 'package:found_heal/export.dart';

class SignupScreen extends GetView<SignupController> {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorName.darkWhite,
      body: Obx(
        () => SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              verticalSpacer(40),
              customAppBar(
                onBackPress: () {
                  Navigator.of(context).pop();
                },
                title: "Login or Sign Up",
              ),
              verticalSpacer(50),
              IntrinsicHeight(
                child: Container(
                  decoration: const BoxDecoration(
                    color: ColorName.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(28),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    child: Form(
                      key: controller.signupFormKey,
                      child: Column(
                        children: [
                          Text(
                            "Create Account",
                            style: TextStyle(
                              fontFamily: FontFamily.redHatDisplay,
                              fontWeight: FontWeight.w600,
                              fontSize: sizes.fontRatio * 24,
                              color: ColorName.black,
                            ),
                          ),
                          verticalSpacer(10),
                          Text(
                            "Sign up to get started",
                            style: TextStyle(
                              fontFamily: FontFamily.redHatDisplay,
                              fontWeight: FontWeight.w400,
                              fontSize: sizes.fontRatio * 14,
                              color: ColorName.black.withOpacity(0.8),
                            ),
                          ),
                          verticalSpacer(20),
                          CustomTextField(
                            validatorText: "Please Enter Name",
                            onValidate: (value) {},
                            controller: controller.nameController,
                            label: "Name",
                            hintText: "Name",
                            validator: (value) {
                              if (value == "") {
                                return "Enter Name";
                              } else {
                                return null;
                              }
                            },
                          ),
                          verticalSpacer(20),
                          CustomTextField(
                            validatorText: "Please Enter Email",
                            onValidate: (value) {},
                            controller: controller.emailController,
                            label: "Email",
                            hintText: "Email",
                            validator: (value) {
                              if (value == "") {
                                return "Enter Email";
                              } else {
                                return null;
                              }
                            },
                          ),
                          verticalSpacer(20),
                          CustomTextField(
                            validatorText: "Please Enter Password",
                            onValidate: (value) {},
                            controller: controller.passwordController,
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
                          verticalSpacer(20),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              verticalSpacer(20),
              SizedBox(
                width: horizontalValue(250),
                child: CustomButton(
                  isLoading: controller.showLoading.value,
                  onPressed: () {
                    if (controller.signupFormKey.currentState!.validate()) {
                      FocusScope.of(context).requestFocus(
                        FocusNode(),
                      );
                      controller.signup(
                        context: context,
                      );
                    }
                    // controller.navigateToStepOneScreen();
                  },
                  title: 'Create Account',
                  buttonColor: ColorName.primaryColor,
                  labelColor: ColorName.white,
                  isEnabled: true,
                ),
              ),
              verticalSpacer(20),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: horizontalValue(20),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            height: 1,
                            color: ColorName.gray.withOpacity(0.4),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: horizontalValue(10),
                            vertical: verticalValue(2),
                          ),
                          decoration: const BoxDecoration(
                            color: ColorName.lightWhite,
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          child: const Text(
                            "OR SIGN UP WITH",
                            style: TextStyle(
                              color: ColorName.gray,
                              fontFamily: FontFamily.redHatDisplay,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 1,
                            color: ColorName.gray.withOpacity(0.4),
                            // color: colors.primaryColor,
                          ),
                        ),
                      ],
                    ),
                    verticalSpacer(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: horizontalValue(150),
                          child: SocialButton(
                            onPressed: () {},
                            title: Constants.google,
                            icon: Assets.images.svg.google,
                          ),
                        ),
                        SizedBox(
                          width: horizontalValue(150),
                          child: SocialButton(
                            onPressed: () {},
                            title: Constants.facebook,
                            icon: Assets.images.svg.facebook,
                          ),
                        ),
                      ],
                    ),
                    verticalSpacer(15),
                    Text(
                      "Have an account?",
                      style: TextStyle(
                        fontFamily: FontFamily.redHatDisplay,
                        fontWeight: FontWeight.w800,
                        fontSize: sizes.fontRatio * 14,
                        color: ColorName.black,
                      ),
                    ),
                    verticalSpacer(10),
                    Text(
                      "Login",
                      style: TextStyle(
                        fontFamily: FontFamily.redHatDisplay,
                        fontWeight: FontWeight.w800,
                        fontSize: sizes.fontRatio * 14,
                        color: ColorName.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
