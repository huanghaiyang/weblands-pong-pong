enum MessageSource {
  XML,
  JS,
  Network,
  ConsoleAPI,
  Storage,
  AppCache,
  Rendering,
  CSS,
  Security,
  ContentBlocker,
  Other,
  Media,
  WebRTC,
  MediaSource
}

enum MessageType {
  Log,
  Dir,
  DirXML,
  Table,
  Trace,
  StartGroup,
  StartGroupCollapsed,
  EndGroup,
  Clear,
  Assert,
  Timing,
  Profiler,
  ProfileEnd,
  Image
}

enum MessageLevel { Log, Warning, Error, Debug, Info }
