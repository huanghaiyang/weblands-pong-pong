import 'package:weblands_pong_pong/src/source/webcore/loader/DataPayloadType.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/DocumentLoader.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/FrameLoader.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/LoadTiming.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/ResourceLoaderOptions.dart';
import 'package:weblands_pong_pong/src/source/webcore/page/Frame.dart';
import 'package:weblands_pong_pong/src/source/webcore/platform/ReferrerPolicy.dart';
import 'package:weblands_pong_pong/src/source/webcore/platform/SharedBuffer.dart';
import 'package:weblands_pong_pong/src/source/webcore/platform/network/NetworkLoadMetrics.dart';
import 'package:weblands_pong_pong/src/source/webcore/platform/network/ResourceError.dart';
import 'package:weblands_pong_pong/src/source/webcore/platform/network/ResourceHandle.dart';
import 'package:weblands_pong_pong/src/source/webcore/platform/network/ResourceRequest.dart';
import 'package:weblands_pong_pong/src/source/webcore/platform/network/ResourceResponse.dart';
import 'package:weblands_pong_pong/src/source/webcore/platform/network/cocoa/ProtectionSpace.dart';
import 'package:weblands_pong_pong/src/source/webcore/platform/network/curl/AuthenticationChallenge.dart';
import 'package:weblands_pong_pong/src/source/wtf/wtf/CompletionHandler.dart';
import 'package:weblands_pong_pong/src/source/wtf/wtf/SchedulePair.dart';
import 'package:weblands_pong_pong/src/source/wtf/wtf/URL.dart';

typedef InitCallback = void Function(bool complete);

abstract class ResourceLoader {
  void cancel([ResourceError error]);

  void init(ResourceRequest request, CompletionHandler<InitCallback> handler);

  void deliverResponseAndData(ResourceResponse response, SharedBuffer buffer);

  // ios
  void startLoading();

  ResourceResponse get iOSOriginalRequest;

  FrameLoader get frameLoader;

  DocumentLoader get documentLoader;

  ResourceRequest originalRequest;

  void start();

  ResourceError get cancelledError;

  ResourceError blockedError;

  ResourceError blockedByContentBlockerError;

  ResourceError cannotShowURLError;

  set defersLoading(bool loading);

  bool get defersLoading;

  int get identifier;

  bool get wasAuthenticationChallengeBlocked;

  void releaseResources();

  ResourceResponse get response;

  SharedBuffer get resourceData;

  void clearResourceData();

  bool get isSubresourceLoader;

  void willSendRequest(ResourceRequest request, ResourceResponse response, CompletionHandler<ResourceRequestHandler> callback);

  void didSendData(int bytesSent, int totalBytesToBeSent);

  void didReceivedResponse(ResourceResponse response, CompletionHandler<void Function()> handler);

  void didReceivedData(int encodedDataLength, DataPayloadType type);

  void disReceivedBuffer(SharedBuffer buffer, int encodedLength, DataPayloadType type);

  void didFinishLoading(NetworkLoadMetrics metrics);

  void didFial(ResourceError error);

  void didBlockAuthenticationChallange();

  bool shouldUseCredentialStorage([ResourceHandle handler]);

  bool canAuthenticateAgainstProtectionSpace(ProtectionSpace space);

  void receivedCancellation(AuthenticationChallenge challenge);

  bool get isQuickLookResource;

  URL get url;

  ResourceHandle get handle;

  bool get shouldSendResourceLoadCallbacks;

  set setSendCallbackPolicy(SendCallbackPolicy policy);

  bool get shouldSniffContent;

  bool get shouldSniffContentEncoding;

  bool get isAllowedToAskUserForCredentials;

  bool get shouldIncludeCertificateInfo;

  bool get reachedTerminalState;

  ResourceRequest get request;

  set request(ResourceRequest request);

  set dataBufferingPolicy(DataBufferingPolicy policy);

  void willSwitchToSubstituteResource();

  LoadTiming get loadTiming;

  void schedule(SchedulePair pair);

  void unschedule(SchedulePair pair);

  Frame get frame;

  bool get isAlwaysOnLoggingAllowed;

  ResourceLoaderOptions get options;

  ResourceRequest get deferredRequest;

  ResourceRequest get takeDeferredRequest;

  void didFinishLoadingOnePart(NetworkLoadMetrics metrics);

  void cleanupForError(ResourceError error);

  bool get wasCancelled;

  void didReceivedDataOrBuffer(List<int> data, int length, SharedBuffer buffer, int encodedDataLength, DataPayloadType type);

  set referrerPolicy(ReferrerPolicy policy);

  ReferrerPolicy get referrerPolicy;

  void willCacheResponseAsync(
      ResourceHandle handle, NSCachedURLResponse response, CompletionHandler<void Function(NSCachedURLResponse response)> handler);

  void willSendRequestInternal(
      ResourceRequest request, ResourceResponse redirectResponse, CompletionHandler<void Function(ResourceRequest request)> handler);
}
