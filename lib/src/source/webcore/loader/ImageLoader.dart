import 'package:weblands_pong_pong/src/source/webcore/bindings/js/JSDOMPromiseDeferred.dart';
import 'package:weblands_pong_pong/src/source/webcore/dom/Element.dart';
import 'package:weblands_pong_pong/src/source/webcore/dom/EventSender.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/cache/CachedImage.dart';

abstract class ImageLoader {
  void updateFromElement();

  void updateFromElementIgnoringPreviousError();

  void elementDidMoveToNewDocument();

  Element get element;

  bool get imageComplete;

  CachedImage get image;

  void clearImage();

  int get pendingDecodePromisesCountForTesting;

  void decode(DeferredPromise deferredPromise);

  set setLoadManually(bool loadManually);

  bool get hasPendingBeforeLoadEvent;

  bool get pendingActivity;

  void dispatchPendingEvent(EventSender<ImageLoader> imageEventSender);

  static void dispatchPendingBeforeLoadEvents() {}

  static void dispatchPendingLoadEvents() {}

  static void dispatchPendingErrorEvents() {}
}
