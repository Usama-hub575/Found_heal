import 'package:found_heal/export.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onPressed;
  final String title;
  Color buttonColor;
  Color labelColor;
  bool isEnabled;
  final bool? isLoading;

  CustomButton({
    super.key,
    required this.onPressed,
    required this.title,
    required this.buttonColor,
    required this.labelColor,
    required this.isEnabled,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: sizes.width,
      child: MaterialButton(
        color: isEnabled ? buttonColor : ColorName.darkWhite,
        minWidth: 00,
        height: 50,
        elevation: 0.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        onPressed: onPressed,
        child: isLoading == true
            ? Center(
                child: SizedBox(
                  height: verticalValue(20),
                  width: horizontalValue(20),
                  child: const CircularProgressIndicator(
                    strokeWidth: 2.5,
                    color: ColorName.primaryColor,
                    backgroundColor: ColorName.white,
                  ),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: isEnabled
                          ? labelColor
                          : ColorName.buttonTextDarkWhite,
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      fontFamily: FontFamily.redHatDisplay,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
