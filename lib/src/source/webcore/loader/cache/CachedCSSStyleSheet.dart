import 'package:weblands_pong_pong/src/source/webcore/PAL/pal/SessionID.dart';
import 'package:weblands_pong_pong/src/source/webcore/css/CSSParserContext.dart';
import 'package:weblands_pong_pong/src/source/webcore/css/StyleSheetContents.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/CookieJar.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/FrameLoader.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/TextResourceDecoder.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/cache/CachePolicy.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/cache/CachedResource.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/cache/CachedResourceClient.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/cache/CachedResourceRequest.dart';
import 'package:weblands_pong_pong/src/source/webcore/platform/SharedBuffer.dart';

enum MIMETypeCheckHint { Strict, Lax }

abstract class CachedCSSStyleSheet {
  factory CachedCSSStyleSheet(CachedResourceRequest cachedResourceRequest, SessionID sessionID, CookieJar cookieJar) {}

  String sheetText({MIMETypeCheckHint mimeTypeCheckHint = MIMETypeCheckHint.Strict, bool hasValidMIMEType});

  StyleSheetContents restoreParsedStyleSheet(CSSParserContext cssParserContext, CachePolicy cachePolicy, FrameLoader frameLoader);

  void saveParsedStyleSheet(StyleSheetContents sheetContents);

  bool get mimeTypeAllowedByNosniff;

  String get responseMIMEType;

  bool canUseSheet(MIMETypeCheckHint mimeTypeCheckHint, bool hasValidateMIMEType);

  bool get mayTryReplaceEncodedData;

  void didAddClient(CachedResourceClient cachedResourceClient);

  set encoding(String encoding);

  String get encoding;

  TextResourceDecoder get textResourceDecoder;

  void finishLoading(SharedBuffer sharedBuffer);

  void destroyDecodeData();

  set bodyDataFrom(CachedResource cachedResource);

  void checkNotify();
}
