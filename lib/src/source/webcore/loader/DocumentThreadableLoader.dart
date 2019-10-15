import 'package:weblands_pong_pong/src/source/webcore/dom/Document.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/ResourceLoaderOptions.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/ResourceTiming.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/ThreadableLoader.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/ThreadableLoaderClient.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/cache/CachedResource.dart';
import 'package:weblands_pong_pong/src/source/webcore/page/ContentSecurityPolicy.dart';
import 'package:weblands_pong_pong/src/source/webcore/page/SecurityOrigin.dart';
import 'package:weblands_pong_pong/src/source/webcore/platform/network/ResourceError.dart';
import 'package:weblands_pong_pong/src/source/webcore/platform/network/ResourceRequest.dart';
import 'package:weblands_pong_pong/src/source/webcore/platform/network/ResourceResponse.dart';
import 'package:weblands_pong_pong/src/source/wtf/wtf/CompletionHandler.dart';
import 'package:weblands_pong_pong/src/source/wtf/wtf/URL.dart';

enum ShouldLogError { Yes, No }

enum BlockingBehavior { LoadSynchronously, LoadAsynchronously }

abstract class DocumentThreadableLoader {
  static void loadResourceSynchronously(
      Document document, ResourceRequest request, ThreadableLoaderClient client, ThreadableLoaderOptions options,
      {SecurityOrigin securityOrigin, ContentSecurityPolicy contentSecurityPolicy}) {}

  static DocumentThreadableLoader create(Document document, ThreadableLoaderClient threadableLoaderClient, ResourceRequest resourceRequest,
      ThreadableLoaderOptions threadableLoaderOptions, String referrer,
      {SecurityOrigin securityOrigin, ContentSecurityPolicy contentSecurityPolicy, ShouldLogError shouldLogError}) {}

  void cancel();

  set defersLoading(bool defersLoading);

  void refThreadableLoader();

  void derefThreadableLoader();

  void clearResource();

  void dataSent(CachedResource cachedResource, int bytesSent, int totalBytesBeSent);

  void responseReceived(
      CachedResource cachedResource, ResourceResponse resourceResponse, CompletionHandler<void Function()> completionHandler);

  void redirectReceived(CachedResource cachedResource, ResourceRequest resourceRequest, ResourceResponse resourceResponse,
      CompletionHandler<void Function(ResourceRequest resourceRequest)> completionHandler);

  void finishedTimingForWorkerLoad(ResourceTiming resourceTiming, {CachedResource cachedResource});

  void notifyFinished(CachedResource cachedResource);

  void didReceiveResponse(int identifier, ResourceResponse resourceResponse);

  void didReceivedData(int identifier, String data, int dataLength);

  void didFinishLoading(int identifier);

  void didFail(int identifier, ResourceError resourceError);

  void makeCrossOriginRequest(ResourceRequest resourceRequest);

  void makeSimpleCrossOriginAccessRequest(ResourceRequest resourceRequest);

  void makeCrossOriginAccessRequestWithPreflight(ResourceRequest resourceRequest);

  void preflightSuccess(ResourceRequest resourceRequest);

  void preflightFailure(int identifier, ResourceError resourceError);

  void loadRequest(ResourceRequest resourceRequest, SecurityCheckPolicy securityCheckPolicy);

  bool isAllowedRedirect(URL url);

  bool isAllowedByContentSecurityPolicy(URL url, RedirectResponseReceived redirectResponseReceived);

  bool get isXMLHttpRequest;

  SecurityOrigin get securityOrigin;

  ContentSecurityPolicy get contentSecurityPolicy;

  Document get document;

  ThreadableLoaderOptions get options;

  String get referrer;

  bool get isLoading;

  void reportRedirectionWithBadScheme(URL url);

  void reportContentSecurityPolicyError(URL url);

  void reportCrossOriginResourceSharingError(URL url);

  void reportIntegrityMetadataError(URL url);

  void logErrorAndFail(ResourceError resourceError);

  bool get shouldSetHTTPHeadersToKeep;

  bool checkURLSchemeAndCROSEnabled(URL url);
}
