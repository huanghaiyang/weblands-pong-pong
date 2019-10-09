import 'package:weblands_pong_pong/src/source/webcore/loader/Loader.dart';
import 'package:weblands_pong_pong/src/source/webcore/network/Network.dart';
import 'package:weblands_pong_pong/src/source/webcore/page/Page.dart';
import 'package:weblands_pong_pong/src/source/webcore/platform/Platform.dart';

abstract class DocumentLoader {
  static DocumentLoader create(ResourceRequest request, SubstituteData data) {}

  void attachToFrame(Frame frame);

  void detachFromFrame();

  FrameLoader get frameLoader;

  SubresourceLoader get mainResourceLoader;

  SharedBuffer get mainResourceData;
}
