import 'package:weblands_pong_pong/src/source/javaScriptCore/heap/Strong.dart';
import 'package:weblands_pong_pong/src/source/javaScriptCore/inspector/CallFrameSlot.dart';
import 'package:weblands_pong_pong/src/source/javaScriptCore/runtime/JSCJSValue.dart';
import 'package:weblands_pong_pong/src/source/javaScriptCore/runtime/JSObject.dart';
import 'package:weblands_pong_pong/src/source/javaScriptCore/runtime/RuntimeFlags.dart';
import 'package:weblands_pong_pong/src/source/webcore/EventTarget.dart';
import 'package:weblands_pong_pong/src/source/webcore/dom/ScriptExecutionContext.dart';
import 'package:weblands_pong_pong/src/source/webcore/platform/network/ResourceResponse.dart';

abstract class WorkerOptions {
  String get name;
}

abstract class Worker {
  static Worker create(ScriptExecutionContext context, RuntimeFlags flags, String url, WorkerOptions options) {}

  void postMessage(ExecState state, JSValue value, List<Strong<JSObject>> objects);

  void terminate();

  bool get hasPendingActivity;

  String get identifier;

  ScriptExecutionContext get scriptExecutionContext;

  EventTargetInterface get eventTargetInterface;

  void notifyNetworkStateChange(bool isOnline);

  void didReceiveResponse(int identifier, ResourceResponse response);

  void notifyFinished();

  bool get canSuspendForDocumentSuspension;

  void stop();

  String get activeDOMObjectNames;

  static void networkStateChanged(bool isOnline) {}
}
