import 'package:weblands_pong_pong/src/source/webcore/platform/IPC/Decoder.dart';
import 'package:weblands_pong_pong/src/source/webcore/platform/IPC/Encoder.dart';

enum ObjectContentType { None, Image, Frame, PlugIn }

enum LoadCompletionType { Finish, Cancel }

enum ShouldOpenExternalURLsPolicy { ShouldNotAllow, ShouldAllowExternalSchemes, ShouldAllow }

enum PolicyAction { Use, Download, Ignore, StopAllLoads }

enum FrameLoadType {
  Standard,
  Back,
  Forward,
  IndexedBackForward,
  Reload,
  Same,
  RedirectWithLockedBackForwardList,
  Replace,
  ReloadFromOrigin,
  ReloadExpiredOnly
}

enum LockHistory { Yes, No }

enum LockBackForwardList { Yes, No }

enum AllowNavigationToInvalidURL { Yes, No }

enum HasIncrecureContent { Yes, No }

enum NewFrameOpenerPolicy { Suppress, Allow }

enum NavigationType { LinkClicked, FormSubmitted, BackForward, Reload, FormREsubmitted, Other }

enum InitiatedByMainFrame { Yes, Unknown }

enum ClearProvisionalItemPolicy { PreventDuringUnloadEvents, AlwaysStopLoading }

enum UnloadEventPolicy { UnloadEventPolicyNone, UnloadEventPolicyUnloadOnly, UnloadEventPolicyUnloadAndPageHide }

enum ShouldSendReferrer { MaybeSendReferrer, NeverSendReferrer }

enum ShouldReplaceDocumentIfJavaScriptURL { ReplaceDocumentIfJavaScriptURL, DoNotReplaceDocumentIfJavaScriptURL }

enum WebGLLoadPolicy { WebGLBlockCreation, WebGLAllowCreation, WebGLPendingCreation }

class SystemPreviewInfo {
  GlobalFrameIdentifier globalFrameID;
  IntRect previewRect;
  bool isPreview;
  void encode(Encoder encoder) {}
  SystemPreviewInfo decode(Decoder decoder) {}
}
