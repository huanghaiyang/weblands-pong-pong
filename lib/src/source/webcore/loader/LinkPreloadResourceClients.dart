import 'package:weblands_pong_pong/src/source/webcore/loader/cache/CachedResource.dart';

abstract class LinkPreloadResourceClients {
  void triggerEvents(CachedResource cachedResource);

  void clear();
}
