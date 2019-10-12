import 'package:weblands_pong_pong/src/source/javaScriptCore/runtime/ConsoleTypes.dart';
import 'package:weblands_pong_pong/src/source/webcore/css/StyleSheetContents.dart';
import 'package:weblands_pong_pong/src/source/webcore/dom/DeviceOrientationOrMotionPermissionState.dart';
import 'package:weblands_pong_pong/src/source/webcore/dom/Document.dart';
import 'package:weblands_pong_pong/src/source/webcore/dom/DocumentIdentifier.dart';
import 'package:weblands_pong_pong/src/source/webcore/dom/SecurityPolicyViolationEvent.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/ApplicationManifestLoader.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/ContentFilter.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/CustomHeaderFields.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/DocumentWriter.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/FrameLoader.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/FrameLoaderTypes.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/LoadTiming.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/NavigationAction.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/ResourceLoader.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/ResourceLoaderOptions.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/SubresourceLoader.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/SubstituteData.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/SubstituteResource.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/appcache/ApplicationCacheHost.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/archive/Archive.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/archive/ArchiveResource.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/archive/ArchiveResourceCollection.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/cache/CachedRawResource.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/cache/CachedResource.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/cache/CachedResourceHandle.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/cache/CachedResourceLoader.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/icon/IconLoader.dart';
import 'package:weblands_pong_pong/src/source/webcore/modules/applicationmanifest/ApplicationManifest.dart';
import 'package:weblands_pong_pong/src/source/webcore/page/Frame.dart';
import 'package:weblands_pong_pong/src/source/webcore/platform/LinkIcon.dart';
import 'package:weblands_pong_pong/src/source/webcore/platform/SharedBuffer.dart';
import 'package:weblands_pong_pong/src/source/webcore/platform/Timer.dart';
import 'package:weblands_pong_pong/src/source/webcore/platform/network/FormData.dart';
import 'package:weblands_pong_pong/src/source/webcore/platform/network/ResourceError.dart';
import 'package:weblands_pong_pong/src/source/webcore/platform/network/ResourceRequest.dart';
import 'package:weblands_pong_pong/src/source/webcore/platform/network/ResourceResponse.dart';
import 'package:weblands_pong_pong/src/source/webcore/platform/network/ios/PreviewConverter.dart';
import 'package:weblands_pong_pong/src/source/webcore/platform/text/StringWithDirection.dart';
import 'package:weblands_pong_pong/src/source/webcore/workers/service/ServiceWorkerRegistrationData.dart';
import 'package:weblands_pong_pong/src/source/wtf/wtf/CompletionHandler.dart';
import 'package:weblands_pong_pong/src/source/wtf/wtf/MonotonicTime.dart';
import 'package:weblands_pong_pong/src/source/wtf/wtf/RunLoopTimer.dart';
import 'package:weblands_pong_pong/src/source/wtf/wtf/SchedulePair.dart';
import 'package:weblands_pong_pong/src/source/wtf/wtf/URL.dart';

typedef ServiceWorkerRegistrationDataHandler = void Function([ServiceWorkerRegistrationData data]);

typedef ResourceRequestHandler = void Function(ResourceRequest request);

typedef NoopHandler = void Function();

enum AutoplayPolicy { Default, Allow, AllowWithoutSound, Deny }

enum AutoplayQuirk { SynthesizedPauseEvents, InheritedUserGestures, ArbitraryUserGestures, PerDocumentAutoplayBehavior }

enum PopUpPolicy { Default, Allow, Block }

enum MetaViewportPolicy { Default, Respect, Ignore }

enum MediaSourcePolicy { Default, Disable, Enable }

enum SimulatedMouseEventsDispatchPolicy { Default, Allow, Deny }

enum LegacyOverflowScrollingTouchPolicy { Default, Disable, Enable }

abstract class DocumentLoader {
  static DocumentLoader create(ResourceRequest request, SubstituteData data) {}

  factory DocumentLoader(ResourceRequest request, SubstituteData data) {}

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

  void scheduleSubstituteResourceLoad(SubresourceLoader loader, SubstituteResource resource);

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

  bool get _deferMainResourceDataLoad;

  void didTellClientAbortLoad(String url);

  bool get haveToldClientAbortLoad;

  void recordMemoryCacheLoadForFutureClientNotification(ResourceRequest request);

