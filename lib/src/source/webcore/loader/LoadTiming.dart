import 'package:weblands_pong_pong/src/source/wtf/wtf/MonotonicTime.dart';
import 'package:weblands_pong_pong/src/source/wtf/wtf/Seconds.dart';
import 'package:weblands_pong_pong/src/source/wtf/wtf/URL.dart';
import 'package:weblands_pong_pong/src/source/wtf/wtf/WallTime.dart';

abstract class LoadTiming {
  Seconds secondsSinceStartTime(MonotonicTime monotonicTime);

  WallTime monotonicTimeToPseudoWallTime(MonotonicTime monotonicTime);

  void markStartTime();

  void addRedirect(URL redirectUrl, URL redirectedUrl);

  void markStartTimeAndFetchStart();

  void markUnloadEventStart();

  void markUnloadEventEnd();

  void markRedirectStart();

  void markRedirectEnd();

  void markFetchStart();

  void markResponseEnd();

  void markLoadEventStart();

  void markLoadEventEnd();

  set hasSameOriginAsPreviousDocument(bool hasSameOriginAsPreviousDocument);

  MonotonicTime get startTime;

  MonotonicTime get unloadEventStart;

  MonotonicTime get unloadEventEnd;

  MonotonicTime get redirectStart;

  MonotonicTime get redirectEnd;

  MonotonicTime get fetchStart;

  MonotonicTime get responseEnd;

  MonotonicTime get loadEventStart;

  MonotonicTime get loadEventEnd;

  int get redirectCount;

  bool get hasCrossOriginRedirect;

  bool get hasSameOriginAsPreviousDocument;

  MonotonicTime get referenceMonotonicTime;

  WallTime get referenceWallTime;

  LoadTiming get isolatedCopy;
}
