import 'package:weblands_pong_pong/src/source/webcore/dom/Document.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/TextResourceDecoder.dart';
import 'package:weblands_pong_pong/src/source/webcore/page/Frame.dart';
import 'package:weblands_pong_pong/src/source/wtf/wtf/URL.dart';

abstract class DocumentWriter {
  void replaceDocumentWithResultOfExecutingJavascriptURL(String javascriptURL, Document ownerDocument);

  bool begin([URL url, bool dispatchWindowObjectAvailable = false, Document ownerDocument]);

  void addDataSynchronously(List<int> data);

  void end();

  void setFrame(Frame frame);

  void setEncoding(String encoding, bool userChosen);

  String get mimeType;

  set mimeType(String mimeType);

  TextResourceDecoder get decoder;

  void reportDataReceived();

  void setDocumentWasLoadedAsPartOfNavigation();
}
