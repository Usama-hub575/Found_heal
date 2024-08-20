import 'package:dartz/dartz.dart';
import 'package:found_heal/export.dart';

class AuthUseCase {
  final AuthRepo authRepo;

  AuthUseCase({
    required this.authRepo,
  });

  bool getBool({required String key}) {
    return authRepo.getBool(key: key);
  }

  Future? setBool({
    required String key,
    bool? value,
  }) async {
    await authRepo.setBool(
      key: key,
      value: value,
    );
  }

  Future<Either<Success, Failure>> login({
    required String userName,
    required String email,
    required String password,
  }) async {
    final response = await authRepo.login(
      email: email,
      password: password,
      userName: userName,
    );
    return response.fold(
      (l) {
        return Left(
          Success(),
        );
      },
      (r) {
        return Right(
          Failure(message: r.message, status: r.status),
        );
      },
    );
  }

  Future<Either<Success, Failure>> signup({
    required String userName,
    required String email,
    required String password,
  }) async {
    final response = await authRepo.signup(
      email: email,
      password: password,
      userName: userName,
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
