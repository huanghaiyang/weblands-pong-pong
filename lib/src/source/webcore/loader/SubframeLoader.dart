import 'package:weblands_pong_pong/src/source/webcore/html/HTMLAppletElement.dart';
import 'package:weblands_pong_pong/src/source/webcore/html/HTMLFrameOwnerElement.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/FrameLoaderTypes.dart';

abstract class SubframeLoader {
  void clear();

  bool requestFrame(HTMLFrameOwnerElement ownerElement, String url, String frameName,
      {LockHistory lockHistory = LockHistory.Yes,
      LockBackForwardList lockBackForwardList = LockBackForwardList.Yes,
      String serviceType,
      List<String> paramNames,
      List<String> paramValues});

  Widget createJavaAppletWidget(int size, HTMLAppletElement appletElement, List<String> paramNames, List<String> paramValues);
}