  void takeMemoryCacheLoadsForClientNotification(List<ResourceRequest> requests);

  LoadTiming get timing;

  void resetTiming();

  void commitData(List<int> bytes, int length);

  ApplicationCacheHost get applicationCacheHost;

  ApplicationCacheHost get applicationCacheHostUnlessBeingDestroyed;

  void checkLoadComplete();

  URL get documentURL;

  PreviewConverter get previewConverter;

  set previewConverter(PreviewConverter converter);

  void addPendingContentExtensionSheet(String identifier, StyleSheetContents sheetContents);

  ShouldOpenExternalURLsPolicy get shouldOpenExternalURLsPolicyToPropagate;

  set shouldOpenExternalURLsPolicy(ShouldOpenExternalURLsPolicy policy);

  ContentFilter get contentFilter;

  bool get isAlwaysOnLoggingAllowed;

  void startIconLogging();

  void didGetLoadDecisionForIcon(bool decision, int loadIdentifier, int newCallbackID);

  void finishLoadingIcon(IconLoader loader, SharedBuffer buffer);

  List<LinkIcon> get linkIcons;

  int loadApplicationManifest();

  void finishedLoadingApplicationManifest(ApplicationManifestLoader loader);

  void setCustomHeaderFields(List<CustomHeaderFields> fields);

  set allowWebArchiveForMainFrame(bool allowWebArchiveForMainFrame);

  bool get allowWebArchiveForMainFrame;

  set downloadAttribute(String attribute);

  String get downloadAttribute;

  void applyPoliciesToSettings();

  set allowContentChangeObserverQuirk(bool allow);

  bool get allowContentChangeObserverQuirk;

  Document get document;

  // service worker
  void matchRegistration(URL url, CompletionHandler<ServiceWorkerRegistrationDataHandler> handler);

  void registerTemporaryServiceWorkerClient(URL url);

  void unregisterTemporaryServiceWorkerClient();

  void loadMainResource(ResourceRequest request);

  set request(ResourceRequest request);

  void commitIfReady();

  set documentError(ResourceError error);

  void commitLoad(List<int> chars, int length);

  void clearMainResourceLoader();

  void setupForReplace();

  void maybeFinishLoadingMultipartContent();

  bool maybeCreateArchive();

  void clearArchiveResources();

  void willSendRequest(ResourceRequest request, ResourceResponse response, CompletionHandler<ResourceRequestHandler> handler);

  void finishedLoading();

  set mainReceivedError(ResourceError error);

  void redirectReceived(
      CachedResource resource, ResourceRequest request, ResourceResponse response, CompletionHandler<ResourceRequestHandler> handler);

  void responseReceived(CachedResource resource, ResourceResponse response, CompletionHandler<NoopHandler> handler);

  // void responseReceived(ResourceResponse response, CompletionHandler<NoopHandler> handler);

  void dataReceived(CachedResource resource, List<int> data, int length);

  void notifyFinished(CachedResource resource);

  bool maybeLoadEmpty();

  bool get isMultipartReplacingLoad;

  bool isPostOrRedirectAfterPost(ResourceRequest request, ResourceResponse response);

  bool tryLoadingRequestFromApplicationCache();

  bool tryLoadingSubstituteData();

  bool tryLoadingRedirectRequestFromApplicationCache(ResourceRequest request);

  void restartLoadingDueToServiceWorkerRegistrationChange(ResourceRequest request, [ServiceWorkerRegistrationData data]);

  void continueAfterContentPolicy(PolicyAction action);

  void stopLoadingForPolicyChange();

  ResourceError interruptForPolicyChangeError();

  void handleSubstituteDataLoadNow();

  bool startDataLoadTimer();

  void deliverSubstituteResourcesAfterDelay();

  void substituteResourceDeliveryTimerFired();

  void clearMainResource();

  void cancelPolicyCheckIfNeeded();

  void becomeMainResourceClient();

  void notifyFinishedLoadingIcon(int callbackIdentifier, SharedBuffer buffer);

  void notifyFinishedLoadingApplicationManifest(int callbackIdentifier, [ApplicationManifest manifest]);

  void addConsoleMessage(MessageSource source, MessageLevel level, String message, int requestIndentifier);

  void sendSCPViolationReport(URL url, FormData data);

