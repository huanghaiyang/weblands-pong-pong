import 'package:weblands_pong_pong/src/source/webcore/dom/Document.dart';
import 'package:weblands_pong_pong/src/source/webcore/platform/network/CookieRequestHeaderFieldProxy.dart';
import 'package:weblands_pong_pong/src/source/webcore/platform/network/StorageSessionProvider.dart';
import 'package:weblands_pong_pong/src/source/wtf/wtf/URL.dart';

abstract class CookieJar {
  static CookieJar create(StorageSessionProvider provider) {}

  static CookieRequestHeaderFieldProxy cookieRequestHeaderFieldProxy(Document document, URL url) {}

  String cookieRequestHeaderFieldValue(Document document, URL url);

  String cookies(Document document, URL url);

  void setCookies(Document document, URL url, String cookieString);

  bool cookiesEnabled(Document document);
}
