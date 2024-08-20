import 'package:found_heal/export.dart';

showErrorToast({
  required String message,
  bool? showErrorText,
  bool? fixSnackBar = false,
  required BuildContext context,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(
        seconds: 3,
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
                color: Colors.red,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalValue(10),
                vertical: verticalValue(15),
              ),
              child: const Icon(
                Icons.cancel,
                size: 30,
                color: Colors.red,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  // horizontal: horizontalValue(10),
                  vertical: verticalValue(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    showErrorText == false
                        ? const SizedBox.shrink()
                        : const Text(
                            "Error",
                            textAlign: TextAlign.center,
                            textDirection: TextDirection.ltr,
                            style: TextStyle(
                              color: Colors.red,
                               fontWeight: FontWeight.w500,
                              fontFamily: FontFamily.redHatDisplay,
                            ),
                          ),
                    Text(
                      message,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.ltr,
                      style: const TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.w500,
                        fontFamily: FontFamily.redHatDisplay,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      behavior: fixSnackBar == true
          ? SnackBarBehavior.fixed
          : SnackBarBehavior.floating,
    ),
  );
}
