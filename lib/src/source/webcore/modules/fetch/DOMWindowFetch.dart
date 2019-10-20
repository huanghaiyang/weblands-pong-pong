import 'package:weblands_pong_pong/src/source/webcore/bindings/js/JSDOMPromiseDeferred.dart';
import 'package:weblands_pong_pong/src/source/webcore/modules/fetch/FetchRequest.dart';
import 'package:weblands_pong_pong/src/source/webcore/modules/fetch/FetchRequestInit.dart';
import 'package:weblands_pong_pong/src/source/webcore/page/DOMWindow.dart';

abstract class DOMWindowFetch {
  static void fetch(
      DOMWindow domWindow, FetchRequestInfo fetchRequestInfo, FetchRequestInit fetchRequestInit, DeferredPromise deferredPromise) {}
}
