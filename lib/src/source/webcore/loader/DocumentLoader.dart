import 'package:weblands_pong_pong/src/source/webcore/dom/DeviceOrientationOrMotionPermissionState.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/DocumentWriter.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/FrameLoader.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/FrameLoaderTypes.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/LoadTiming.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/NavigationAction.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/ResourceLoader.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/ResourceLoaderOptions.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/SubresourceLoader.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/SubstituteData.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/appcache/ApplicationCacheHost.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/archive/Archive.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/archive/ArchiveResource.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/cache/CachedResourceLoader.dart';
import 'package:weblands_pong_pong/src/source/webcore/page/Frame.dart';
import 'package:weblands_pong_pong/src/source/webcore/platform/SharedBuffer.dart';
import 'package:weblands_pong_pong/src/source/webcore/platform/network/ResourceError.dart';
import 'package:weblands_pong_pong/src/source/webcore/platform/network/ResourceRequest.dart';
import 'package:weblands_pong_pong/src/source/webcore/platform/network/ResourceResponse.dart';
import 'package:weblands_pong_pong/src/source/webcore/platform/text/StringWithDirection.dart';
import 'package:weblands_pong_pong/src/source/wtf/wtf/SchedulePair.dart';
import 'package:weblands_pong_pong/src/source/wtf/wtf/URL.dart';

enum AutoplayPolicy { Default, Allow, AllowWithoutSound, Deny }

enum AutoplayQuirk {
  SynthesizedPauseEvents,
  InheritedUserGestures,
  ArbitraryUserGestures,
  PerDocumentAutoplayBehavior,
}

enum PopUpPolicy { Default, Allow, Block }

enum MetaViewportPolicy { Default, Respect, Ignore }

enum MediaSourcePolicy { Default, Disable, Enable }

enum SimulatedMouseEventsDispatchPolicy { Default, Allow, Deny }

enum LegacyOverflowScrollingTouchPolicy { Default, Disable, Enable }

abstract class DocumentLoader {
  static DocumentLoader create(ResourceRequest request, SubstituteData data) {}

  void attachToFrame(Frame frame);

  void detachFromFrame();

  FrameLoader get frameLoader;

  SubresourceLoader get mainResourceLoader;

  SharedBuffer get mainResourceData;

  DocumentWriter get writer;

  ResourceRequest get originalRequest;

  ResourceRequest get originalRequestCopy;

  CachedResourceLoader get cachedResourceLoader;

  SubstituteData get substituteData;

  String get responseMIMEType;

  URL get url;

  URL get unreachableURL;

  URL get originalURL;

  URL get responseURL;

  // ios
  set responseMIMEType(String type);

  String get currentContentType;

  void replaceRequestURLForSameDocumentNavigation(URL url);

  bool get isStopping;

  void stopLoading();

  bool get isCommitted;

  set isCommitted(bool isCommitted);

  bool get isLoading;

  ResourceError get mainDocumentError;

  ResourceResponse get response;

  set response(ResourceResponse response);

  bool get isClientRedirect;

  set isClientRedirect(bool isClientRedirect);

  void dispatchOnloadEvents();

  bool get isOnloadDispatched;

  bool get isLoadingInApiSense;

  set title(StringWithDirection title);

  String get overrideEncoding;

  //cocoa
  void schedule(SchedulePair pair);

  //cocoa
  void unschedule(SchedulePair pair);

  set archive(Archive archive);

  void addAllArchiveResources(Archive archive);

  void addArchiveResource(ArchiveResource resource);

  Archive popArchiveForSubFrame(String frame, URL url);

  SharedBuffer parseArchiveData();

  bool scheduleArchiveLoad(ResourceLoader loader, ResourceRequest request);

  void scheduleSubstituteResourceLoad(SubresourceLoader loader, ResourceRequest request);

  void scheduleCannotShowURLError(ResourceLoader loader);

  ArchiveResource archiveResourceForURL(URL url);

  ArchiveResource get mainResource;

  ArchiveResource subresource(URL url);

  List<ArchiveResource> get subresources;

  bool isSubstituteLoadingPending(ResourceLoader loader);

  void cancelPendingSubstituteLoad(ResourceLoader loader);

