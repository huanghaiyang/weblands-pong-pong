import 'package:weblands_pong_pong/src/source/webcore/page/DOMWindow.dart';
import 'package:weblands_pong_pong/src/source/webcore/page/Frame.dart';

abstract class Document {
  Frame get frame;

  Document get parentDocument;

  DOMWindow get domWindow;
}
