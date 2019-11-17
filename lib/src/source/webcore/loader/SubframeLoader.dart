import 'package:weblands_pong_pong/src/source/webcore/html/HTMLAppletElement.dart';
import 'package:weblands_pong_pong/src/source/webcore/html/HTMLFrameOwnerElement.dart';
import 'package:weblands_pong_pong/src/source/webcore/html/HTMLPlugInImageElement.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/FrameLoaderTypes.dart';
import 'package:weblands_pong_pong/src/source/webcore/page/Frame.dart';
import 'package:weblands_pong_pong/src/source/webcore/platform/Widget.dart';
import 'package:weblands_pong_pong/src/source/wtf/wtf/URL.dart';

abstract class SubframeLoader {
  void clear();

  bool requestFrame(HTMLFrameOwnerElement ownerElement, String url, String frameName,
      {LockHistory lockHistory = LockHistory.Yes,
      LockBackForwardList lockBackForwardList = LockBackForwardList.Yes,
      String serviceType,
      List<String> paramNames,
      List<String> paramValues});

  Widget createJavaAppletWidget(int size, HTMLAppletElement appletElement, List<String> paramNames, List<String> paramValues);

  bool get allowPlugins;

  bool get containsPlugins;

  bool resourceWillUsePlugin(String url, String mimeType);

  bool requestPlugin(HTMLPlugInImageElement htmlPluginInImageElement, URL url, String serviceType, List<String> paramNames,
      List<String> paramValues, bool useFallback);

  Frame loadOrRedirectSubframe(HTMLFrameOwnerElement htmlFrameOwnerElement, URL url, String frameName, LockHistory lockHistory,
      LockBackForwardList lockBackForwardList);

  Frame loadSubframe(HTMLFrameOwnerElement htmlFrameOwnerElement, URL url, String name, String refrerer);

  bool loadPlugin(HTMLPlugInImageElement htmlPlugInImageElement, URL url, String mimeType, List<String> paramNames,
      List<String> paramValues, bool useFallback);

  bool shouldUsePlugin(URL url, String mimeType, bool hasFallback, bool useFallback);

  bool pluginIsLoadablee(URL url, String mimeType);

  URL completeURL(String url);

  bool get shouldConvertInvalidURLsToBlank;

  Frame get frame;
}
