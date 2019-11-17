class FetchOptions {}

enum Destination {
  EmptyString,
  Audio,
  Document,
  Embed,
  Font,
  Image,
  Manifest,
  Object,
  Report,
  Script,
  Serviceworker,
  Sharedworker,
  Style,
  Track,
  Video,
  Worker,
  Xslt
}

enum Mode { Navigate, SameOrigin, NoCors, Cors }

enum Credentials {
  Omit,
  SameOrigin,
  Include,
}

enum Cache { Default, NoStore, Reload, NoCache, ForceCache, OnlyIfCached }

enum Redirec { Follow, Error, Manul }
