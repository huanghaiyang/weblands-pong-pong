import 'package:weblands_pong_pong/src/source/webcore/loader/appcache/ApplicationCacheGroup.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/appcache/ApplicationCacheResource.dart';
import 'package:weblands_pong_pong/src/source/webcore/platform/network/ResourceRequest.dart';
import 'package:weblands_pong_pong/src/source/wtf/wtf/URL.dart';

abstract class ApplicationCache {
  factory ApplicationCache.create() {}

  void addResource(ApplicationCacheResource applicationCacheResource);

  void setManifestResource(ApplicationCacheResource applicationCacheResource);

  ApplicationCacheResource get manifestResource;

  void setGroup(ApplicationCacheGroup applicationCacheGroup);

  ApplicationCacheGroup get group;

  bool get isComplete;

  ApplicationCacheResource resourceForRequest(ResourceRequest resourceRequest);

  ApplicationCacheGroup resourceForURL(URL url);

  set allowAllNetworkRequests(bool allowAllNetworkRequests);

  bool get allowAllNetworkRequests;

  set onlineWhitelist(List<URL> onlineWhitelist);

  List<URL> get onlineWhitelist;

  bool isURLInOnlineWhitelist(URL url);

  set fallbackURLs(List<MapEntry<URL, URL>> urls);

  bool urlMatchesFallbackNamespace(URL url, URL fallbackURL);

  void dump();

  Map<String, ApplicationCacheResource> get resources;

  set storageID(int storageID);

  int get storageID;

  void clearStorageID();

  bool requestIsHTTPOrHTTPSGet(ResourceRequest resourceRequest);

  int get estimatedSizeInStorage;
}
