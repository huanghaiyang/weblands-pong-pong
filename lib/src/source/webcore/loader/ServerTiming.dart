abstract class ServerTiming {
  String get name;

  num get duration;

  String get description;

  bool get durationSet;

  bool get descriptionSet;

  void setParameter(String name, String value);

  ServerTiming get isolatedCopy;

  factory ServerTiming(String name, {num duration, String description, bool durationSet, bool descriptionSet}) =>
      _ServerTiming(name, duration_: duration, durationSet_: durationSet, descriptionSet_: descriptionSet, description_: description);
}

class _ServerTiming implements ServerTiming {
  String name_;
  num duration_;
  String description_;
  bool durationSet_;
  bool descriptionSet_;
  ServerTiming isolateCopy_;

  _ServerTiming(this.name_, {this.duration_, this.description_, this.durationSet_, this.descriptionSet_});

  @override
  String get name {}

  @override
  ServerTiming get isolatedCopy {}

  @override
  void setParameter(String name, String value) {}

  @override
  bool get descriptionSet {}

  @override
  bool get durationSet {}

  @override
  String get description {}

  @override
  num get duration {}
}
