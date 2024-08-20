import 'package:found_heal/export.dart';

final appTheme = ThemeData(
  appBarTheme: const AppBarTheme(
    color: ColorName.primaryColor,
  ),
  scaffoldBackgroundColor: ColorName.white,
  primarySwatch: MaterialColor(0xFF00c387, color),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: MaterialColor(0xFF00c387, color),
  ),
  visualDensity: VisualDensity.adaptivePlatformDensity,
);
