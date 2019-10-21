class HeaderFieldTokenizer {
  HeaderFieldTokenizer(this.input);

  String input;

  int index;

  bool isConsumed() {
    return index >= input.length;
  }

  String consumeToken() {}

  String consumeTokenOrQuotedString() {}

  bool consume(String char) {}

  void consumeBeforeAnyCharMatch(List<String> chars) {}
}
