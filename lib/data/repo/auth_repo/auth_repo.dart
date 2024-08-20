import 'package:dartz/dartz.dart';
import 'package:found_heal/export.dart';

mixin AuthRepo {
  String getString({
    required String key,
  });

  bool getBool({
    required String key,
  });

  Future? setBool({
    required String key,
    bool? value,
  });

  Future<Either<Success, Failure>> login({
    required String userName,
    required String email,
    required String password,
  });

  Future<Either<Success, Failure>> signup({
    required String userName,
    required String email,
    required String password,
  });
}
