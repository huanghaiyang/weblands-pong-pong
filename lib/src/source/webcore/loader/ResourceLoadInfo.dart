import 'package:weblands_pong_pong/src/source/wtf/wtf/URL.dart';

enum ResourceType { Invalid, Document, Image, StyleSheet, Script, Font, Raw, SVGDocument, Media, PlugInStream, Popup, Ping }

abstract class ResourceLoadInfo {
  URL get resourceURL;

  URL mainDocumentURL;

  ResourceType type;

  bool get isThirdParty;

  int get resourceFlags;
}
