import 'package:weblands_pong_pong/src/source/webcore/loader/FetchOptions.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/FrameLoader.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/HTTPHeaderField.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/ResourceLoader.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/ResourceLoaderOptions.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/SubresourceLoader.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/cache/CachedResource.dart';
import 'package:weblands_pong_pong/src/source/webcore/page/Frame.dart';
import 'package:weblands_pong_pong/src/source/webcore/page/Page.dart';
import 'package:weblands_pong_pong/src/source/webcore/platform/network/HTTPHeaderMap.dart';
import 'package:weblands_pong_pong/src/source/webcore/platform/network/NetworkLoadInfomation.dart';
import 'package:weblands_pong_pong/src/source/webcore/platform/network/NetworkLoadMetrics.dart';
import 'package:weblands_pong_pong/src/source/webcore/platform/network/ResourceError.dart';
import 'package:weblands_pong_pong/src/source/webcore/platform/network/ResourceLoadPriority.dart';
import 'package:weblands_pong_pong/src/source/webcore/platform/network/ResourceRequest.dart';
import 'package:weblands_pong_pong/src/source/webcore/platform/network/ResourceResponse.dart';
import 'package:weblands_pong_pong/src/source/webcore/platform/network/StoredCredentialsPolicy.dart';
import 'package:weblands_pong_pong/src/source/wtf/wtf/CompletionHandler.dart';
import 'package:weblands_pong_pong/src/source/wtf/wtf/URL.dart';

abstract class LoaderStrategy {
  void loadResource(Frame frame, CachedResource cachedResource, ResourceRequest resourceRequest,
      ResourceLoaderOptions resourceLoaderOptions, CompletionHandler<void Function(SubresourceLoader subresourceLoader)> completionHandler);

  void loadResourceSynchronously(
      FrameLoader frameLoader,
      int identifier,
      ResourceRequest resourceRequest,
      ClientCredentialPolicy clientCredentialPolicy,
      FetchOptions fetchOptions,
      HTTPHeaderField httpHeaderField,
      ResourceError res,
      ResourceResponse resourceResponse,
      List<int> data);

  void pageLoadComplete(Page page);

  void remove(ResourceLoader resourceLoader);

  set defersLoading(bool defersLoading);

  void crossOriginRedirectReceived(ResourceLoader resourceLoader, URL redirectURL);

  void servePendingRequests({ResourceLoadPriority minimumPriority = ResourceLoadPriority.VeryLow});

  void suspendPendingRequests();

  void resumePendingRequests();

  bool get usePingLoad;

  void startPingLoad(
      Frame frame,
      ResourceRequest resourceRequest,
      HTTPHeaderMap originalRequestHeaders,
      FetchOptions fetchOptions,
      ContentSecurityPolicyImposition contentSecurityPolicyImposition,
      void Function(ResourceError resourceError, ResourceResponse resourceResponse));

  void preconnectTo(
      FrameLoader frameLoader, URL url, StoredCredentialsPolicy storedCredentialsPolicy, void Function(ResourceError resourceError));

  set captureExtraNetworkLoadMetricsEnabled(bool captureExtraNetworkLoadMetricsEnabled);

  bool get isOnLine;

  bool get shouldPerformSecurityChecks;

  void havePerformedSecurityChecks(ResourceResponse resourceResponse);

  ResourceResponse responseFromResourceLoadIdentifier(int resourceLoadIdentifier);

  List<NetworkTransactionInformation> intermediateLoadInformationFromResourceLoadIdentifier(int resourceLoadIdentifier);

  NetworkLoadMetrics networkMetricsFromResourceLoadIdentifier(int resourceIdentifier);

  List<int> ongoingLoads();
}
