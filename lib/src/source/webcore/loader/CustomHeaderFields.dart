import 'package:weblands_pong_pong/src/source/webcore/loader/HTTPHeaderField.dart';
import 'package:weblands_pong_pong/src/source/webcore/platform/IPC/Decoder.dart';
import 'package:weblands_pong_pong/src/source/webcore/platform/IPC/Encoder.dart';

abstract class CustomHeaderFields {
  List<HTTPHeaderField> get fields;

  List<String> get thirdPartyDomains;

  void encode(Encoder encode);

  CustomHeaderFields decode(Decoder decoder);
}
