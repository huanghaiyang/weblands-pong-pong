import 'package:weblands_pong_pong/src/source/webcore/loader/archive/ArchiveResource.dart';

abstract class Archive {
  bool get shouldLoadFromArchiveOnly;

  bool get shouldOverrideBaseURL;

  bool get shouldUseMainResourceEncoding;

  bool get shouldUseMainResourceURL;

  ArchiveResource get mainResource;

  List<ArchiveResource> get subresources;

  List<Archive> get subframeArchives;

  set mainResource(ArchiveResource archiveResource);

  void addSubresource(ArchiveResource archiveResource);

  void addSubframeArchive(Archive archive);

  void clearAllSubframeArchives({Set<Archive> archives});
}
