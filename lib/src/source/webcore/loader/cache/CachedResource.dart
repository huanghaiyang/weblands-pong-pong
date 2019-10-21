import 'package:weblands_pong_pong/src/source/webcore/PAL/pal/SessionID.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/CookieJar.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/ResourceLoaderOptions.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/TextResourceDecoder.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/cache/CachedResourceLoader.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/cache/CachedResourceRequest.dart';
import 'package:weblands_pong_pong/src/source/webcore/platform/network/ResourceRequest.dart';

enum Type {
  MainResource,
  ImageResource,
  CSSStyleSheet,
  Script,
  FontResource,
  SFVFontResource,
  MediaResource,
  RawResource,
  Icon,
  Beacon,
  Ping,
  SVGDocumentResource,
  XSLStyleSheet,
  LinkPrefetch,
  TextTrackResource,
  ApplicationManifest
}

enum Status { Unknown, Pending, Cached, LoadError, DecodeError }

abstract class CachedResource {
  factory CachedResource(CachedResourceRequest cachedResourceRequest, Type type, SessionID sessionID, CookieJar cookieJar) =>
      _CachedResource(cachedResourceRequest, type, sessionID, cookieJar);

  void load(CachedResourceLoader cachedResourceLoader);

  set encoding(String encoding);

  TextResourceDecoder get textResourceDecoder;

  ResourceRequest get resourceRequest;

  bool get errorOccurred;

  bool get wasCanceled;

  ResourceLoaderOptions get options;
}

class _CachedResource implements CachedResource {
  CachedResourceRequest cachedResourceRequest_;
  Type type_;
  SessionID sessionID_;
  CookieJar cookieJar_;
  String encoding_;
  TextResourceDecoder textResourceDecoder_;
  ResourceRequest resourceRequest_;
  bool errorOccurred_;
  bool wasCanceled_;
  ResourceLoaderOptions options_;

  _CachedResource(this.cachedResourceRequest_, this.type_, this.sessionID_, this.cookieJar_);

  @override
  ResourceRequest get resourceRequest {
    return resourceRequest_;
  }

  @override
  TextResourceDecoder get textResourceDecoder {
    return textResourceDecoder_;
  }

  @override
  set encoding(String encoding) {
    encoding_ = encoding;
  }

  @override
  void load(CachedResourceLoader cachedResourceLoader) {}

  @override
  bool get errorOccurred {
    return errorOccurred_;
  }

  @override
  bool get wasCanceled {
    return wasCanceled_;
  }

  @override
  ResourceLoaderOptions get options {
    return options_;
  }
}
