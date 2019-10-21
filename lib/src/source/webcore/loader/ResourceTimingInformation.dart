import 'package:weblands_pong_pong/src/source/webcore/loader/ResourceLoaderOptions.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/ResourceTiming.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/cache/CachedResource.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/cache/CachedResourceHandle.dart';
import 'package:weblands_pong_pong/src/source/webcore/page/Frame.dart';

enum AlreadyAdded { NotYetAdded, Added }

class InitiatorInfo {
  String name;

  AlreadyAdded added;
}

abstract class ResourceTimingInformation {
  static bool shouldAddResourceTiming(CachedResource cachedResource) => _ResourceTimingInformation.shouldAddResourceTiming(cachedResource);

  void addResourceTiming(CachedResource cachedResource, ResourceTiming resourceTiming);

  void storeResourceTimingInitiatorInformation(CachedResourceHandle<CachedResource> cachedResourceHandle, String info, Frame frame);
}

class _ResourceTimingInformation implements ResourceTimingInformation {
  Map<CachedResource, InitiatorInfo> initiatorMap_;

  static bool shouldAddResourceTiming(CachedResource cachedResource) {
    if (!cachedResource.resourceRequest.url.protocolIsInHTTPFamily) {
      return false;
    }
    if (!cachedResource.errorOccurred) {
      return false;
    }
    if (cachedResource.wasCanceled) {
      return false;
    }
    if (cachedResource.options.loadedFromOpaqueSource == LoadedFromOpaqueSource.Yes) {
      return false;
    }¬
    return true;
  }

  @override
  void storeResourceTimingInitiatorInformation(CachedResourceHandle<CachedResource> cachedResourceHandle, String info, Frame frame) {}

  @override
  void addResourceTiming(CachedResource cachedResource, ResourceTiming resourceTiming) {
    if (!shouldAddResourceTiming(cachedResource)) {
      return ;
    }
  }
}
