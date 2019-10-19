import 'package:weblands_pong_pong/src/source/webcore/dom/ScriptExecutionContext.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/TextResourceDecoder.dart';
import 'package:weblands_pong_pong/src/source/webcore/modules/applicationmanifest/ApplicationManifest.dart';
import 'package:weblands_pong_pong/src/source/webcore/platform/SharedBuffer.dart';
import 'package:weblands_pong_pong/src/source/wtf/wtf/URL.dart';

abstract class CacheApplicationManifest {
  ApplicationManifest process(URL manifestURL, URL documentURL, ScriptExecutionContext scriptExecutionContext);

  void finishLoading(SharedBuffer sharedBuffer);

  TextResourceDecoder get textResourceDecoder;

  set encoding(String encoding);

  String get encoding;
}
