import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:found_heal/export.dart';

class NetworkHelperImpl implements NetworkHelper {
  @override
  Future<Either<String, Failure>> get(
    String url, {
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await http.get(
        Uri.parse(url).replace(
          queryParameters: queryParameters,
        ),
        headers: appendHeader(headers: headers),
      );
      return handleResponse(response: response);
    } catch (e) {
      return Right(
        Failure(
          status: false,
          message: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<String, Failure>> post(
    String url, {
    Map<String, String>? headers,
    body,
    encoding,
    bool modifyHeader = true,
    bool encodeBody = true,
  }) async {
    try {
      final response = await http.post(
        Uri.parse(url),
        body: encodeBody ? json.encode(body) : body,
        headers: modifyHeader ? appendHeader(headers: headers) : headers,
        encoding: encoding,
      );

      return handleResponse(
        response: response,
        // requestBody: json.encode(body),
      );
    } catch (e) {
      return Right(
        Failure(
          status: false,
          message: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<String, Failure>> patch(
    String url, {
    Map<String, String>? headers,
    body,
    encoding,
    bool modifyHeader = true,
    bool encodeBody = true,
  }) async {
    try {
      final response = await http.patch(
        Uri.parse(url),
        body: jsonEncode(body),
        headers: modifyHeader ? appendHeader(headers: headers) : headers,
        // encoding: encoding,
      );

      return handleResponse(
        response: response,
        // requestBody: json.encode(body),
      );
    } catch (e) {
      return Right(
        Failure(
          status: false,
          message: e.toString(),
        ),
      );
    }
  }

  // @override
  // Future<Either<String, Failure>> multipart(
  //   String url, {
  //   Map<String, String>? headers,
  //   body,
  //   List<File>? camFiles,
  //   List<MediaFile>? galleryFiles,
  // }) async {
  //   try {
  //     final request = http.MultipartRequest(
  //       'POST',
  //       Uri.parse(url),
  //     );
  //
  //     // body.forEach((key, value) => request.fields[key] = value);
  //
  //     headers!.forEach((key, value) => request.headers[key] = value);
  //     if (galleryFiles != null) {
  //       for (int i = 0; i < galleryFiles.length; i++) {
  //         if (galleryFiles[i].thumbnail != null) {
  //           request.files.add(
  //             http.MultipartFile.fromBytes(
  //               'file',
  //               galleryFiles[i].thumbnail!,
  //               filename: 'thumbnail_${galleryFiles[i].id}.jpg',
  //             ),
  //           );
  //         } else {
  //           return Right(
  //             Failure(
  //               message: "message",
  //               status: false,
  //             ),
  //           );
  //         }
  //       }
  //     }
  //     if (camFiles != null) {
  //       for (int i = 0; i < camFiles.length; i++) {
  //         request.files.add(
  //           await http.MultipartFile.fromPath(
  //             'file',
  //             camFiles[i].path,
  //           ),
  //         );
  //       }
  //     }
  //
  //     http.StreamedResponse response = await request.send();
  //
  //     String responseText = await response.stream.bytesToString();
  //
  //     final int statusCode = response.statusCode;
  //
  //     if (statusCode >= 400) {
  //       return Right(
  //         Failure(
  //           status: false,
  //           message: 'Something went wrong',
  //         ),
  //       );
  //     } else {
  //       return Left(responseText);
  //     }
  //   } catch (e) {
  //     return Right(
  //       Failure(
  //         status: false,
  //         message: e.toString(),
  //       ),
  //     );
  //   }
  // }

  @override
  Future<Either<String, Failure>> delete(
    String url, {
    Map<String, String>? headers,
  }) async {
    return http
        .delete(Uri.parse(url), headers: appendHeader(headers: headers))
        .then((http.Response response) {
      return handleResponse(response: response);
    });
  }

  @override
  Future<Either<String, Failure>> put(
    String url, {
    Map<String, String>? headers,
    body,
    encoding,
  }) async {
    return http
        .put(Uri.parse(url),
            body: json.encode(body),
            headers: appendHeader(headers: headers),
            encoding: encoding)
        .then(
      (http.Response response) {
        return handleResponse(response: response);
      },
    );
  }

  @override
  Either<String, Failure> handleResponse({
    http.Response? response,
    // String? requestBody,
  }) {
    final int statusCode = response!.statusCode;

    if (statusCode >= 400) {
      Map<String, dynamic> errorJson = jsonDecode(response.body.toString());
      final responseMessage = errorJson['error'] ?? 'Something went Wrong';
      return Right(
        Failure(
          status: false,
          message: responseMessage,
        ),
      );
    } else {
      return Left(
        response.body.toString(),
      );
    }
  }

  @override
  Map<String, String> appendHeader({
    Map<String, String>? headers,
    bool refresh = false,
  }) {
    try {
      headers ??= <String, String>{};
      // headers["Authorization"] =
      //     'Bearer ${storage.getString(key: StorageKeys.fcmToken)}';
      headers["content-type"] = "application/json; charset=utf-8";
    } catch (e) {
      debugPrint(e.toString());
    }

    return headers!;
  }
}
