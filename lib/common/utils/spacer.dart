import 'package:found_heal/export.dart';

Widget verticalSpacer(double value) => SizedBox(
  height: sizes.heightRatio * value,
);

Widget horizontalSpacer(double value) => SizedBox(
  width: sizes.widthRatio * value,
);

double verticalValue(double value) => sizes.heightRatio * value;

double horizontalValue(double value) => sizes.widthRatio * value;