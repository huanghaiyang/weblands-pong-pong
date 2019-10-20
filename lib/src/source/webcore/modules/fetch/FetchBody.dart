import 'package:weblands_pong_pong/src/source/webcore/bindings/js/JSDOMPromiseDeferred.dart';
import 'package:weblands_pong_pong/src/source/webcore/dom/Exception.dart';
import 'package:weblands_pong_pong/src/source/webcore/dom/ExceptionOr.dart';
import 'package:weblands_pong_pong/src/source/webcore/modules/fetch/FetchBodyOwner.dart';
import 'package:weblands_pong_pong/src/source/webcore/modules/fetch/FetchBodySource.dart';

abstract class FetchBody {
  void arrayBuffer(FetchBodyOwner fetchBodyOwner, DeferredPromise promise);

  void blob(FetchBodyOwner fetchBodyOwner, DeferredPromise promise, String data);

  void json(FetchBodyOwner fetchBodyOwner, DeferredPromise promise);

  void text(FetchBodyOwner fetchBodyOwner, DeferredPromise promise);

  void formData(FetchBodyOwner fetchBodyOwner, DeferredPromise promise);

  void consumeAsStream(FetchBodyOwner fetchBodyOwner, FetchBodySource fetchBodySource);

  static ExceptionOr<FetchBody> extract() {}

  void loadingFailed(Exception exception);
}
