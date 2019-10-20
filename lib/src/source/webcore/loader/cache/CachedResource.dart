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

abstract class CachedResource {}
