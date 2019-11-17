import 'package:weblands_pong_pong/src/source/webcore/dom/ScriptExecutionContext.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/FetchOptions.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/ResourceLoaderOptions.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/ThreadableLoaderClient.dart';
import 'package:weblands_pong_pong/src/source/webcore/platform/network/ResourceError.dart';
import 'package:weblands_pong_pong/src/source/webcore/platform/network/ResourceRequest.dart';

abstract class ThreadableLoader {
  static void loadResourceSynchronously(ScriptExecutionContext scriptExecutionContext, ResourceRequest resourceRequest,
      ThreadableLoaderClient threadableLoaderClient, ThreadableLoaderOptions threadableLoaderOptions) {}

  static ThreadableLoader create(ScriptExecutionContext scriptExecutionContext, ThreadableLoaderClient threadableLoaderClient,
      ResourceRequest resourceRequest, ThreadableLoaderOptions threadableLoaderOptions, String referrer) {}

  void cancel();

  void ref();

  void deref();

  static void logError(ScriptExecutionContext scriptExecutionContext, ResourceError resourceError, String msg) {}
}

abstract class ThreadableLoaderOptions {
  factory ThreadableLoaderOptions(FetchOptions fetchOptions, ResourceLoaderOptions resourceLoaderOptions,
      ContentSecurityPolicyEnforcement contentSecurityPolicyEnforcement, String initiator, ResponseFilteringPolicy res) {}

  ContentSecurityPolicyEnforcement get contentSecurityPolicyEnforcement;

  String get initiator;

  ResponseFilteringPolicy get filteringPolicy;
}

enum ContentSecurityPolicyEnforcement { DoNotEnforce, EnforceChildSrcDirective, EnforceConnectSrcDirective, EnforceScriptSrcDirective }

enum ResponseFilteringPolicy { Enable, Disable }
