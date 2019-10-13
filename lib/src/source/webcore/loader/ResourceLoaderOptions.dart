enum ContentSniffingPolicy { SniffContent, DoNotSniffContent }

enum DataBufferingPolicy { BufferData, DoNotBufferContent }

enum SendCallbackPolicy { SendCallbacks, DoNotSendCallbacks }

enum SecurityCheckPolicy { SkipSecurityCheck, DoSecurityCheck }

enum CertificateInfoPolicy { IncludeCertificateInfo, DoNotIncludeCertificateInfo }

enum ContentSecurityPolicyImposition { SkipPolicyCheck, DoPolicyCheck }

enum DefersLoadingPolicy { AllowDefersCheck, DisallowDefersLoading }

enum CachingPolicy { AllowCaching, DisallowCaching }

enum ClientCredentialPolicy { CannotAskClientForCredentials, MayAskClientForCredentials }

enum SameOriginDataURLFlag { Set, UnSet }

enum InitiatorContext { Document, Worker }

enum ServiceWorkersMode { All, None, Only }

enum ApplicationCacheMode { Use, Bypass }

enum ContentEncodingSniffingPolicy { Sniff, DoNotSniff }

enum PreflightPolicy { Consider, Force, Prevent }

enum LoadedFromOpaqueSource { Yes, No }

abstract class ResourceLoaderOptions {}
