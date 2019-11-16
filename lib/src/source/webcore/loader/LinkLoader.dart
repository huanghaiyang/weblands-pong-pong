import 'package:weblands_pong_pong/src/source/webcore/html/LinkRelAttribute.dart';
import 'package:weblands_pong_pong/src/source/wtf/wtf/URL.dart';

abstract class LinkLoader {}

abstract class LinkLoadParameters {
  LinkRelAttribute get relAttribute;

  URL get href;

  String get media;

  String get mimeType;

  String get crossOrigin;

  String get imageSrcSet;

  String get imagesSizes;
}
