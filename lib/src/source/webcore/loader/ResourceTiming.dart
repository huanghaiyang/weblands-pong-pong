import 'package:weblands_pong_pong/src/source/webcore/loader/LoadTiming.dart';
import 'package:weblands_pong_pong/src/source/webcore/page/PerformanceServerTiming.dart';
import 'package:weblands_pong_pong/src/source/webcore/page/SecurityOrigin.dart';
import 'package:weblands_pong_pong/src/source/webcore/platform/network/NetworkLoadMetrics.dart';
import 'package:weblands_pong_pong/src/source/webcore/platform/network/ResourceResponse.dart';
import 'package:weblands_pong_pong/src/source/wtf/wtf/URL.dart';

abstract class ResourceTiming {
  static ResourceTiming fromCache(
          URL url, String initiator, LoadTiming loadTiming, ResourceResponse resourceResponse, SecurityOrigin securityOrigin) =>
      _ResourceTiming.fromCache(url, initiator, loadTiming, resourceResponse, securityOrigin);

  URL get url;

  String get initiator;

  LoadTiming get loadTiming;

  NetworkLoadMetrics get networkLoadMetrics;

  bool get allowTimingDetails;

  List<PerformanceServerTiming> get populateServerTiming;

  ResourceTiming get isolatedCopy;

  void overrideInitiatorName(String name);
}

class _ResourceTiming implements ResourceTiming {
  static ResourceTiming fromCache(
      URL url, String initiator, LoadTiming loadTiming, ResourceResponse resourceResponse, SecurityOrigin securityOrigin) {
  }

  @override
  void overrideInitiatorName(String name) {}

  @override
  ResourceTiming get isolatedCopy {}

  @override
  List<PerformanceServerTiming> get populateServerTiming {}

  @override
  bool get allowTimingDetails {}

  @override
  NetworkLoadMetrics get networkLoadMetrics {}

  @override
  LoadTiming get loadTiming {}

  @override
  String get initiator {}

  @override
  URL get url {}
}
