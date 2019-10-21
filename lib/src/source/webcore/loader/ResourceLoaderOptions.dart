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

class ResourceLoaderOptions {
  ContentSniffingPolicy contentSniffingPolicy;
  DataBufferingPolicy dataBufferingPolicy;
  SendCallbackPolicy sendCallbackPolicy;
  SecurityCheckPolicy securityCheckPolicy;
  CertificateInfoPolicy certificateInfoPolicy;
  ContentSecurityPolicyImposition contentSecurityPolicyImposition;
  DefersLoadingPolicy defersLoadingPolicy;
  CachingPolicy cachingPolicy;
  ClientCredentialPolicy clientCredentialPolicy;
  SameOriginDataURLFlag sameOriginDataURLFlag;
  InitiatorContext initiatorContext;
  ServiceWorkersMode serviceWorkersMode;
  ApplicationCacheMode applicationCacheMode;
  ContentEncodingSniffingPolicy contentEncodingSniffingPolicy;
  PreflightPolicy preflightPolicy;
  LoadedFromOpaqueSource loadedFromOpaqueSource;

  ResourceLoaderOptions(
      this.contentSniffingPolicy,
      this.dataBufferingPolicy,
      this.sendCallbackPolicy,
      this.securityCheckPolicy,
      this.certificateInfoPolicy,
      this.contentSecurityPolicyImposition,
      this.defersLoadingPolicy,
      this.cachingPolicy,
      this.clientCredentialPolicy,
      this.sameOriginDataURLFlag,
      this.initiatorContext,
      this.serviceWorkersMode,
      this.applicationCacheMode,
      this.contentEncodingSniffingPolicy,
      this.preflightPolicy,
      this.loadedFromOpaqueSource);
}
