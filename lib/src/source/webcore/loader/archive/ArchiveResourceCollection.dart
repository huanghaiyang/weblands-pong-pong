import 'package:weblands_pong_pong/src/source/webcore/loader/archive/Archive.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/archive/ArchiveResource.dart';
import 'package:weblands_pong_pong/src/source/wtf/wtf/URL.dart';

abstract class ArchiveResourceCollection {
  void addResource(ArchiveResource archiveResource);

  void addAllResources(Archive archive);

  ArchiveResource archiveResourceForURL(URL url);

  Archive popSubframeArchive(String frameName, URL url);
}