  void enqueueSecurityPolicyViolationEvent(SecurityPolicyViolationEvent event);

  bool disallowWebArchive();
}

class _DocumentLoader implements DocumentLoader {
  CachedResourceLoader _cacheResourceLoader;

  CachedResourceHandle<CachedRawResource> _mainResource;

  Map<int, ResourceLoader> _subresourceLoaders;

  Map<int, ResourceLoader> _multipartSubresourceLoaders;

  Map<int, ResourceLoader> _plugInStreamLoaders;

  DocumentWriter _writer;

  ResourceRequest _originalRequest;

  SubstituteData _substituteData;

  ResourceRequest _originalRequestCopy;

  ResourceRequest _request;

  ResourceResponse _response;

  ResourceError _mainDocumentError;

  bool _originalSubstituteDataWasValid;

  bool _commited = false;

  bool _isStopping = false;

  bool _gotFirstByte = false;

  bool _isClientRedirect = false;

  bool _isLoadingMultipartContent = false;

  bool _wasOnloadDispatched = false;

  StringWithDirection _pageTitle;

  String _overrideEncoding;

  NavigationAction _triggeringAction;

  ResourceRequest _lastCheckedRequest;

  List<ResourceResponse> _responses;

  bool _stopRecordingResponses = false;

  Map<ResourceLoader, SubstituteResource> _pendingSubstituteResources;

  Timer _substituteResourceDeliveryTimer;

  ArchiveResourceCollection _archiveResourceCollection;

  Archive _archive;

  SharedBuffer _parsedArchiveData;

  Set<String> _resourceClientKnowsAbout;

  List<ResourceRequest> _resourcesLoadedFromMemoryCacheClientNotification;

  String _clientRedirectSourceForHistory;

  bool _didCreateGlobalHistoryEntry = false;

  LoadTiming _loadTiming;

  MonotonicTime _timeOfLastDataReceived;

  int _identifierForLoadWithoutResourceLoader = 0;

  RunLoopTimer<DocumentLoader> _dataLoadTimer;

  bool _waitingForContentPolicy = false;

  bool _waitingForNavigationPolicy = false;

  Map<int, LinkIcon> _iconsPendingLoadDecision;

  Map<IconLoader, int> _iconLoaders;

  List<LinkIcon> _linkIcons;

  Map<ApplicationManifestLoader, int> _applicationManifestLoaders;

  List<CustomHeaderFields> _customHeaderFields;

  bool _subresourceLoadersArePageCacheAcceptable = false;

  ShouldOpenExternalURLsPolicy _shouldOpenExternalURLsPolicy = ShouldOpenExternalURLsPolicy.ShouldNotAllow;

  ApplicationCacheHost _applicationCacheHost;

  ContentFilter _contentFilter;

  PreviewConverter _previewConverter;

  Map<String, StyleSheetContents> _pendingNamedContentExtesionStyleSheets;

  Map<String, List<Map<String, int>>> _pendingContentExtensionDisplayNoneSelectors;

  String _customUserAgent;

  String _customJavaScriptUserAgentAsSiteSpecificQuirks;

  bool _allowContentChangeObserverQuirks = false;

  String _customNavigationPlatform;

  bool _userContentExtensionsEnabled = true;

  DeviceOrientatPonOrMotionPermissionState _deviceOrientatPonOrMotionPermissionState = DeviceOrientatPonOrMotionPermissionState.Prompt;

  AutoplayPolicy _autoplayPolicy = AutoplayPolicy.Default;

  AutoplayQuirk _autoplayQuirk;

  PopUpPolicy _popUpPolicy = PopUpPolicy.Default;

  MetaViewportPolicy _metaViewportPolicy = MetaViewportPolicy.Default;

  MediaSourcePolicy _mediaSourcePolicy = MediaSourcePolicy.Default;

  SimulatedMouseEventsDispatchPolicy _simulatedMouseEventsDispatchPolicy = SimulatedMouseEventsDispatchPolicy.Default;

  LegacyOverflowScrollingTouchPolicy _legacyOverflowScrollingTouchPolicy = LegacyOverflowScrollingTouchPolicy.Default;

  ServiceWorkerRegistrationData _serviceWorkerRegistrationData;

  DocumentIdentifier _temporaryServiceWorkerClient;

