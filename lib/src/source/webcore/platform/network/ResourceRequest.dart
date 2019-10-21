import 'package:weblands_pong_pong/src/source/wtf/wtf/URL.dart';

abstract class ResourceRequest {
  URL get url;

  factory ResourceRequest(URL url) => _ResourceRequest(url);
}

class _ResourceRequest implements ResourceRequest {
  URL url_;

  _ResourceRequest(this.url_);

  @override
  URL get url {
    return url_;
  }
}
