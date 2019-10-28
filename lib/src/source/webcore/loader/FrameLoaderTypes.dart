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
