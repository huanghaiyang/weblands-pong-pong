import 'package:weblands_pong_pong/src/source/webcore/dom/Document.dart';
import 'package:weblands_pong_pong/src/source/webcore/page/FrameIdentifier.dart';
import 'package:weblands_pong_pong/src/source/webcore/page/PageIdentifier.dart';
import 'package:weblands_pong_pong/src/source/webcore/platform/Cookie.dart';
import 'package:weblands_pong_pong/src/source/webcore/platform/network/CookieRequestHeaderFieldProxy.dart';
import 'package:weblands_pong_pong/src/source/webcore/platform/network/SameSiteInfo.dart';
import 'package:weblands_pong_pong/src/source/webcore/platform/network/StorageSessionProvider.dart';
import 'package:weblands_pong_pong/src/source/wtf/wtf/URL.dart';

enum SecureCookiesAccessed { Yes, No }
enum IncludeSecureCookies { Yes, No }
enum IncludeHttpOnlyCookies { Yes, No }

abstract class CookieJar {
  static CookieJar create(StorageSessionProvider provider) {}

  static CookieRequestHeaderFieldProxy cookieRequestHeaderFieldProxy(Document document, URL url) {}

  String cookieRequestHeaderFieldValue(Document document, URL url);

  String cookies(Document document, URL url);

  void setCookies(Document document, URL url, String cookieString);

  bool cookiesEnabled(Document document);

  MapEntry<String, SecureCookiesAccessed> getCookieRequestHeaderFieldValue(URL firstParty, SameSiteInfo siteInfo, URL url,
      [FrameIdentifier frameIdentifier, PageIdentifier pageIdentifier, IncludeSecureCookies includeSecureCookies]);

  bool getRawCookies(Document document, URL url, List<Cookie> cookies);

  void deleteCookie(Document document, URL url, String cookieName);

  static SameSiteInfo sameSiteInfo(Document document) {}

  IncludeSecureCookies shouldIncludeSecureCookies(Document document, URL url) {}
}
