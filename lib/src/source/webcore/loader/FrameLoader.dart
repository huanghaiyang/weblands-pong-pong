import 'package:weblands_pong_pong/src/source/webcore/loader/FrameLoadRequest.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/FrameLoaderClient.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/HistoryController.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/MixedContentChecker.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/PolicyChecker.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/ResourceLoadNotifier.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/SubframeLoader.dart';
import 'package:weblands_pong_pong/src/source/webcore/page/Frame.dart';
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
}
