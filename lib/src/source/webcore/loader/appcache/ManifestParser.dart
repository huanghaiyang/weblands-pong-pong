import 'package:weblands_pong_pong/src/source/wtf/wtf/URL.dart';

class ManifestParser {
  List<URL> onlineWhitelistedURLs;
  Set<String> explicitURLs;
  List<MapEntry<URL, URL>> fallbackURLs;
  bool allowAllNetworkRequests;
}
