import 'package:found_heal/export.dart';

late StorageRepo storage;

Future initializeRepoDependencies() async {
  storage = StorageRepoImpl(
    sharedPreferences: await SharedPreferences.getInstance(),
  );
  di.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(
      networkHelper: di(),
      storage: storage,
    ),
  );
}
