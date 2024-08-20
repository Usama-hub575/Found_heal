import 'package:found_heal/export.dart';

class SocialButton extends StatelessWidget {
  final void Function()? onPressed;
  final String title;
  String icon;

  SocialButton({
    super.key,
    required this.onPressed,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: sizes.width,
      child: MaterialButton(
        color: ColorName.white,
        minWidth: 00,
        height: 50,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(icon),
            Text(
              title,
              style: const TextStyle(
                color: ColorName.black,
                fontSize: 16,
                fontWeight: FontWeight.w800,
                fontFamily: FontFamily.redHatDisplay,
              ),
            ),
            horizontalSpacer(2),
          ],
        ),
      ),
    );
  }
}
