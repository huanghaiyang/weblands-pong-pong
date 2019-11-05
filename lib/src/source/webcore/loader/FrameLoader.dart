import 'package:weblands_pong_pong/src/source/webcore/dom/Event.dart';
import 'package:weblands_pong_pong/src/source/webcore/history/HistoryItem.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/AdClickAttribution.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/FetchOptions.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/FormState.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/FrameLoadRequest.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/FrameLoaderClient.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/FrameLoaderTypes.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/HistoryController.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/MixedContentChecker.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/PolicyChecker.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/ResourceLoadNotifier.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/ResourceLoaderOptions.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/ShouldTreatAsContinuingLoad.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/SubframeLoader.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/archive/Archive.dart';
import 'package:weblands_pong_pong/src/source/webcore/page/Frame.dart';
import 'package:weblands_pong_pong/src/source/webcore/platform/SharedBuffer.dart';
import 'package:weblands_pong_pong/src/source/webcore/platform/network/HTTPHeaderMap.dart';
import 'package:weblands_pong_pong/src/source/webcore/platform/network/ResourceError.dart';
import 'package:weblands_pong_pong/src/source/webcore/platform/network/ResourceRequest.dart';
import 'package:weblands_pong_pong/src/source/webcore/platform/network/ResourceResponse.dart';
import 'package:weblands_pong_pong/src/source/wtf/wtf/URL.dart';

abstract class FrameLoader {
  factory FrameLoader(Frame frame, FrameLoaderClient loaderClient) {}

  void init();

  void initForSynthesizedDocument(URL url);

  Frame get frame;

  PolicyChecker get policyChecker;

  HistoryController get history;

  ResourceLoadNotifier get notifier;

  SubframeLoader get subframeLoader;

  MixedContentChecker get mixedContentChecker;

  void setupForReplace();

  void loadURLIntoChildFrame(URL url, String referer, Frame frame);

  void loadFrameRequest(FrameLoadRequest frameLoadRequest, Event event, FormState formState, {AdClickAttribution adClickAttribution});

  void load(FrameLoadRequest frameLoadRequest);

  void loadArchive(Archive archive);

  int loadResourceSynchonously(ResourceRequest resourceRequest, ClientCredentialPolicy clientCredentialPolicy, FetchOptions fetchOptions,
      HTTPHeaderMap httpHeaderMap, ResourceError resourceError, ResourceResponse resourceResponse, SharedBuffer sharedBuffer);

  void changeLocation(FrameLoadRequest frameLoadRequest);

  void urlSeleted(
      URL url,
      String target,
      Event event,
      LockHistory lockHistory,
      LockBackForwardList lockBackForwardList,
      ShouldSendReferrer shouldSendReferrer,
      ShouldOpenExternalURLsPolicy shouldOpenExternalURLsPolicy,
      String downloadAttribute,
      SystemPreviewInfo systemPreviewInfo,
      AdClickAttribution adClickAttribution,
      {NewFrameOpenerPolicy newFrameOpenerPolicy});

  void submitForm(FormSubmission formSubmission);

  void reload(ReloadOption reloadOption);

  void reloadWithOverrideEncoding(String overrideEncoding);

  void open(CachedFrameBase cachedFrameBase);

  void loadItem(HistoryItem historyItem, HistoryItem formItem, FrameLoadType frameLoadType, ShouldTreatAsContinuingLoad shouldTreatAsContinuingLoad);
}
