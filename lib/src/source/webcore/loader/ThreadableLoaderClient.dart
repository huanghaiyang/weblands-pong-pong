import 'package:weblands_pong_pong/src/source/webcore/loader/ResourceTiming.dart';
import 'package:weblands_pong_pong/src/source/webcore/platform/network/ResourceError.dart';
import 'package:weblands_pong_pong/src/source/webcore/platform/network/ResourceResponse.dart';

abstract class ThreadableLoaderClient {
  void didSendData(int bytesSent, int totalBytesToBeSent);

  void didReceiveResponse(int identifier, ResourceResponse resourceResponse);

  void didReceiveData(List<int> data, int dataLength);

  void didFinishLoading(int identifier);

  void didFail(ResourceError resourceError);

  void didFinishTiming(ResourceTiming resourceTiming);
}