  bool _hasEverBeenAttached = false;

  bool _allowWebArchiveForMainFrame = false;

  String _downloadAttribute;

  @override
  void attachToFrame(Frame frame) {}

  @override
  void detachFromFrame() {}

  @override
  FrameLoader get frameLoader {}

  @override
  SubresourceLoader get mainResourceLoader {}

  @override
  SharedBuffer get mainResourceData {}

  @override
  DocumentWriter get writer {}

  @override
  ResourceRequest get originalRequest {}

  @override
  ResourceRequest get originalRequestCopy {}

  @override
  CachedResourceLoader get cachedResourceLoader {}

  @override
  SubstituteData get substituteData {}

  @override
  String get responseMIMEType {}

  @override
  URL get url {}

  @override
  URL get unreachableURL {}

  @override
  URL get originalURL {}

  @override
  URL get responseURL {}

  @override
  set responseMIMEType(String type) {}

  @override
  String get currentContentType {}

  @override
  void replaceRequestURLForSameDocumentNavigation(URL url) {}

  @override
  bool get isStopping {}

  @override
  void stopLoading() {}

  @override
  bool get isCommitted {}

  @override
  set isCommitted(bool isCommitted) {}

  @override
  bool get isLoading {}

  @override
  ResourceError get mainDocumentError {}

  @override
  ResourceResponse get response {}

  @override
  set response(ResourceResponse response) {}

  @override
  bool get isClientRedirect {}

  @override
  set isClientRedirect(bool isClientRedirect) {}

  @override
  void dispatchOnloadEvents() {}

  @override
  bool get isOnloadDispatched {}

  @override
  bool get isLoadingInApiSense {}

  @override
  set title(StringWithDirection title) {}

  @override
  String get overrideEncoding {}

  @override
  void schedule(SchedulePair pair) {}

  @override
  void unschedule(SchedulePair pair) {}

  @override
  set archive(Archive archive) {}

  @override
  void addAllArchiveResources(Archive archive) {}

  @override
  void addArchiveResource(ArchiveResource resource) {}

  @override
  Archive popArchiveForSubFrame(String frame, URL url) {}

  @override
  SharedBuffer parseArchiveData() {}

  @override
  bool scheduleArchiveLoad(ResourceLoader loader, ResourceRequest request) {}

  @override
  void scheduleSubstituteResourceLoad(SubresourceLoader loader, SubstituteResource resource) {}

  @override
  void scheduleCannotShowURLError(ResourceLoader loader) {}

  @override
  ArchiveResource archiveResourceForURL(URL url) {}

  @override
  ArchiveResource get mainResource {}

  @override
  ArchiveResource subresource(URL url) {}

  @override
  List<ArchiveResource> get subresources {}

  @override
  bool isSubstituteLoadingPending(ResourceLoader loader) {}

  @override
  void cancelPendingSubstituteLoad(ResourceLoader loader) {}

  @override
  void addResponse(ResourceResponse response) {}

  @override
  List<ResourceResponse> get responses {}

  @override
  NavigationAction get triggerAction {}

  @override
  set triggerAction(NavigationAction navigationAction) {}

  @override
  set overrideEncoding(String enconding) {}

  @override
  set lastCheckedRequest(ResourceRequest request) {}

  @override
  ResourceRequest get lastCheckedRequest {}

  @override
  void stopRecordingResponses() {}

  @override
  StringWithDirection get title {}

  @override
  URL get urlForHistory {}

  @override
  bool get urlForHistoryReflectsFailure {}

  @override
  String get clientRedirectSourceForHistory {}

  @override
  String get clientRedirectDestinationForHistory {}

  @override
  set clientRedirectSourceForHistory(String clientRedirectSourceForHistory) {}

  @override
  String get serverRedirectSourceForHistory {}

  @override
  String get serverRedirectDestinationForHistory {}

  @override
  bool get didCreateGlobalHistoryEntry {}

  @override
  disCreateGlobalHistoryEntry(bool disCreateGlobalHistoryEntry) {}

  @override
  bool get subresourceLoadersArePageCacheAcceptable {}

  @override
  set defersLoading(bool defersLoading) {}

  @override
  set mainResourceDataBufferingPolicy(DataBufferingPolicy policy) {}

  @override
  void startLoadingMainResource() {}

  @override
  void cancelMainResourceLoad() {}

