import 'package:weblands_pong_pong/src/source/webcore/loader/DocumentLoader.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/SubstituteData.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/cache/CachedRawResource.dart';
import 'package:weblands_pong_pong/src/source/webcore/platform/network/ResourceError.dart';
import 'package:weblands_pong_pong/src/source/webcore/platform/network/ResourceRequest.dart';
import 'package:weblands_pong_pong/src/source/webcore/platform/network/ResourceResponse.dart';

abstract class ContentFilter {
  void startFilteringMainResource(CachedRawResource resource);

  void stopFilteringMainResource();

  bool continueAfterWillSendRequest(ResourceRequest request, ResourceResponse response);

  bool continueAfterResponseReceived(ResourceResponse response);

  bool continueAfterDataReceived(String data, int length);

  bool continueAfterNotifyFinished(CachedRawResource resource);

  bool continueAfterSubstituteDataRequest(DocumentLoader loader, SubstituteData data);

  bool willHandleProvisionalLoadFailure(ResourceError error);

  void handleProvisionalLoadFailure(ResourceError error);
}
