import 'package:weblands_pong_pong/src/source/webcore/loader/DocumentWriter.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/FrameLoader.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/ResourceLoader.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/SubresourceLoader.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/SubstituteData.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/archive/Archive.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/archive/ArchiveResource.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/cache/CachedResourceLoader.dart';
import 'package:weblands_pong_pong/src/source/webcore/page/Frame.dart';
import 'package:weblands_pong_pong/src/source/webcore/platform/SharedBuffer.dart';
import 'package:weblands_pong_pong/src/source/webcore/platform/network/ResourceError.dart';
import 'package:weblands_pong_pong/src/source/webcore/platform/network/ResourceRequest.dart';
import 'package:weblands_pong_pong/src/source/webcore/platform/network/ResourceResponse.dart';
import 'package:weblands_pong_pong/src/source/webcore/platform/text/StringWithDirection.dart';
import 'package:weblands_pong_pong/src/source/wtf/wtf/SchedulePair.dart';
import 'package:weblands_pong_pong/src/source/wtf/wtf/URL.dart';

abstract class DocumentLoader {
  static DocumentLoader create(ResourceRequest request, SubstituteData data) {}

  void attachToFrame(Frame frame);

  void detachFromFrame();

  FrameLoader get frameLoader;

  SubresourceLoader get mainResourceLoader;

  SharedBuffer get mainResourceData;

  DocumentWriter get writer;

  ResourceRequest get originalRequest;

  ResourceRequest get originalRequestCopy;

  CachedResourceLoader get cachedResourceLoader;

  SubstituteData get substituteData;

  String get responseMIMEType;

  URL get url;

  URL get unreachableURL;

  URL get originalURL;

  URL get responseURL;

  // ios
  set responseMIMEType(String type);

  String get currentContentType;

  void replaceRequestURLForSameDocumentNavigation(URL url);

  bool get isStopping;

  void stopLoading();

  bool get isCommitted;

  set isCommitted(bool isCommitted);

  bool get isLoading;

  ResourceError get mainDocumentError;

  ResourceResponse get response;

  set response(ResourceResponse response);

  bool get isClientRedirect;

  set isClientRedirect(bool isClientRedirect);

  void dispatchOnloadEvents();

  bool get isOnloadDispatched;

  bool get isLoadingInApiSense;

  set title(StringWithDirection title);

  String get overrideEncoding;

  //cocoa
  void schedule(SchedulePair pair);

  //cocoa
  void unschedule(SchedulePair pair);

  set archive(Archive archive);

  void addAllArchiveResources(Archive archive);

  void addArchiveResource(Archive archive);

  Archive popArchiveForSubFrame(String frame, URL url);

  SharedBuffer parseArchiveData();

  bool scheduleArchiveLoad(ResourceLoader loader, ResourceRequest request);

  void scheduleSubstituteResourceLoad(SubresourceLoader loader, ResourceRequest request);

  void scheduleCannotShowURLError(ResourceLoader loader);

  ArchiveResource archiveResourceForURL(URL url);
}
