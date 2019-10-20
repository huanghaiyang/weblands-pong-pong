import 'package:weblands_pong_pong/src/source/webcore/dom/Exception.dart';

abstract class ExceptionOr<T> {
  factory ExceptionOr() {}

  bool get hasException;

  Exception get exception;

  Exception releaseException();
}
