abstract class ServerTiming {
  String get name;

  num get duration;

  String get description;

  bool get durationSet;

  bool get descriptionSet;

  void setParameter(String name, String value);

  ServerTiming get isolatedCopy;
}
