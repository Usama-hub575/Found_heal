import 'package:found_heal/export.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;


abstract class NetworkHelper {
  Future<Either<String, Failure>> get(
    String url, {
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
  });

  Future<Either<String, Failure>> post(
    String url, {
    Map<String, String>? headers,
    body,
    encoding,
    bool modifyHeader = true,
    bool encodeBody = true,
  });

  Future<Either<String, Failure>> patch(
    String url, {
    Map<String, String>? headers,
    body,
    encoding,
    bool modifyHeader = true,
    bool encodeBody = true,
  });

  // Future<Either<String, Failure>> multipart(
  //     String url, {
  //       Map<String, String>? headers,
  //       body,
  //       List<File>? camFiles,
  //       List<MediaFile>? galleryFiles,
  //     });

  Future<Either<String, Failure>> delete(
    String url, {
    Map<String, String>? headers,
  });

  Future<Either<String, Failure>> put(
    String url, {
    Map<String, String>? headers,
    body,
    encoding,
  });

  Map<String, String> appendHeader({
    Map<String, String>? headers,
  });

  Either<String, Failure> handleResponse({
    http.Response response,
  });
}
