import 'package:found_heal/export.dart';


class StorageRepoImpl implements StorageRepo {
  final SharedPreferences sharedPreferences;

  StorageRepoImpl({
    required this.sharedPreferences,
  });

  @override
  Future<bool> remove(String key) async => await sharedPreferences.remove(key);

  @override
  bool contains(String key) => sharedPreferences.containsKey(key);

  @override
  double getDouble({required String key}) =>
      sharedPreferences.getDouble(key) ?? 0.0;

  @override
  int getInt({required String key}) => sharedPreferences.getInt(key) ?? 0;

  @override
  String? getString({required String key}) => sharedPreferences.getString(key);

  @override
  List<String>? getStringList({required String key}) =>
      sharedPreferences.getStringList(key) ?? [];

  @override
  bool getBool({required String key}) =>
      sharedPreferences.getBool(key) ?? false;

  @override
  Future saveBool({required String key, bool? value}) async =>
      await sharedPreferences.setBool(
        key,
        value ?? false,
      );

  @override
  Future saveDouble({required String key, double? value}) async =>
      await sharedPreferences.setDouble(
        key,
        value ?? 0.0,
      );

  @override
  Future saveInt({required String key, int? value}) async =>
      await sharedPreferences.setInt(
        key,
        value ?? 0,
      );

  @override
  Future saveString({required String key, dynamic value}) async =>
      await sharedPreferences.setString(
        key,
        value,
      );

  @override
  Future saveStringList({required String key, List<String>? value}) async =>
      await sharedPreferences.setStringList(
        key,
        value ?? [],
      );

  @override
  Future? reload() async {
    await sharedPreferences.reload();
    return null;
  }
}