  void addResponse(ResourceResponse response);

  List<ResourceResponse> get responses;

  NavigationAction get triggerAction;

  set triggerAction(NavigationAction navigationAction);

  set overrideEncoding(String enconding);

  set lastCheckedRequest(ResourceRequest request);

  ResourceRequest get lastCheckedRequest;

  void stopRecordingResponses();

  StringWithDirection get title;

  URL get urlForHistory;

  bool get urlForHistoryReflectsFailure;

  String get clientRedirectSourceForHistory;

  String get clientRedirectDestinationForHistory;

  set clientRedirectSourceForHistory(String clientRedirectSourceForHistory);

  String get serverRedirectSourceForHistory;

  String get serverRedirectDestinationForHistory;

  bool get didCreateGlobalHistoryEntry;

  disCreateGlobalHistoryEntry(bool disCreateGlobalHistoryEntry);

  bool get subresourceLoadersArePageCacheAcceptable;

  set defersLoading(bool defersLoading);

  set mainResourceDataBufferingPolicy(DataBufferingPolicy policy);

  void startLoadingMainResource();

  void cancelMainResourceLoad();

  void willContinueMainResourceLoadAfterRedirect(ResourceRequest request);

  bool get isLoadingMainResource;

  bool get isLoadingMultipartContent;

  void stopLoadingPlugIns();

  void stopLoadingSubresources();

  void stopLoadingAfterXFrameOptionsOrContentSecurityPolicyDenied(num identifier, ResourceResponse response);

  bool get userContentExtensionsEnabled;

  set userContentExtensionsEnabled(bool userContentExtensionsEnabled);

  DeviceOrientatPonOrMotionPermissionState get deviceOrientationOrMotionPermissionState;

  set deviceOrientationOrMotionPermissionState(DeviceOrientatPonOrMotionPermissionState state);

  AutoplayPolicy get autoplayPolicy;

  set autoplayPolicy(AutoplayPolicy policy);

  String get customUserAgent;

  set customUserAgent(String customUserAgent);

  String get customJavaScriptUserAgentAsSiteSpecificQuirks;

  set customJavaScriptUserAgentAsSiteSpecificQuirks(String customUserAgent);

  String get customNavigatorPlatform;

  set customNavigatorPlatform(String platform);

  Set<AutoplayQuirk> get allowedAutoplayQuirks;

  set allowedAutoplayQuirks(Set<AutoplayQuirk> quirks);

  PopUpPolicy get popUpPolicy;

  set popUpPolicy(PopUpPolicy policy);

  MetaViewportPolicy get metaViewportPolicy;

  set metaViewportPolicy(MetaViewportPolicy policy);

  MediaSourcePolicy get mediaSourcePolicy;

  set mediaSourcePolicy(MediaSourcePolicy policy);

  SimulatedMouseEventsDispatchPolicy get simulatedMouseEventsDispatchPolicy;

  set simulatedMouseEventsDispatchPolicy(SimulatedMouseEventsDispatchPolicy policy);

  LegacyOverflowScrollingTouchPolicy get legacyOverflowScrollingTouchPolicy;

  set legacyOverflowScrollingTouchPolicy(LegacyOverflowScrollingTouchPolicy policy);

  void addSubresourceLoader(ResourceLoader loader);

  void removeSubresourceLoader(LoadCompletionType type, ResourceLoader loader);

  void addPlugInStreamLoader(ResourceLoader loader);

  void removePluginInStreamLoader(ResourceLoader loader);

  void subresourceLoaderFinishedLoadingOnePart(ResourceLoader loader);

  set deferMainResourceDataLoad(bool defer);

  bool get deferMainResourceDataLoad;

  void didTellClientAbortLoad(String url);

  bool get haveToldClientAbortLoad;

  void recordMemoryCacheLoadForFutureClientNotification(ResourceRequest request);

  void takeMemoryCacheLoadsForClientNotification(List<ResourceRequest> requests);

  LoadTiming get timing;

  void resetTiming();

  void commitData(List<int> bytes, int length);

  ApplicationCacheHost get applicationCacheHost;

  ApplicationCacheHost get applicationCacheHostUnlessBeingDestroyed;
}
