import 'package:weblands_pong_pong/src/source/webcore/dom/ScriptExecutionContext.dart';
import 'package:weblands_pong_pong/src/source/webcore/fileapi/Blob.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/ThreadableLoader.dart';
import 'package:weblands_pong_pong/src/source/webcore/modules/fetch/FetchBodyConsumer.dart';
import 'package:weblands_pong_pong/src/source/webcore/modules/fetch/FetchLoaderClient.dart';
import 'package:weblands_pong_pong/src/source/webcore/modules/fetch/FetchRequest.dart';
import 'package:weblands_pong_pong/src/source/webcore/platform/SharedBuffer.dart';
import 'package:weblands_pong_pong/src/source/webcore/platform/network/ResourceError.dart';
import 'package:weblands_pong_pong/src/source/webcore/platform/network/ResourceResponse.dart';
import 'package:weblands_pong_pong/src/source/wtf/wtf/URL.dart';

abstract class FetchLoader {
  factory FetchLoader(FetchLoaderClient fetchLoaderClient, FetchBodyConsumer fetchBodyConsumer) =>
      _FetchLoader(fetchLoaderClient, fetchBodyConsumer);

  SharedBuffer startStreaming();

  void start(ScriptExecutionContext scriptExecutionContext, {FetchRequest fetchRequest, Blob blob});

  void startLoadingBlobURL(ScriptExecutionContext scriptExecutionContext, URL blobURL);

  void stop();

  bool get isStarted;
}

class _FetchLoader implements FetchLoader {
  bool isStarted_ = false;

  FetchLoaderClient fetchLoaderClient_;

  FetchBodyConsumer fetchBodyConsumer_;

  ThreadableLoader threadableLoader_;

  URL urlForReading_;

  _FetchLoader(this.fetchLoaderClient_, this.fetchBodyConsumer_);

  void start(ScriptExecutionContext scriptExecutionContext, {FetchRequest fetchRequest, Blob blob}) {
    startLoadingBlobURL(scriptExecutionContext, blob.url());
  }

  void startLoadingBlobURL(ScriptExecutionContext scriptExecutionContext, URL blobURL) {}

  void stop() {}

  void didReceiveResponse(int length, ResourceResponse resourceResponse) {}

  void didReceiveData(List<int> data) {}

  void didFinishLoading(int length) {}

  void didFail(ResourceError resourceError) {}

  @override
  bool get isStarted => isStarted_;

  @override
  SharedBuffer startStreaming() {
    return null;
  }
}
