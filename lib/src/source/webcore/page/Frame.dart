import 'package:weblands_pong_pong/src/source/webcore/html/HTMLFrameOwnerElement.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/SubresourceLoader.dart';

abstract class Frame {
  HTMLFrameOwnerElement get ownerElement;

  SubresourceLoader get loader;
}
