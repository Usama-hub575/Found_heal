import 'package:found_heal/export.dart';

GetIt di = GetIt.instance;

Future initializeDependencies() async {
  await initializeNetworkDependencies();
  await initializeRepoDependencies();
  await initializeUseCaseDependencies();
}
