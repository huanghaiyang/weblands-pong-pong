import 'package:weblands_pong_pong/src/source/webcore/loader/ResourceLoader.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/SubstituteData.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/appcache/ApplicationCache.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/appcache/ApplicationCacheGroup.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/appcache/ApplicationCacheResource.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/appcache/DOMApplicationCache.dart';
import 'package:weblands_pong_pong/src/source/webcore/page/Frame.dart';
import 'package:weblands_pong_pong/src/source/webcore/platform/SharedBuffer.dart';
import 'package:weblands_pong_pong/src/source/webcore/platform/network/ResourceError.dart';
import 'package:weblands_pong_pong/src/source/webcore/platform/network/ResourceRequest.dart';
import 'package:weblands_pong_pong/src/source/webcore/platform/network/ResourceResponse.dart';
import 'package:weblands_pong_pong/src/source/wtf/wtf/URL.dart';

enum Status { UNCACHED, IDLE, CHECKING, DOWNLOADING, UPDATEREADY, OBSOLETE }

class CacheInfo {
  URL manifest;
  num creationTime;
  num updateTime;
  int size;
}

class ResourceInfo {
  URL resource;
  bool isMaster;
  bool isManifest;
  bool isFallback;
  bool isForeign;
  bool isExplicit;
  int size;
}

class DeferredEvent {
  String eventType;
  int progressTotal;
  int progressDone;
}

abstract class ApplicationCacheHost {
  static URL createFileURL(String path) {}

  void selectCacheWithoutManifest();

  void selectCacheWithManifest(URL manifestURL);

  void maybeLoadMainResource(ResourceRequest resourceRequest, SubstituteData substituteData);

  void maybeLoadMainResourceForRedirect(ResourceRequest resourceRequest, SubstituteData substituteData);

  void maybeLoadMainResourceForResponse(ResourceRequest resourceRequest, ResourceResponse resourceResponse);

  void mainResourceDataReceived(String data, int length, int encodingDataLength, bool allAtOnce);

  void finishedLoadingMainResource();

  void failedLoadingMainResource();

  bool maybeLoadResource(ResourceLoader resourceLoader, ResourceRequest resourceRequest, URL originalURL);

  bool maybeLoadFallbackForRedirect(ResourceLoader resourceLoader, ResourceRequest resourceRequest, ResourceResponse resourceResponse);

  bool maybeLoadFallbackForResponse(ResourceLoader resourceLoader, ResourceResponse resourceResponse);

  bool maybeLoadFallbackForError(ResourceLoader resourceLoader, ResourceError resourceError);

  bool maybeLoadSynchronously(
      ResourceRequest resourceRequest, ResourceError resourceError, ResourceResponse resourceResponse, SharedBuffer sharedBuffer);

  void maybeLoadFallbackSynchronously(
      ResourceRequest resourceRequest, ResourceError resourceError, ResourceResponse resourceResponse, SharedBuffer sharedBuffer);

  bool canCacheInPageCache();

  Status get status;

  bool update();

  bool swapCache();

  void abort();

  set domApplicationCache(DOMApplicationCache domApplicationCache);

  void notifyDOMApplicationCache(ResourceRequest resourceRequest, ApplicationCacheResource applicationCacheResource);

  void stopLoadingInFrame(Frame frame);

  void stopDeferringEvents();

  List<ResourceInfo> get resourceList;

  CacheInfo get applicationCacheInfo;

  bool shouldLoadResourceFromApplicationCache(ResourceRequest resourceRequest, ApplicationCacheResource applicationCacheResource);

  bool getApplicationCacheFallbackResource(
      ResourceRequest resourceRequest, ApplicationCacheResource applicationCacheResource, ApplicationCache applicationCache);

  bool isApplicationCacheEnabled;

  bool isApplicationCacheBlockedForRequest(ResourceRequest resourceRequest);

  void dispatchDOMEvent(String eventType, int progressTotal, int progressDone);

  bool scheduleLoadFallbackResourceFromApplicationCache(ResourceLoader resourceLoader, ApplicationCache applicationCache);

  void setCandidateApplicationCacheGroup(ApplicationCacheGroup applicationCacheGroup);

  ApplicationCacheGroup get candidateApplicationCacheGroup;

  ApplicationCache get applicationCache;

  ApplicationCache get mainResourceApplicationCache;

  bool maybeLoadFallbackForMainError(ResourceRequest resourceRequest, ResourceError resourceError);
}
