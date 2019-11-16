import 'package:weblands_pong_pong/src/source/webcore/bindings/SerializedScriptValue.dart';
import 'package:weblands_pong_pong/src/source/webcore/history/HistoryItem.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/FrameLoaderTypes.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/ShouldTreatAsContinuingLoad.dart';
import 'package:weblands_pong_pong/src/source/webcore/page/Frame.dart';
import 'package:weblands_pong_pong/src/source/webcore/platform/text/StringWithDirection.dart';

enum HistoryUpdateType { UpdateAll, UpdateAllExceptBackForwardList }

abstract class HistoryController {
  void saveScrollPositionAndViewStateToItem(HistoryItem historyItem);

  void clearScrollPositionAndViewState();

  void restoreScrollPositionAndViewState();

  void updateBackForwardListForFragmentScroll();

  void saveDocumentState();

  void saveDocumentAndScrollState();

  void restoreDocumentState();

  void invalidateCurrentItemCachedPage();

  void updateForBackForwardNavigation();

  void updateForReload();

  void updateForStandardLoad({HistoryUpdateType updateType = HistoryUpdateType.UpdateAll});

  void updateForRedirectWithLockedBackForwardList();

  void updateForClientRedirect();

  void updateForCommit();

  void updateForSameDocumentNavigation();

  void updateForFrameLoadCompleted();

  HistoryItem get currentItem;

  set currentItem(HistoryItem historyItem);

  set currentItemTitle(StringWithDirection stringWithDirection);

  bool get currentItemShouldBeReplaced;

  void replaceCurrentItem(HistoryItem historyItem);

  HistoryItem get previousItem;

  set previousItem(HistoryItem historyItem);

  void pushState(SerializedScriptValue serializedScriptValue, String title, String url);

  void replaceState(SerializedScriptValue serializedScriptValue, String title, String url);

  set defersLoading(bool defersLoading);

  bool shouldStopLoadingForHistoryItem(HistoryItem historyItem);

  void goToItem(HistoryItem historyItem, FrameLoadType frameLoadType, ShouldTreatAsContinuingLoad shouldTreatAsContinuingLoad);

  void initializeItem(HistoryItem historyItem);

  HistoryItem createItem();

  HistoryItem createItemTree(Frame targetFrame, bool clipAtTarget);

  void recursiveSetProvisionItem(HistoryItem historyItem, HistoryItem item);

  void recursiveGoToItem(
      HistoryItem historyItem, HistoryItem item, FrameLoadType frameLoadType, ShouldTreatAsContinuingLoad shouldTreatAsContinuingLoad);

  bool isReplaceLoadTypeWithProvisionalItem(FrameLoadType frameLoadType);

  bool isReloadTypeWithProvisionalItem(FrameLoadType frameLoadType);

  void recursiveUpdateForCommit();

  void recursiveUpdateForSameDocumentNavigation();

  bool itemsAreClones(HistoryItem historyItem, HistoryItem item);

  bool currentFramesMatchItem(HistoryItem historyItem);

  void updateBackFrowardListClippedAtTarget(bool doClip);

  void updateCurrentItem();
}
