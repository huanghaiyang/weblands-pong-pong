import 'package:weblands_pong_pong/src/source/webcore/loader/cache/CachedResource.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/cache/CachedResourceLoader.dart';
import 'package:weblands_pong_pong/src/source/webcore/platform/network/ResourceError.dart';
import 'package:weblands_pong_pong/src/source/webcore/platform/network/ResourceRequest.dart';
import 'package:weblands_pong_pong/src/source/webcore/platform/network/ResourceResponse.dart';
import 'package:weblands_pong_pong/src/source/wtf/wtf/CompletionHandler.dart';

enum Error { Abort, NetworkError, CannotCreateResource, NotFound, NotOK, RedirectForbidden }

abstract class ApplicationCacheResourceLoader {
  factory ApplicationCacheResourceLoader.create(int type, CachedResourceLoader cachedResourceLoader, ResourceRequest resourceRequest,
      CompletionHandler<void Function(ResourceError resourceError)> completionHandler) {}

  void cancel(Error error);

  CachedResource get resource;

  bool get hasRedirection;

  int get type;

  void responseReceived(
      CachedResource cachedResource, ResourceResponse resourceResponse, CompletionHandler<void Function()> completionHandler);

  void dataReceived(CachedResource cachedResource, List<int> data, int dataLength);

  void redirectReceived(CachedResource cachedResource, ResourceRequest resourceRequest, ResourceResponse resourceResponse,
      CompletionHandler<void Function(ResourceRequest resourceRequest)> completionHandler);

  void notifyFinished(CachedResource cachedResource);
}
