import 'package:weblands_pong_pong/src/source/webcore/loader/HeaderFieldTokenizer.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/ServerTiming.dart';

List<ServerTiming> parseServerTiming(String headValue) {
  List<ServerTiming> entries = List();
  if (headValue.isEmpty) {
    return entries;
  }
  HeaderFieldTokenizer tokenizer = HeaderFieldTokenizer(headValue);
  while (!tokenizer.isConsumed()) {
    String name = tokenizer.consumeToken();
    if (name.isEmpty) {
      break;
    }
    ServerTiming entry = ServerTiming(name);
    while (tokenizer.consume(';')) {
      String parameterName = tokenizer.consumeToken();
      if (parameterName.isEmpty) {
        break;
      }
      String value = '';
      if (tokenizer.consume('=')) {
        value = tokenizer.consumeTokenOrQuotedString();
        tokenizer.consumeBeforeAnyCharMatch([',', ';']);
      }
      entry.setParameter(parameterName, value);
    }
    entries.add(entry);
    if (!tokenizer.consume(',')) {
      break;
    }
  }
  return entries;
}
