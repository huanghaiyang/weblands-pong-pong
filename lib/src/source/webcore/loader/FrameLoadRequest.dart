import 'package:weblands_pong_pong/src/source/webcore/dom/Document.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/FrameLoaderTypes.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/SubstituteData.dart';
import 'package:weblands_pong_pong/src/source/webcore/page/SecurityOrigin.dart';
import 'package:weblands_pong_pong/src/source/webcore/platform/network/ResourceRequest.dart';

abstract class FrameLoadRequest {
  factory FrameLoadRequest(
      Document document,
      SecurityOrigin securityOrigin,
      ResourceRequest resourceRequest,
      String frameName,
      LockHistory lockHistory,
      LockBackForwardList lockBackForwardList,
      ShouldSendReferrer sendReferrer,
      AllowNavigationToInvalidURL allowNavigationToInvalidURL,
      NewFrameOpenerPolicy newFrameOpenerPolicy,
      ShouldOpenExternalURLsPolicy shouldOpenExternalURLsPolicy,
      InitiatedByMainFrame initiatedByMainFrame,
      {ShouldReplaceDocumentIfJavaScriptURL shouldReplaceDocumentIfJavaScriptURL =
          ShouldReplaceDocumentIfJavaScriptURL.ReplaceDocumentIfJavaScriptURL,
      String downloadAttribute,
      SystemPreviewInfo systemPreviewInfo,
      SubstituteData substituteData}) {}

  bool get isEmpty;

  Document get requester;

  SecurityOrigin get requesterSecurityOrigin;

  ResourceRequest get resourceRequest;

  String get frameName;

  set frameName(String frameName);

  set shouldCheckNewWindowPolicy(bool shouldCheckNewWindowPolicy);

  bool get shouldCheckNewWindowPolicy;

  set shouldTreatAsContinuingPolicy(bool shouldTreatAsContinuingPolicy);

  SubstituteData get substituteData;

  set substituteData(SubstituteData substituteData);

  bool get hasSubstituteData;

  LockHistory get lockHistory;

  set lockHistory(LockHistory lockHistory);

  LockBackForwardList get lockBackForwardList;

  set lockBackForwardList(LockBackForwardList lockBackForwardList);

  String get clientRedirectSourceForHistory;

  set clientRedirectSourceForHistory(String clientRedirectSourceForHistory);

  ShouldSendReferrer get shouldSendReferrer;

  set shouldSendReferrer(ShouldSendReferrer shouldSendReferrer);

  AllowNavigationToInvalidURL get allowNavigationToInvalidURL;

  set allowNavigationToInvalidURL(AllowNavigationToInvalidURL allowNavigationToInvalidURL);

  NewFrameOpenerPolicy get newFrameOpenerPolicy;

  set newFrameOpenerPolicy(NewFrameOpenerPolicy newFrameOpenerPolicy);

  ShouldReplaceDocumentIfJavaScriptURL get shouldReplaceDocumentIfJavaScriptURL;

  set shpouldREplaceDocumentIfJavaScriptURL(ShouldReplaceDocumentIfJavaScriptURL shouldReplaceDocumentIfJavaScriptURL);

  ShouldOpenExternalURLsPolicy get shouldOpenExternalURLsPolicy;

  set shouldOpenExternalURLsPolicy(ShouldOpenExternalURLsPolicy shouldOpenExternalURLsPolicy);

  String get downloadAttribute;

  set downloadAttribute(String downloadAttribute);

  InitiatedByMainFrame get initialByMainFrame;

  set initialByMainFrame(InitiatedByMainFrame initiatedByMainFrame);

  bool get isSystemPreview;

  set isSystemPreview(bool isSystemPreview);

  SystemPreviewInfo get systemPreviewInfo;

  set systemPreviewInfo(SystemPreviewInfo systemPreviewInfo);

  set isRequestFromClientOrUserInput(bool isRequestFromClientOrUserInput);

  bool get isRequestFromClientOrUserInput;
}
