import 'package:found_heal/export.dart';

Future initializeUseCaseDependencies() async {
  await initializeAuthUseCase();
}

Future initializeAuthUseCase() async {
  di.registerLazySingleton<AuthUseCase>(
    () => AuthUseCase(
      authRepo: di<AuthRepo>(),
    ),
  );
}

