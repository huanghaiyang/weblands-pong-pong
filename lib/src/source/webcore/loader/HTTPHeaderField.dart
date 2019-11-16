import 'package:weblands_pong_pong/src/source/webcore/platform/IPC/Decoder.dart';
import 'package:weblands_pong_pong/src/source/webcore/platform/IPC/Encoder.dart';

abstract class HTTPHeaderField {
  static HTTPHeaderField create(String name, String value) {}

  String get name;

  String get value;

  void encode(Encoder encoder);

  static HTTPHeaderField decode(Decoder decoder) {}
}
