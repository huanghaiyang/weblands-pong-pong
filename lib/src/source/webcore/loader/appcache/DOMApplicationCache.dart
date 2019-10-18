import 'package:weblands_pong_pong/src/source/webcore/EventTarget.dart';
import 'package:weblands_pong_pong/src/source/webcore/dom/ScriptExecutionContext.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/appcache/ApplicationCacheHost.dart';
import 'package:weblands_pong_pong/src/source/webcore/page/DOMWindow.dart';

abstract class DOMApplicationCache {
  factory DOMApplicationCache.create(DOMWindow domWindow) {}

  int get status;

  void udpate();

  void swapCache();

  void abort();

  void refEventTarget();

  void derefEventTarget();

  EventTargetInterface get eventTargetInterface;

  ScriptExecutionContext get scriptExecutionContext;

  ApplicationCacheHost get applicationCacheHost;
}
