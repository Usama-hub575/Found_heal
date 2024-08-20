import 'package:found_heal/export.dart';

late AppSizes sizes;
bool _isInitialized = false;

void initializeResources({required BuildContext context}) {
  if (_isInitialized) {
    /**
     * this is to prevent
     * multiple initialization calls.
     */
    return;
  }

  sizes = AppSizes()..initializeSize(context);
}