  @override
  void willContinueMainResourceLoadAfterRedirect(ResourceRequest request) {}

  @override
  bool get isLoadingMainResource {}

  @override
  bool get isLoadingMultipartContent {}

  @override
  void stopLoadingPlugIns() {}

  @override
  void stopLoadingSubresources() {}

  @override
  void stopLoadingAfterXFrameOptionsOrContentSecurityPolicyDenied(num identifier, ResourceResponse response) {}

  @override
  bool get userContentExtensionsEnabled {}

  @override
  set userContentExtensionsEnabled(bool userContentExtensionsEnabled) {}

  @override
  DeviceOrientatPonOrMotionPermissionState get deviceOrientationOrMotionPermissionState {}

  @override
  set deviceOrientationOrMotionPermissionState(DeviceOrientatPonOrMotionPermissionState state) {}

  @override
  AutoplayPolicy get autoplayPolicy {}

  @override
  set autoplayPolicy(AutoplayPolicy policy) {}

  @override
  String get customUserAgent {}

  @override
  set customUserAgent(String customUserAgent) {}

  @override
  String get customJavaScriptUserAgentAsSiteSpecificQuirks {}

  @override
  set customJavaScriptUserAgentAsSiteSpecificQuirks(String customUserAgent) {}

  @override
  String get customNavigatorPlatform {}

  @override
  set customNavigatorPlatform(String platform) {}

  @override
  Set<AutoplayQuirk> get allowedAutoplayQuirks {}

  @override
  set allowedAutoplayQuirks(Set<AutoplayQuirk> quirks) {}

  @override
  PopUpPolicy get popUpPolicy {}

  @override
  set popUpPolicy(PopUpPolicy policy) {}

  @override
  MetaViewportPolicy get metaViewportPolicy {}

  @override
  set metaViewportPolicy(MetaViewportPolicy policy) {}

  @override
  MediaSourcePolicy get mediaSourcePolicy {}

  @override
  set mediaSourcePolicy(MediaSourcePolicy policy) {}

  @override
  SimulatedMouseEventsDispatchPolicy get simulatedMouseEventsDispatchPolicy {}

  @override
  set simulatedMouseEventsDispatchPolicy(SimulatedMouseEventsDispatchPolicy policy) {}

  @override
  LegacyOverflowScrollingTouchPolicy get legacyOverflowScrollingTouchPolicy {}

  @override
  set legacyOverflowScrollingTouchPolicy(LegacyOverflowScrollingTouchPolicy policy) {}

  @override
  void addSubresourceLoader(ResourceLoader loader) {}

  @override
  void removeSubresourceLoader(LoadCompletionType type, ResourceLoader loader) {}

  @override
  void addPlugInStreamLoader(ResourceLoader loader) {}

  @override
  void removePluginInStreamLoader(ResourceLoader loader) {}

  @override
  void subresourceLoaderFinishedLoadingOnePart(ResourceLoader loader) {}

  @override
  bool get _deferMainResourceDataLoad {}

  @override
  void didTellClientAbortLoad(String url) {}

  @override
  bool get haveToldClientAbortLoad {}

  @override
  void recordMemoryCacheLoadForFutureClientNotification(ResourceRequest request) {}

  @override
  void takeMemoryCacheLoadsForClientNotification(List<ResourceRequest> requests) {}

  @override
  LoadTiming get timing {}

  @override
  void resetTiming() {}

  @override
  void commitData(List<int> bytes, int length) {}

  @override
  ApplicationCacheHost get applicationCacheHost {}

  @override
  ApplicationCacheHost get applicationCacheHostUnlessBeingDestroyed {}

  @override
  void checkLoadComplete() {}

  @override
  URL get documentURL {}

  @override
  PreviewConverter get previewConverter {}

  @override
  set previewConverter(PreviewConverter converter) {}

  @override
  void addPendingContentExtensionSheet(String identifier, StyleSheetContents sheetContents) {}

  @override
  ShouldOpenExternalURLsPolicy get shouldOpenExternalURLsPolicyToPropagate {}

  @override
  set shouldOpenExternalURLsPolicy(ShouldOpenExternalURLsPolicy policy) {}

  @override
  ContentFilter get contentFilter {}

  @override
  bool get isAlwaysOnLoggingAllowed {}

