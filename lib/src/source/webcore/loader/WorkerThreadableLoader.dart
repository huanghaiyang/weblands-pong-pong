import 'dart:html';

import 'package:weblands_pong_pong/src/source/webcore/loader/ThreadableLoader.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/ThreadableLoaderClient.dart';
import 'package:weblands_pong_pong/src/source/webcore/platform/network/ResourceRequest.dart';

abstract class WorkerThreadableLoader {
  static void loadResourceSynchronously(WorkerGlobalScope workerGlobalScope, ResourceRequest resourceRequest,
      ThreadableLoaderClient threadableLoaderClient, ThreadableLoaderOptions threadableLoaderOptions) {}

  static WorkerThreadableLoader create(WorkerGlobalScope workerGlobalScope, ThreadableLoaderClient threadableLoaderClient, String taskMode,
      ResourceRequest resourceRequest, ThreadableLoaderOptions threadableLoaderOptions, String referer) {}

  void cancel();

  bool get done;
}
