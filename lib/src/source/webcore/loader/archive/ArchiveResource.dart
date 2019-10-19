import 'package:weblands_pong_pong/src/source/webcore/platform/SharedBuffer.dart';
import 'package:weblands_pong_pong/src/source/webcore/platform/network/ResourceResponse.dart';
import 'package:weblands_pong_pong/src/source/wtf/wtf/URL.dart';

abstract class ArchiveResource {
  factory ArchiveResource.create(SharedBuffer sharedBuffer, URL url, ResourceResponse resourceResponse,
      {String mimeType, String textEncoding, String frameName}) {}

  String get mimeType;

  String get textEncoding;

  String get frameName;

  void ignoreWhenUnarchiving();

  void get shouldIgnoreWhenUnarchiving;
}
