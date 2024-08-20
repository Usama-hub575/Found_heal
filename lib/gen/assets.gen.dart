/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// Directory path: assets/images/png
  $AssetsImagesPngGen get png => const $AssetsImagesPngGen();

  /// Directory path: assets/images/svg
  $AssetsImagesSvgGen get svg => const $AssetsImagesSvgGen();
}

class $AssetsImagesPngGen {
  const $AssetsImagesPngGen();

  /// File path: assets/images/png/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/images/png/logo.png');

  /// List of all assets
  List<AssetGenImage> get values => [logo];
}

class $AssetsImagesSvgGen {
  const $AssetsImagesSvgGen();

  /// File path: assets/images/svg/apple.svg
  String get apple => 'assets/images/svg/apple.svg';

  /// File path: assets/images/svg/back_button.svg
  String get backButton => 'assets/images/svg/back_button.svg';

  /// File path: assets/images/svg/facebook.svg
  String get facebook => 'assets/images/svg/facebook.svg';

  /// File path: assets/images/svg/gallery.svg
  String get gallery => 'assets/images/svg/gallery.svg';

  /// File path: assets/images/svg/google.svg
  String get google => 'assets/images/svg/google.svg';

  /// File path: assets/images/svg/hidden_password.svg
  String get hiddenPassword => 'assets/images/svg/hidden_password.svg';

  /// File path: assets/images/svg/join_back_green.svg
  String get joinBackGreen => 'assets/images/svg/join_back_green.svg';

  /// File path: assets/images/svg/logo_main.svg
  String get logoMain => 'assets/images/svg/logo_main.svg';

  /// File path: assets/images/svg/shown_password.svg
  String get shownPassword => 'assets/images/svg/shown_password.svg';

  /// File path: assets/images/svg/splash_green_top.svg
  String get splashGreenTop => 'assets/images/svg/splash_green_top.svg';

  /// File path: assets/images/svg/upload_cv.svg
  String get uploadCv => 'assets/images/svg/upload_cv.svg';

  /// List of all assets
  List<String> get values => [
        apple,
        backButton,
        facebook,
        gallery,
        google,
        hiddenPassword,
        joinBackGreen,
        logoMain,
        shownPassword,
        splashGreenTop,
        uploadCv
      ];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
