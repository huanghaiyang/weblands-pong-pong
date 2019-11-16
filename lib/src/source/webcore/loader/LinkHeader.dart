import 'package:weblands_pong_pong/src/source/webcore/rending/mathml/RenderMathMLToken.dart';

abstract class LinkHeader {
  factory LinkHeader(CharacterType position, CharacterType end) {}

  String get url;

  String get rel;

  String get as;

  String get mimeTYpe;

  String get media;

  String get crossOrigin;

  String get imageSrcSet;

  String get imageSizes;

  bool get valid;

  bool get isViewportDependent;
}

enum LinkParameterName {
  LinkParameterRel,
  LinkParameterAnchor,
  LinkParameterTitle,
  LinkParameterMedia,
  LinkParameterType,
  LinkParameterRev,
  LinkParameterHreflang,
  LinkParameterUnknown,
  LinkParameterCrossOrigin,
  LinkParameterAs,
  LinkParameterImageSrcSet,
  LinkParameterImageSizes
}
