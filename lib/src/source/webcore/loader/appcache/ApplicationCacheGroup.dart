import 'package:weblands_pong_pong/src/source/webcore/loader/DocumentLoader.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/appcache/ApplicationCache.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/appcache/ApplicationCacheResource.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/appcache/ApplicationCacheResourceLoader.dart' show Error;
import 'package:weblands_pong_pong/src/source/webcore/loader/appcache/ApplicationCacheStorage.dart';
import 'package:weblands_pong_pong/src/source/webcore/page/Frame.dart';
import 'package:weblands_pong_pong/src/source/webcore/page/SecurityOrigin.dart';
import 'package:weblands_pong_pong/src/source/webcore/platform/network/ResourceRequest.dart';
import 'package:weblands_pong_pong/src/source/wtf/wtf/URL.dart';

enum ApplicationCacheUpdateOption { ApplicationCacheUpdateWithBrowsingContext, ApplicationCacheUpdateWithoutBrowsingContext }

enum UpdateStatus { Idle, Checking, Downloading }

enum CompletionType { None, NoUpdate, Failure, Completed }

abstract class ApplicationCacheGroup {
  static ApplicationCache cacheForMainRequest(ResourceRequest resourceRequest, DocumentLoader documentLoader) {}

  static ApplicationCache fallbackCacheForMainResource(ResourceRequest resourceRequest, DocumentLoader documentLoader) {}

  void selectCache(Frame frame, URL manifestURL);

  void selectCacheWithoutManifestURL(Frame frame);

  ApplicationCacheStorage get storage;

  URL get manifestURL;

  SecurityOrigin get origin;

  UpdateStatus get updateStatus;

  set updateStatus(UpdateStatus updateStatus);

  set storageID(int storageID);

  int get storageID;

  void clearStorageID();

  void update(Frame frame, ApplicationCacheUpdateOption applicationCacheUpdateOption);

  void cacheDestroyed(ApplicationCache applicationCache);

  void abort(Frame frame);

  void cacheIsComplete(ApplicationCache applicationCache);

  void stopLoadingInFrame(Frame frame);

  ApplicationCache get newestCache;

  set newestCache(ApplicationCache applicationCache);

  void makeObsolete();

  bool get isObsolete;

  void finishedLoadingMainResource(DocumentLoader documentLoader);

  void failedLoadingMainResource(DocumentLoader documentLoader);

  void disassociateDocumentLoader(DocumentLoader documentLoader);

  static void postListenerTask(String eventType, int progressTotal, int progressDone, Set<DocumentLoader> documentLoaders) {}

  void scheduleReachedMaxAppCacheSizeCallback();

  void didFinishLoadingManifest();

  void didFailLoadingManifest(Error error);

  void didFailLoadingEntry(Error error, URL url, int type);

  void didFinishLoadingEntry(URL url);

  void didReachMaxAppCacheSize();

  void didReachOriginQuote(int totalSpaceNeeded);

  void startLoadingEntry();

  void deliverDelayedMainResources();

  void checkIfLoadIsComplete();

  void cacheUpdateFailed();

  void recalculateAvailableSpaceInQuota();

  void manifestNotFound();

  void addEntry(String entry, int type);

  void associateDocumentLoaderWithCache(DocumentLoader documentLoader, ApplicationCache applicationCache);

  void stopLoading();

  ResourceRequest createRequest(URL url, ApplicationCacheResource applicationCacheResource);
}