  @override
  void startIconLogging() {}

  @override
  void didGetLoadDecisionForIcon(bool decision, int loadIdentifier, int newCallbackID) {}

  @override
  void finishLoadingIcon(IconLoader loader, SharedBuffer buffer) {}

  @override
  List<LinkIcon> get linkIcons {}

  @override
  int loadApplicationManifest() {}

  @override
  void finishedLoadingApplicationManifest(ApplicationManifestLoader loader) {}

  @override
  void setCustomHeaderFields(List<CustomHeaderFields> fields) {}

  @override
  set allowWebArchiveForMainFrame(bool allowWebArchiveForMainFrame) {}

  @override
  bool get allowWebArchiveForMainFrame {}

  @override
  set downloadAttribute(String attribute) {}

  @override
  String get downloadAttribute {}

  @override
  void applyPoliciesToSettings() {}

  @override
  set allowContentChangeObserverQuirk(bool allow) {}

  @override
  bool get allowContentChangeObserverQuirk {}

  @override
  Document get document {}

  @override
  void matchRegistration(URL url, CompletionHandler<ServiceWorkerRegistrationDataHandler> handler) {}

  @override
  void registerTemporaryServiceWorkerClient(URL url) {}

  @override
  void unregisterTemporaryServiceWorkerClient() {}

  @override
  void loadMainResource(ResourceRequest request) {}

  @override
  set request(ResourceRequest request) {}

  @override
  void commitIfReady() {}

  @override
  set documentError(ResourceError error) {}

  @override
  void commitLoad(List<int> chars, int length) {}

  @override
  void clearMainResourceLoader() {}

  @override
  void setupForReplace() {}

  @override
  void maybeFinishLoadingMultipartContent() {}

  @override
  bool maybeCreateArchive() {}

  @override
  void clearArchiveResources() {}

  @override
  void willSendRequest(ResourceRequest request, ResourceResponse response, CompletionHandler<ResourceRequestHandler> handler) {}

  @override
  void finishedLoading() {}

  @override
  set mainReceivedError(ResourceError error) {}

  @override
  void redirectReceived(
      CachedResource resource, ResourceRequest request, ResourceResponse response, CompletionHandler<ResourceRequestHandler> handler) {}

  @override
  void responseReceived(CachedResource resource, ResourceResponse response, CompletionHandler<NoopHandler> handler) {}

  @override
  void dataReceived(CachedResource resource, List<int> data, int length) {}

  @override
  void notifyFinished(CachedResource resource) {}

  @override
  bool maybeLoadEmpty() {}

  @override
  bool get isMultipartReplacingLoad {}

  @override
  bool isPostOrRedirectAfterPost(ResourceRequest request, ResourceResponse response) {}

  @override
  bool tryLoadingRequestFromApplicationCache() {}

  @override
  bool tryLoadingSubstituteData() {}

  @override
  bool tryLoadingRedirectRequestFromApplicationCache(ResourceRequest request) {}

  @override
  void restartLoadingDueToServiceWorkerRegistrationChange(ResourceRequest request, [ServiceWorkerRegistrationData data]) {}

  @override
  void continueAfterContentPolicy(PolicyAction action) {}

  @override
  void stopLoadingForPolicyChange() {}

  @override
  ResourceError interruptForPolicyChangeError() {}

  @override
  void handleSubstituteDataLoadNow() {}

  @override
  bool startDataLoadTimer() {}

  @override
  void deliverSubstituteResourcesAfterDelay() {}

  @override
  void substituteResourceDeliveryTimerFired() {}

  @override
  void clearMainResource() {}

  @override
  void cancelPolicyCheckIfNeeded() {}

  @override
  void becomeMainResourceClient() {}

  @override
  void notifyFinishedLoadingIcon(int callbackIdentifier, SharedBuffer buffer) {}

  @override
  void notifyFinishedLoadingApplicationManifest(int callbackIdentifier, [ApplicationManifest manifest]) {}

  @override
  void addConsoleMessage(MessageSource source, MessageLevel level, String message, int requestIndentifier) {}

  @override
  void sendSCPViolationReport(URL url, FormData data) {}

  @override
  void enqueueSecurityPolicyViolationEvent(SecurityPolicyViolationEvent event) {}

  @override
  bool disallowWebArchive() {}
}
