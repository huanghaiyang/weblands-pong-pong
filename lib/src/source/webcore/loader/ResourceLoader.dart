import 'package:weblands_pong_pong/src/source/webcore/loader/DataPayloadType.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/DocumentLoader.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/FrameLoader.dart';
import 'package:weblands_pong_pong/src/source/webcore/platform/SharedBuffer.dart';
import 'package:weblands_pong_pong/src/source/webcore/platform/network/ResourceError.dart';
import 'package:weblands_pong_pong/src/source/webcore/platform/network/ResourceRequest.dart';
import 'package:weblands_pong_pong/src/source/webcore/platform/network/ResourceResponse.dart';
import 'package:weblands_pong_pong/src/source/wtf/wtf/CompletionHandler.dart';

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
}
