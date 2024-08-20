import 'package:found_heal/export.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    this.onTap,
    this.onChanged,
    this.maxLength,
    this.validator,
    this.keyboardType,
    this.obscureText,
    this.controller,
    this.suffixIcon,
    this.validatorText,
    this.readOnly,
    required this.label,
    required this.hintText,
    required this.onValidate,
    this.focusNode,
    this.maxLines,
  });

  final void Function()? onTap;
  final void Function(String)? onChanged;
  final Function(String value) onValidate;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String label;
  final String? validatorText;
  final bool? readOnly;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final int? maxLength;
  final int? maxLines;
  bool? obscureText;
  Widget? suffixIcon;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      obscureText: obscureText ?? false,
      readOnly: readOnly ?? false,
      onTap: onTap,
      maxLines: maxLines ?? 1,
      maxLength: maxLength,
      controller: controller,
      onChanged: onChanged,
      style: const TextStyle(
        fontSize: 16,
        fontFamily: FontFamily.redHatDisplay,
        color: ColorName.black,
        fontWeight: FontWeight.w500,
      ),
      keyboardType: keyboardType,
      decoration: InputDecoration(
        filled: true,
        fillColor: ColorName.textFieldBackground,
        counterText: "",
        hintText: hintText,
        suffixIconConstraints: const BoxConstraints(
          minHeight: 10,
          minWidth: 10,
        ),
        suffixIcon: suffixIcon,
        labelStyle: const TextStyle(color: Colors.grey, fontSize: 12),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),

        errorStyle: const TextStyle(
          fontSize: 16,
          fontFamily: FontFamily.redHatDisplay,
          color: Colors.red,
          fontWeight: FontWeight.w500,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(30),
        ), // Set the focused border color here
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (value!.trim().isEmpty) {
          return validatorText;
        }
        if (label == "Email") {
          if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2}').hasMatch(value)) {
            return "Invalid Email";
          }
        }
        return onValidate(value);
      },
    );
  }
}
