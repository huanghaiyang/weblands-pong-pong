import 'package:weblands_pong_pong/src/source/webcore/loader/LoadTiming.dart';
import 'package:weblands_pong_pong/src/source/webcore/page/PerformanceServerTiming.dart';
import 'package:weblands_pong_pong/src/source/webcore/platform/network/NetworkLoadMetrics.dart';
import 'package:weblands_pong_pong/src/source/wtf/wtf/URL.dart';

abstract class ResourceTiming {
  URL get url;

  String get initiator;

  LoadTiming get loadTiming;

  NetworkLoadMetrics get networkLoadMetrics;

  bool get allowTimingDetails;

  List<PerformanceServerTiming> get populateServerTiming;

  ResourceTiming get isolatedCopy;

  void overrideInitiatorName(String name);
}
