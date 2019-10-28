import 'package:collection/collection.dart';

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
  String get name {
    return name_;
  }

  @override
  ServerTiming get isolatedCopy {
    return ServerTiming(name_, duration: duration_, description: description_, durationSet: durationSet_, descriptionSet: descriptionSet_);
  }

  @override
  void setParameter(String name, String value) {
    if (equalsIgnoreAsciiCase(name, 'dur')) {
      if (!durationSet) {
        duration_ = double.parse(value);
        durationSet_ = true;
      }
      return;
    }
    if (equalsIgnoreAsciiCase(name, 'desc')) {
      if (!descriptionSet) {
        description_ = value;
        descriptionSet_ = true;
      }
      return;
    }
  }

  @override
  bool get descriptionSet {
    return descriptionSet_;
  }

  @override
  bool get durationSet {
    return durationSet_;
  }

  @override
  String get description {
    return description_;
  }

  @override
  num get duration {
    return duration_;
  }
}
