import 'package:found_heal/export.dart';

void showInformativeToast({
  required String message,
  required BuildContext context,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(
        seconds: 2,
      ),
      backgroundColor: ColorName.white,
      padding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 10,
      content: IntrinsicHeight(
        child: Row(
          children: [
            Container(
              width: horizontalValue(13),
              decoration: const BoxDecoration(
                color: ColorName.primaryColor,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalValue(10),
                vertical: verticalValue(15),
              ),
              child: const Icon(
                Icons.info_rounded,
                size: 30,
                color: ColorName.primaryColor,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalValue(10),
                vertical: verticalValue(15),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    message,
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.ltr,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: FontFamily.redHatDisplay,
                      color: ColorName.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      behavior: SnackBarBehavior.floating,
    ),
  );
}
