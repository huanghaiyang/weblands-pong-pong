import 'package:weblands_pong_pong/src/source/webcore/loader/appcache/ApplicationCache.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/appcache/ApplicationCacheGroup.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/appcache/ApplicationCacheResource.dart';
import 'package:weblands_pong_pong/src/source/webcore/page/SecurityOrigin.dart';
import 'package:weblands_pong_pong/src/source/webcore/platform/SharedBuffer.dart';
import 'package:weblands_pong_pong/src/source/wtf/wtf/URL.dart';

enum FailureReason { OriginQuotaReached, TotalQuotaReached, DiskOrOperationFailure }

class StorageIDJournal<T> {}

abstract class ApplicationCacheStorage {
  factory ApplicationCacheStorage.create(String cacheDirectory, String flatFileSubdirectoryName) {}

  set maximumSize(int size);

  int get maximumSize;

  bool get isMaximumSizeReached;

  set spaceNeeded(int cacheToSave);

  int get defaultOriginQuota;

  set defaultOriginQuota(int quota);

  bool calculateUsageForOrigin(SecurityOrigin origin, int usage);

  bool calculateQuotaForOrigin(SecurityOrigin origin, int quota);

  bool calculateRemainingSizeForOriginExcludingCache(SecurityOrigin securityOrigin, ApplicationCache applicationCache, int remainingSize);

  bool storeUpdatedQuotaForOrigin(SecurityOrigin securityOrigin, int quota);

  bool checkOriginQuota(
      ApplicationCacheGroup applicationCacheGroup, ApplicationCache oldCache, ApplicationCache newCache, int totalSpaceNeeded);

  ApplicationCacheGroup cacheGroupForURL(URL url);

  ApplicationCacheGroup fallbackCacheGroupForURL(URL url);

  ApplicationCacheGroup findOrCreateCacheGroup(URL manifestURL);

  void cacheGroupDestroyed(ApplicationCacheGroup applicationCacheGroup);

  void cacheGroupMadeObsolete(ApplicationCacheGroup applicationCacheGroup);

  bool storeNewestCache(ApplicationCacheGroup applicationCacheGroup, [ApplicationCache applicationCache, FailureReason reason]);

  bool store(ApplicationCacheResource applicationCacheResource, ApplicationCache applicationCache);

  bool storeUpdatedType(ApplicationCacheResource applicationCacheResource, ApplicationCache applicationCache);

  void remove(ApplicationCache applicationCache);

  void empty();

  List<SecurityOrigin> get originsWithCache;

  void deleteAllEntries();

  void deleteAllCaches();

  void deleteCacheForOrigin(SecurityOrigin securityOrigin);

  void disUsageForOrigin(SecurityOrigin securityOrigin);

  static int unknownQuota() {
    return -1;
  }

  static noQuota() {}

  ApplicationCache loadCache(int storageID);

  ApplicationCacheGroup loadCacheGroup(URL manifestURL);

  List<URL> get manifestURLs;

  ApplicationCacheGroup findIfMemoryCacheGroup(URL manifestURL);

  bool deleteCacheGroup(String manifestURL);

  void vacuumDatabaseFile();

  bool _store(ApplicationCacheGroup applicationCacheGroup, StorageIDJournal<ApplicationCacheResource> cache);

  bool deleteCacheGroupRecord(String manifestURL);

  bool ensureOriginRecord(SecurityOrigin securityOrigin);

  static bool shouldStoreResourceAsFlatFile(ApplicationCacheResource applicationCacheResource) {}

  void deleteTables();

  bool writeDataToUniqueFileInDirectory(SharedBuffer sharedBuffer, String directory, String outFilename, String fileExtension);

  void loadManifestHostHashes();

  void verifySchemaVersion();

  void openDatabase(bool createIfDoesNotExist);

  bool executeSQLCommand(String sql);

  void checkForMaxSizeReached();

  void checkForDeletedResources();

  int flatFileAreaSize();
}
