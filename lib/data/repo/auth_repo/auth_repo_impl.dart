import 'package:dartz/dartz.dart';
import 'package:found_heal/export.dart';

class AuthRepoImpl implements AuthRepo {
  final StorageRepo storage;
  final NetworkHelper networkHelper;
  NetworkEndPoints endPoints = NetworkEndPoints();

  AuthRepoImpl({
    required this.storage,
    required this.networkHelper,
  });

  @override
  String getString({required String key}) {
    return storage.getString(key: key) ?? '';
  }

  @override
  bool getBool({required String key}) {
    return storage.getBool(key: key) ?? false;
  }

  @override
  Future? setBool({
    required String key,
    bool? value,
  }) async {
    return await storage.saveBool(
      key: key,
      value: value,
    );
  }

  @override
  Future<Either<Success, Failure>> login({
    required String userName,
    required String email,
    required String password,
  }) async {
    final response = await networkHelper.post(
      endPoints.getLoginUserEndPoint(),
      body: {
        "username": userName,
        "email": email,
        "password": password,
      },
    );
    return response.fold(
      (l) {
        return Left(
          Success(),
        );
      },
      (r) {
        return Right(
          Failure(
            message: r.message,
            status: r.status,
          ),
        );
      },
    );
  }

  @override
  Future<Either<Success, Failure>> signup({
    required String userName,
    required String email,
    required String password,
  }) async {
    final response = await networkHelper.post(
      endPoints.getSignupUserEndPoint(),
      body: {
        "username": userName,
        "email": email,
        "password": password,
        "deviceToken": "",
      },
    );
    return response.fold(
      (l) {
        return Left(
          Success(),
        );
      },
      (r) {
        return Right(
          Failure(
            message: r.message,
            status: r.status,
          ),
        );
      },
    );
  }
}
