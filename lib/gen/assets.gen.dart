/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class Assets {
  Assets._();

  static const AssetGenImage kileleHealthLogo =
      AssetGenImage('assets/Kilele_Health_Logo.png');
  static const AssetGenImage rectangle7 =
      AssetGenImage('assets/Rectangle 7.png');
  static const AssetGenImage backpackersAnimateJpg =
      AssetGenImage('assets/backpackers-animate.jpg');
  static const String backpackersAnimateSvg = 'assets/backpackers-animate.svg';
  static const AssetGenImage calories = AssetGenImage('assets/calories.png');
  static const AssetGenImage diet = AssetGenImage('assets/diet.png');
  static const AssetGenImage drinking = AssetGenImage('assets/drinking.png');
  static const AssetGenImage hiking = AssetGenImage('assets/hiking.png');
  static const AssetGenImage loginIllustration =
      AssetGenImage('assets/login_illustration.png');
  static const AssetGenImage mentalHealthAnimateJpg =
      AssetGenImage('assets/mental-health-animate.jpg');
  static const String mentalHealthAnimateSvg =
      'assets/mental-health-animate.svg';
  static const AssetGenImage mentalHealth =
      AssetGenImage('assets/mentalHealth.png');
  static const AssetGenImage orphanageAnimateJpg =
      AssetGenImage('assets/orphanage-animate.jpg');
  static const String orphanageAnimateSvg = 'assets/orphanage-animate.svg';
  static const AssetGenImage running = AssetGenImage('assets/running.png');

  /// List of all assets
  List<dynamic> get values => [
        kileleHealthLogo,
        rectangle7,
        backpackersAnimateJpg,
        backpackersAnimateSvg,
        calories,
        diet,
        drinking,
        hiking,
        loginIllustration,
        mentalHealthAnimateJpg,
        mentalHealthAnimateSvg,
        mentalHealth,
        orphanageAnimateJpg,
        orphanageAnimateSvg,
        running
      ];
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

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
