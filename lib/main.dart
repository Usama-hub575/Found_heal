import 'package:found_heal/common/utils/theme.dart';
import 'package:found_heal/export.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();

  runApp(
    GetMaterialApp(
      title: "Kora",
      getPages: AppRoutes.getPage,
      initialRoute: RouteNames.splashScreen,
      unknownRoute: GetPage(
        name: '/notfound',
        page: () {
          return Container();
        },
      ),
      debugShowCheckedModeBanner: false,
      theme: appTheme,
    ),
  );
}
