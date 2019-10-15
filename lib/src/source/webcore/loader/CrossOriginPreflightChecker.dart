import 'package:weblands_pong_pong/src/source/webcore/loader/DocumentThreadableLoader.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/cache/CachedResource.dart';
import 'package:weblands_pong_pong/src/source/webcore/platform/network/ResourceRequest.dart';
import 'package:weblands_pong_pong/src/source/webcore/platform/network/ResourceResponse.dart';
import 'package:weblands_pong_pong/src/source/wtf/wtf/CompletionHandler.dart';

abstract class CrossOriginPreflightChecker {
  static void doPreflight(DocumentThreadableLoader loader, ResourceRequest request) {}

  void startPreflight();

  set defersLoading(bool defersLoading);

  void notifyFinished(CachedResource resource);

  void redirectReceived(CachedResource resource, ResourceRequest request, ResourceResponse response,
      CompletionHandler<void Function(ResourceRequest request)> completionHandler);

  bool get isXMLHttpRequest;
}
