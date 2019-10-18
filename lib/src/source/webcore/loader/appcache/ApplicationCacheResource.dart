import 'package:weblands_pong_pong/src/source/webcore/loader/ResourceLoader.dart';
import 'package:weblands_pong_pong/src/source/webcore/platform/SharedBuffer.dart';
import 'package:weblands_pong_pong/src/source/webcore/platform/network/ResourceResponse.dart';
import 'package:weblands_pong_pong/src/source/wtf/wtf/URL.dart';

enum type { Master, Manifest, Explicit, Foreign, Fallback }

abstract class ApplicationCacheResource {
  factory ApplicationCacheResource.create(URL url, ResourceResponse resourceResponse, int type, SharedBuffer sharedBuffer, String path) {}

  int get type;

  void addType(int type);

  set storageID(int storageID);

  int get storageID;

  void clearStorageID();

  int estimatedSizeInStorage();

  String get path;

  set path(String path);

  static void dumpType() {}

  void deliver(ResourceLoader resourceLoader);
}
