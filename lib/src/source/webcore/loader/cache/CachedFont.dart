import 'package:weblands_pong_pong/src/source/webcore/loader/CookieJar.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/cache/CachedResource.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/cache/CachedResourceLoader.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/cache/CachedResourceRequest.dart';
import 'package:weblands_pong_pong/src/source/webcore/platform/SharedBuffer.dart';
import 'package:weblands_pong_pong/src/source/webcore/platform/graphics/FontDescription.dart';
import 'package:weblands_pong_pong/src/source/webcore/platform/graphics/FontPlatformData.dart';
import 'package:weblands_pong_pong/src/source/webcore/platform/graphics/FontSelectionAlgorithm.dart';
import 'package:weblands_pong_pong/src/source/webcore/platform/graphics/FontTaggedSettings.dart';
import 'package:weblands_pong_pong/src/source/webcore/platform/graphics/win/FontCustomPlatformData.dart';
import 'package:weblands_pong_pong/src/source/webcore/platform/text/TextFlags.dart';

abstract class CachedFont extends CachedResource {
  factory CachedFont(CachedResourceRequest cachedResourceRequest, SessionID, CookieJar cookieJar, Type type) {}

  void beginLoadingNeeded(CachedResourceLoader cachedResourceLoader);

  bool get stillNeededLoad;

  bool ensureCustomFontData(String removeURL);

  static FontCustomPlatformData createCustomFontData(SharedBuffer sharedBuffer, String itemInCollection, bool wrapping) {}

  static FontPlatformData platformDataFromCustomData(
      FontCustomPlatformData fontCustomPlatformData,
      FontDescription fontDescription,
      bool bold,
      bool italic,
      FontTaggedSettings<int> featureSetting,
      FontVariantSettings fontVariantSetting,
      FontSelectionSpecifiedCapabilities fontSelectionSpecifiedCapabilities) {}

  void createFont(
      FontDescription fontDescription,
      String remoteURL,
      bool syntheticBold,
      bool syntheticItalic,
      FontTaggedSettings<int> fontFeatureSetting,
      FontVariantSettings fontVariantSettings,
      FontSelectionSpecifiedCapabilities fontSelectionSpecifiedCapabilities);
}
