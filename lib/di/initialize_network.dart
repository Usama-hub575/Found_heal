import 'package:found_heal/export.dart';

Future initializeNetworkDependencies() async {
  di.registerLazySingleton<NetworkHelper>(
    () => NetworkHelperImpl(),
  );
}
